/**
  ******************************************************************************
  * @file    stm32u5xx_hal_pcd_ex.c
  * @author  MCD Application Team
  * @brief   PCD Extended HAL module driver.
  *          This file provides firmware functions to manage the following
  *          functionalities of the USB Peripheral Controller:
  *           + Extended features functions
  *
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm32u5xx_hal.h"

/** @addtogroup STM32U5xx_HAL_Driver
  * @{
  */

/** @defgroup PCDEx PCDEx
  * @brief PCD Extended HAL module driver
  * @{
  */

#ifdef HAL_PCD_MODULE_ENABLED

#if defined (USB_OTG_FS) || defined (USB_OTG_HS) || defined (USB_DRD_FS)
/* Private types -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private constants ---------------------------------------------------------*/
/* Private macros ------------------------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Exported functions --------------------------------------------------------*/

/** @defgroup PCDEx_Exported_Functions PCDEx Exported Functions
  * @{
  */

/** @defgroup PCDEx_Exported_Functions_Group1 Peripheral Control functions
  * @brief    PCDEx control functions
  *
@verbatim
 ===============================================================================
                 ##### Extended features functions #####
 ===============================================================================
    [..]  This section provides functions allowing to:
      (+) Update FIFO configuration

@endverbatim
  * @{
  */
#if defined (USB_OTG_FS) || defined (USB_OTG_HS)
/**
  * @brief  Set Tx FIFO
  * @param  hpcd PCD handle
  * @param  fifo The number of Tx fifo
  * @param  size Fifo size
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_SetTxFiFo(PCD_HandleTypeDef *hpcd, uint8_t fifo, uint16_t size)
{
  uint8_t i;
  uint32_t Tx_Offset;

  /*  TXn min size = 16 words. (n  : Transmit FIFO index)
      When a TxFIFO is not used, the Configuration should be as follows:
          case 1 :  n > m    and Txn is not used    (n,m  : Transmit FIFO indexes)
         --> Txm can use the space allocated for Txn.
         case2  :  n < m    and Txn is not used    (n,m  : Transmit FIFO indexes)
         --> Txn should be configured with the minimum space of 16 words
     The FIFO is used optimally when used TxFIFOs are allocated in the top
         of the FIFO.Ex: use EP1 and EP2 as IN instead of EP1 and EP3 as IN ones.
     When DMA is used 3n * FIFO locations should be reserved for internal DMA registers */

  Tx_Offset = hpcd->Instance->GRXFSIZ;

  if (fifo == 0U)
  {
    hpcd->Instance->DIEPTXF0_HNPTXFSIZ = ((uint32_t)size << 16) | Tx_Offset;
  }
  else
  {
    Tx_Offset += (hpcd->Instance->DIEPTXF0_HNPTXFSIZ) >> 16;
    for (i = 0U; i < (fifo - 1U); i++)
    {
      Tx_Offset += (hpcd->Instance->DIEPTXF[i] >> 16);
    }

    /* Multiply Tx_Size by 2 to get higher performance */
    hpcd->Instance->DIEPTXF[fifo - 1U] = ((uint32_t)size << 16) | Tx_Offset;
  }

  return HAL_OK;
}

/**
  * @brief  Set Rx FIFO
  * @param  hpcd PCD handle
  * @param  size Size of Rx fifo
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_SetRxFiFo(PCD_HandleTypeDef *hpcd, uint16_t size)
{
  hpcd->Instance->GRXFSIZ = size;

  return HAL_OK;
}

/**
  * @brief  Activate LPM feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_ActivateLPM(PCD_HandleTypeDef *hpcd)
{
  USB_OTG_GlobalTypeDef *USBx = hpcd->Instance;

  hpcd->lpm_active = 1U;
  hpcd->LPM_State = LPM_L0;
  USBx->GINTMSK |= USB_OTG_GINTMSK_LPMINTM;
  USBx->GLPMCFG |= (USB_OTG_GLPMCFG_LPMEN | USB_OTG_GLPMCFG_LPMACK | USB_OTG_GLPMCFG_ENBESL);

  return HAL_OK;
}

/**
  * @brief  Deactivate LPM feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_DeActivateLPM(PCD_HandleTypeDef *hpcd)
{
  USB_OTG_GlobalTypeDef *USBx = hpcd->Instance;

  hpcd->lpm_active = 0U;
  USBx->GINTMSK &= ~USB_OTG_GINTMSK_LPMINTM;
  USBx->GLPMCFG &= ~(USB_OTG_GLPMCFG_LPMEN | USB_OTG_GLPMCFG_LPMACK | USB_OTG_GLPMCFG_ENBESL);

  return HAL_OK;
}


/**
  * @brief  Handle BatteryCharging Process.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
void HAL_PCDEx_BCD_VBUSDetect(PCD_HandleTypeDef *hpcd)
{
  USB_OTG_GlobalTypeDef *USBx = hpcd->Instance;
  uint32_t tickstart = HAL_GetTick();

  /* Enable DCD : Data Contact Detect */
  USBx->GCCFG |= USB_OTG_GCCFG_DCDEN;

  /* Wait for Min DCD Timeout */
  HAL_Delay(300U);

#if defined (STM32U575xx) || defined (STM32U585xx)
  /* Check Detect flag */
  if ((USBx->GCCFG & USB_OTG_GCCFG_DCDET) == USB_OTG_GCCFG_DCDET)
  {
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_CONTACT_DETECTION);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_CONTACT_DETECTION);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }
#endif /* defined (STM32U575xx) || defined (STM32U585xx) */

  /* Primary detection: checks if connected to Standard Downstream Port
  (without charging capability) */
  USBx->GCCFG &= ~USB_OTG_GCCFG_DCDEN;
  HAL_Delay(50U);
  USBx->GCCFG |= USB_OTG_GCCFG_PDEN;
  HAL_Delay(50U);

#if defined (STM32U575xx) || defined (STM32U585xx)
  if ((USBx->GCCFG & USB_OTG_GCCFG_PDET) == 0U)
#else
  if ((USBx->GCCFG & USB_OTG_GCCFG_CHGDET) == 0U)
#endif /* defined (STM32U575xx) || defined (STM32U585xx) */
  {
    /* Case of Standard Downstream Port */
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_STD_DOWNSTREAM_PORT);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_STD_DOWNSTREAM_PORT);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }
  else
  {
    /* start secondary detection to check connection to Charging Downstream
    Port or Dedicated Charging Port */
    USBx->GCCFG &= ~(USB_OTG_GCCFG_PDEN);
    HAL_Delay(50U);
    USBx->GCCFG |= USB_OTG_GCCFG_SDEN;
    HAL_Delay(50U);

#if defined (STM32U575xx) || defined (STM32U585xx)
    if ((USBx->GCCFG & USB_OTG_GCCFG_SDET) == USB_OTG_GCCFG_SDET)
#else
    if ((USBx->GCCFG & USB_OTG_GCCFG_FSVPLUS) == USB_OTG_GCCFG_FSVPLUS)
#endif /* defined (STM32U575xx) || defined (STM32U585xx) */
    {
      /* case Dedicated Charging Port  */
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
      hpcd->BCDCallback(hpcd, PCD_BCD_DEDICATED_CHARGING_PORT);
#else
      HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_DEDICATED_CHARGING_PORT);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
    }
    else
    {
      /* case Charging Downstream Port */
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
      hpcd->BCDCallback(hpcd, PCD_BCD_CHARGING_DOWNSTREAM_PORT);
#else
      HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_CHARGING_DOWNSTREAM_PORT);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
    }
  }

  /* Battery Charging capability discovery finished */
  (void)HAL_PCDEx_DeActivateBCD(hpcd);

  /* Check for the Timeout, else start USB Device */
  if ((HAL_GetTick() - tickstart) > 1000U)
  {
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_ERROR);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_ERROR);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }
  else
  {
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_DISCOVERY_COMPLETED);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_DISCOVERY_COMPLETED);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }
}

/**
  * @brief  Activate BatteryCharging feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_ActivateBCD(PCD_HandleTypeDef *hpcd)
{
  USB_OTG_GlobalTypeDef *USBx = hpcd->Instance;

  USBx->GCCFG &= ~(USB_OTG_GCCFG_PDEN);
  USBx->GCCFG &= ~(USB_OTG_GCCFG_SDEN);

#if defined (STM32U575xx) || defined (STM32U585xx)
  /* Power Down USB transceiver  */
  USBx->GCCFG &= ~(USB_OTG_GCCFG_PWRDWN);

  /* Enable Battery charging */
  USBx->GCCFG |= USB_OTG_GCCFG_BCDEN;
#endif /* defined (STM32U575xx) || defined (STM32U585xx) */

  hpcd->battery_charging_active = 1U;

  return HAL_OK;
}

/**
  * @brief  Deactivate BatteryCharging feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_DeActivateBCD(PCD_HandleTypeDef *hpcd)
{
  USB_OTG_GlobalTypeDef *USBx = hpcd->Instance;

  USBx->GCCFG &= ~(USB_OTG_GCCFG_SDEN);
  USBx->GCCFG &= ~(USB_OTG_GCCFG_PDEN);

#if defined (STM32U575xx) || defined (STM32U585xx)
  /* Disable Battery charging */
  USBx->GCCFG &= ~(USB_OTG_GCCFG_BCDEN);
#endif /* defined (STM32U575xx) || defined (STM32U585xx) */

  hpcd->battery_charging_active = 0U;

  return HAL_OK;
}

#endif /* defined (USB_OTG_FS) || defined (USB_OTG_HS) */
#if defined (USB_DRD_FS)
/**
  * @brief  Configure PMA for EP
  * @param  hpcd  Device instance
  * @param  ep_addr endpoint address
  * @param  ep_kind endpoint Kind
  *                  USB_SNG_BUF: Single Buffer used
  *                  USB_DBL_BUF: Double Buffer used
  * @param  pmaadress: EP address in The PMA: In case of single buffer endpoint
  *                   this parameter is 16-bit value providing the address
  *                   in PMA allocated to endpoint.
  *                   In case of double buffer endpoint this parameter
  *                   is a 32-bit value providing the endpoint buffer 0 address
  *                   in the LSB part of 32-bit value and endpoint buffer 1 address
  *                   in the MSB part of 32-bit value.
  * @retval HAL status
  */

HAL_StatusTypeDef  HAL_PCDEx_PMAConfig(PCD_HandleTypeDef *hpcd, uint16_t ep_addr,
                                       uint16_t ep_kind, uint32_t pmaadress)
{
  PCD_EPTypeDef *ep;

  /* Initialize ep structure */
  if ((0x80U & ep_addr) == 0x80U)
  {
    ep = &hpcd->IN_ep[ep_addr & EP_ADDR_MSK];
  }
  else
  {
    ep = &hpcd->OUT_ep[ep_addr];
  }

  /* Here we check if the endpoint is single or double Buffer*/
  if (ep_kind == PCD_SNG_BUF)
  {
    /* Single Buffer */
    ep->doublebuffer = 0U;

    /* Configure the PMA */
    ep->pmaadress = (uint16_t)pmaadress;
  }
#if (USE_USB_DOUBLE_BUFFER == 1U)
  else /* USB_DBL_BUF */
  {
    /* Double Buffer Endpoint */
    ep->doublebuffer = 1U;

    /* Configure the PMA */
    ep->pmaaddr0 = (uint16_t)(pmaadress & 0xFFFFU);
    ep->pmaaddr1 = (uint16_t)((pmaadress & 0xFFFF0000U) >> 16);
  }
#endif /* (USE_USB_DOUBLE_BUFFER == 1U) */

  return HAL_OK;
}

/**
  * @brief  Activate BatteryCharging feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_ActivateBCD(PCD_HandleTypeDef *hpcd)
{
  USB_DRD_TypeDef *USBx = hpcd->Instance;
  hpcd->battery_charging_active = 1U;

  USBx->BCDR &= ~(USB_BCDR_PDEN);
  USBx->BCDR &= ~(USB_BCDR_SDEN);

  /* Enable BCD feature */
  USBx->BCDR |= USB_BCDR_BCDEN;

  return HAL_OK;
}

/**
  * @brief  Deactivate BatteryCharging feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_DeActivateBCD(PCD_HandleTypeDef *hpcd)
{
  USB_DRD_TypeDef *USBx = hpcd->Instance;
  hpcd->battery_charging_active = 0U;

  /* Disable BCD feature */
  USBx->BCDR &= ~(USB_BCDR_BCDEN);

  return HAL_OK;
}

/**
  * @brief  Handle BatteryCharging Process.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
void HAL_PCDEx_BCD_VBUSDetect(PCD_HandleTypeDef *hpcd)
{
  USB_DRD_TypeDef *USBx = hpcd->Instance;
  uint32_t tickstart = HAL_GetTick();

  /* Wait for Min DCD Timeout */
  HAL_Delay(350U);

  /* Primary detection: checks if connected to Standard Downstream Port
  (without charging capability) */
  USBx->BCDR |= (USB_BCDR_PDEN);
  HAL_Delay(50U);

  /* If Charger detect ? */
  if ((USBx->BCDR & USB_BCDR_PDET) == USB_BCDR_PDET)
  {
    /* Start secondary detection to check connection to Charging Downstream
    Port or Dedicated Charging Port */
    USBx->BCDR &= ~(USB_BCDR_PDEN);
    HAL_Delay(50U);
    USBx->BCDR |= (USB_BCDR_SDEN);
    HAL_Delay(50U);

    /* If CDP ? */
    if ((USBx->BCDR & USB_BCDR_SDET) == USB_BCDR_SDET)
    {
      /* Dedicated Downstream Port DCP */
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
      hpcd->BCDCallback(hpcd, PCD_BCD_DEDICATED_CHARGING_PORT);
#else
      HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_DEDICATED_CHARGING_PORT);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
    }
    else
    {
      /* Charging Downstream Port CDP */
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
      hpcd->BCDCallback(hpcd, PCD_BCD_CHARGING_DOWNSTREAM_PORT);
#else
      HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_CHARGING_DOWNSTREAM_PORT);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
    }
  }
  else /* NO */
  {
    /* Standard Downstream Port */
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_STD_DOWNSTREAM_PORT);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_STD_DOWNSTREAM_PORT);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }

  /* Battery Charging capability discovery finished Start Enumeration */
  (void)HAL_PCDEx_DeActivateBCD(hpcd);

  /* Check for the Timeout, else start USB Device */
  if ((HAL_GetTick() - tickstart) > 1000U)
  {
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_ERROR);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_ERROR);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }
  else
  {
#if (USE_HAL_PCD_REGISTER_CALLBACKS == 1U)
    hpcd->BCDCallback(hpcd, PCD_BCD_DISCOVERY_COMPLETED);
#else
    HAL_PCDEx_BCD_Callback(hpcd, PCD_BCD_DISCOVERY_COMPLETED);
#endif /* USE_HAL_PCD_REGISTER_CALLBACKS */
  }
}

/**
  * @brief  Activate LPM feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_ActivateLPM(PCD_HandleTypeDef *hpcd)
{

  USB_DRD_TypeDef *USBx = hpcd->Instance;
  hpcd->lpm_active = 1U;
  hpcd->LPM_State = LPM_L0;

  USBx->LPMCSR |= USB_LPMCSR_LMPEN;
  USBx->LPMCSR |= USB_LPMCSR_LPMACK;

  return HAL_OK;
}

/**
  * @brief  Deactivate LPM feature.
  * @param  hpcd PCD handle
  * @retval HAL status
  */
HAL_StatusTypeDef HAL_PCDEx_DeActivateLPM(PCD_HandleTypeDef *hpcd)
{
  USB_DRD_TypeDef *USBx = hpcd->Instance;

  hpcd->lpm_active = 0U;

  USBx->LPMCSR &= ~(USB_LPMCSR_LMPEN);
  USBx->LPMCSR &= ~(USB_LPMCSR_LPMACK);

  return HAL_OK;
}
#endif /* defined (USB_DRD_FS) */

/**
  * @brief  Send LPM message to user layer callback.
  * @param  hpcd PCD handle
  * @param  msg LPM message
  * @retval HAL status
  */
__weak void HAL_PCDEx_LPM_Callback(PCD_HandleTypeDef *hpcd, PCD_LPM_MsgTypeDef msg)
{
  /* Prevent unused argument(s) compilation warning */
  UNUSED(hpcd);
  UNUSED(msg);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_PCDEx_LPM_Callback could be implemented in the user file
   */
}

/**
  * @brief  Send BatteryCharging message to user layer callback.
  * @param  hpcd PCD handle
  * @param  msg LPM message
  * @retval HAL status
  */
__weak void HAL_PCDEx_BCD_Callback(PCD_HandleTypeDef *hpcd, PCD_BCD_MsgTypeDef msg)
{
  /* Prevent unused argument(s) compilation warning */
  UNUSED(hpcd);
  UNUSED(msg);

  /* NOTE : This function should not be modified, when the callback is needed,
            the HAL_PCDEx_BCD_Callback could be implemented in the user file
   */
}

/**
  * @}
  */

/**
  * @}
  */
#endif /* defined (USB_OTG_FS) || defined (USB_OTG_HS) || defined (USB_DRD_FS) */
#endif /* HAL_PCD_MODULE_ENABLED */

/**
  * @}
  */

/**
  * @}
  */
