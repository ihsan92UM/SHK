# SensorTile.BOXPRO BSP Demo

## Requirements

#### Hardware
* SensorTileBox.Pro
#### Software
* STM32CubeIDE 1.19.0
  * [FP-SNS-STBOX1](https://github.com/STMicroelectronics/fp-sns-stbox1)


# Getting Started
Download the [FP-SNS-STBOX1](https://github.com/STMicroelectronics/fp-sns-stbox1) in a favorable folder, i.e., in STMCube repository. This Function pack can also be installed from the STM32Cube IDE; for that goto ```help > Configuration tools > Manage embedded software packages``` and search for this function pack. Once installed it can be found under ```/STM32Cube/Repository/Packs/STMicroelectronics```. After this create a simple project as usual using STM32CubeMX with only neccessary pheripheral needed, if not later extra pheripherals has to be deleted to avoid code congestion and errors. This would be at the begging of the setup.
```
Project Explorer
└── STTS22H
    ├── Includes
    ├── Core
    ├── Drivers
    │   ├── CMSIS
    │   └── STM32U5xx_HAL_Driver
    └── Debug
        ├── .
        ├── .
        ├── .  STTS22H.ioc
        └── .
```

After this add a folder named ```BSP``` and two folders under it named ```Components``` & ```SensorTileBoxPro```

```
Project Explorer
Project Explorer
└── STTS22H
    ├── Includes
    ├── Core
    ├── Drivers
    │   ├── BSP
    │   │   ├── Components
    │   │   └── SensorTileBoxPro
    │   ├── CMSIS
    │   └── STM32U5xx_HAL_Driver
    └── Debug
        ├── .
        ├── .
        ├── .  STTS22H.ioc
        └── .
```

Now in these folders copy the neccessary files found from the [FP-SNS-STBOX1](https://github.com/STMicroelectronics/fp-sns-stbox1) for that goto 

```C:\Users\username\STM32Cube\Repository\Packs\STMicroelectronics\FP-SNS-STBOX1\2.0.0\Drivers\BSP```

and copy only these two folders ```Components``` & ```SensorTileBoxPro``` and paste them inside the projects ```/Drivers/BSP/```folder. Now keep only necessary files, i.e., to use all the environmental and Motion sensors, these are the minimum files needed.

```
/
└── Drivers/
    └── BSP/
        ├── Components/
        │   ├── Common/
        │   ├── lis2du12/
        │   ├── lis2mdl/
        │   ├── lps22df/
        │   ├── lsm6dsv16x/
        │   └── stts22h/
        └── SensorTileBoxPro/
            ├── SensorTileBoxPro.c"
            ├── SensorTileBoxPro.h"
            ├── SensorTileBoxPro_bus.c"
            ├── SensorTileBoxPro_bus.h"
            ├── SensorTileBoxPro_env_sensors.c"
            ├── SensorTileBoxPro_env_sensors.h"
            ├── SensorTileBoxPro_motion_sensors.c"
            └── SensorTileBoxPro_motion_sensors.h"
```

Now inside the ```/Core/Inc/``` paste these two files that was available under the ```SensorTileBoxPro/``` folder inside the ```FP-SNS-STBOX1```
```
/
└── Core/
    └── Inc/
        ├── main.h
        ├── .
        ├── SensorTileBoxPro_conf.h
        ├── SensorTileBoxPro_errno.h
        ├── .
        └── .
```
## Editing the main.c and main.h

add this code instead of default generated code by STM32CubeMX. This code is found under 

```C:\Users\username\STM32Cube\Repository\Packs\STMicroelectronics\FP-SNS-STBOX1\2.0.0\Projects\STEVAL-MKBOXPRO\Applications\SDDataLogFileX\Core\Src\main.c```

>>***Note:*** Make sure to delete the RTOS Part i.e., includes related to threadX

```
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include "SensorTileBoxPro.h"
#include "SensorTileBoxPro_env_sensors.h"
#include "SensorTileBoxPro_motion_sensors.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define STTS22H_ODR 1.0f /* ODR = 1.0Hz */
#define LSM6DSV16X_ACC_ODR 120.0f /* ODR = 120Hz */
#define LSM6DSV16X_ACC_FS 4 /* FS = 4g */
#define LSM6DSV16X_GYRO_ODR 120.0f /* ODR = 120Hz */
#define LSM6DSV16X_GYRO_FS 2000 /* FS = 2000dps */
#define LPS22DF_ODR 25.0f /* ODR = 25.0Hz */
#define LIS2MDL_MAG_ODR 100.0f /* ODR = 100Hz */
#define LIS2MDL_MAG_FS 50 /* FS = 50gauss */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_ICACHE_Init(void);
static void InitMemsSensors(void);

static FinishGood_TypeDef BSP_CheckFinishGood(void);

/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE END SysInit */

  /* Initialize ICache */
  MX_ICACHE_Init();
  /* USER CODE BEGIN 2 */

  /* USER CODE BEGIN SysInit */
  BSP_LED_Init(LED_GREEN);
  BSP_LED_Init(LED_RED);
  /* RED is activated by default */
  BSP_LED_Off(LED_RED);

  /* Enable Button in Interrupt mode */
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_EXTI);

  /* Init UART for printf */
  BSP_COM_Init(COM1);

  /* Init Mems Sensors */
  InitMemsSensors();
  if (BSP_ENV_SENSOR_Init(STTS22H_0, ENV_TEMPERATURE) != BSP_ERROR_NONE)
  {
      Error_Handler(); // Handle init failure
  }
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
      float temperature = 0.0f;

      if (BSP_ENV_SENSOR_GetValue(STTS22H_0, ENV_TEMPERATURE, &temperature) == BSP_ERROR_NONE)
      {
          printf("Temperature: %.2f °C\r\n", temperature);
      }
      else
      {
          printf("Error reading temperature\r\n");
      }

      HAL_Delay(1000); // Wait 1 second

  }
  /* USER CODE END 3 */
}

/**
* @brief  Print Bunner
* @param  None
* @retval None
*/


/**
* @brief  Init Mems Sensors
* @param  None
* @retval None
*/
static void InitMemsSensors(void)
{
   GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOI_CLK_ENABLE();

  /*Configure GPIO pin Output Level 5-> BSP_LSM6DSV16X_CS_PIN */
  HAL_GPIO_WritePin(GPIOI, GPIO_PIN_5, GPIO_PIN_SET);

  /*Configure GPIO pins : PI5 */
  GPIO_InitStruct.Pin = GPIO_PIN_5;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);

#ifndef ALL_SENSORS_I2C
  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOI, GPIO_PIN_0, GPIO_PIN_RESET);

  /*Configure GPIO pins : PI0 */
  GPIO_InitStruct.Pin = GPIO_PIN_0;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);
#endif

  /* Magneto */
  if(BSP_MOTION_SENSOR_Init(LIS2MDL_0, MOTION_MAGNETO)==BSP_ERROR_NONE) {
    if(BSP_MOTION_SENSOR_SetOutputDataRate(LIS2MDL_0, MOTION_MAGNETO, LIS2MDL_MAG_ODR)==BSP_ERROR_NONE) {
      if(BSP_MOTION_SENSOR_SetFullScale(LIS2MDL_0, MOTION_MAGNETO, LIS2MDL_MAG_FS)==BSP_ERROR_NONE) {
        printf("LIS2MDL_0 OK\r\n");
      } else {
    	  printf("Error: LIS2MDL_0 KO\r\n");
      }
    }else {
    	printf("Error: LIS2MDL_0 KO\r\n");
    }
  } else {
	  printf("Error: LIS2MDL_0 KO\r\n");
  }

  /* Acc/Gyro */
  if(BSP_MOTION_SENSOR_Init(LSM6DSV16X_0, MOTION_ACCELERO | MOTION_GYRO)==BSP_ERROR_NONE) {
    if(BSP_MOTION_SENSOR_SetOutputDataRate(LSM6DSV16X_0, MOTION_ACCELERO, LSM6DSV16X_ACC_ODR)==BSP_ERROR_NONE) {
      if(BSP_MOTION_SENSOR_SetFullScale(LSM6DSV16X_0, MOTION_ACCELERO, LSM6DSV16X_ACC_FS)==BSP_ERROR_NONE) {
        if(BSP_MOTION_SENSOR_SetOutputDataRate(LSM6DSV16X_0, MOTION_GYRO, LSM6DSV16X_GYRO_ODR)==BSP_ERROR_NONE) {
          if(BSP_MOTION_SENSOR_SetFullScale(LSM6DSV16X_0, MOTION_GYRO, LSM6DSV16X_GYRO_FS)==BSP_ERROR_NONE) {
        	  printf("LSM6DSV16X_0 OK\r\n");
          } else {
        	  printf("Error: LSM6DSV16X_0 KO\r\n");
          }
        } else {
        	printf("Error: LSM6DSV16X_0 KO\r\n");
        }
      } else {
    	  printf("Error: LSM6DSV16X_0 KO\r\n");
      }
    } else {
    	printf("Error: LSM6DSV16X_0 KO\r\n");
    }
  } else {
	  printf("Error: LSM6DSV16X_0 KO\r\n");
  }

  /* Pressure */
  if(BSP_ENV_SENSOR_Init(LPS22DF_0, ENV_PRESSURE)==BSP_ERROR_NONE) {
    if(BSP_ENV_SENSOR_SetOutputDataRate(LPS22DF_0, ENV_PRESSURE, LPS22DF_ODR)==BSP_ERROR_NONE) {
    	printf("LPS22DF_0 OK\r\n");
    } else {
    	printf("Error: LPS22DF_0 KO\r\n");
    }
  } else {
	  printf("Error: LPS22DF_0 KO\r\n");
  }

  /* Temperature  */
  if(BSP_ENV_SENSOR_Init(STTS22H_0, ENV_TEMPERATURE)==BSP_ERROR_NONE) {
    if(BSP_ENV_SENSOR_SetOutputDataRate(STTS22H_0, ENV_TEMPERATURE, STTS22H_ODR)==BSP_ERROR_NONE) {
    	printf("STTS22H_0 OK\r\n");
    } else {
    	printf("Error: STTS22H_0 KO\r\n");
    }
  } else {
	  printf("Error: STTS22H_0 KO\r\n");
  }
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{

  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48|RCC_OSCILLATORTYPE_HSI
                              |RCC_OSCILLATORTYPE_LSI|RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.LSIState = RCC_LSI_ON;
  RCC_OscInitStruct.LSIDiv = RCC_LSI_DIV1;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMBOOST = RCC_PLLMBOOST_DIV1;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 10;
  RCC_OscInitStruct.PLL.PLLP = 1;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  RCC_OscInitStruct.PLL.PLLR = 1;
  RCC_OscInitStruct.PLL.PLLRGE = RCC_PLLVCIRANGE_1;
  RCC_OscInitStruct.PLL.PLLFRACN = 0;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
	  Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2
                              |RCC_CLOCKTYPE_PCLK3;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB3CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
	  Error_Handler();
  }

    /** Initializes the common periph clock
  */
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_MDF1|RCC_PERIPHCLK_ADF1
                              |RCC_PERIPHCLK_ADCDAC;
  PeriphClkInit.Mdf1ClockSelection = RCC_MDF1CLKSOURCE_PLL3;
  PeriphClkInit.Adf1ClockSelection = RCC_ADF1CLKSOURCE_PLL3;
  PeriphClkInit.AdcDacClockSelection = RCC_ADCDACCLKSOURCE_PLL2;
  PeriphClkInit.PLL3.PLL3Source = RCC_PLLSOURCE_HSE;
  PeriphClkInit.PLL3.PLL3M = 2;
  PeriphClkInit.PLL3.PLL3N = 48;
  PeriphClkInit.PLL3.PLL3P = 2;
  PeriphClkInit.PLL3.PLL3Q = 25;
  PeriphClkInit.PLL3.PLL3R = 2;
  PeriphClkInit.PLL3.PLL3RGE = RCC_PLLVCIRANGE_1;
  PeriphClkInit.PLL3.PLL3FRACN = 0;
  PeriphClkInit.PLL3.PLL3ClockOut = RCC_PLL3_DIVQ;
  PeriphClkInit.PLL2.PLL2Source = RCC_PLLSOURCE_HSE;
  PeriphClkInit.PLL2.PLL2M = 2;
  PeriphClkInit.PLL2.PLL2N = 48;
  PeriphClkInit.PLL2.PLL2P = 2;
  PeriphClkInit.PLL2.PLL2Q = 7;
  PeriphClkInit.PLL2.PLL2R = 25;
  PeriphClkInit.PLL2.PLL2RGE = RCC_PLLVCIRANGE_1;
  PeriphClkInit.PLL2.PLL2FRACN = 0;
  PeriphClkInit.PLL2.PLL2ClockOut = RCC_PLL2_DIVR;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
	  Error_Handler();
  }
}

/**
  * @brief ICACHE Initialization Function
  * @param None
  * @retval None
  */
static void MX_ICACHE_Init(void)
{

  /* USER CODE BEGIN ICACHE_Init 0 */

  /* USER CODE END ICACHE_Init 0 */

  /* USER CODE BEGIN ICACHE_Init 1 */

  /* USER CODE END ICACHE_Init 1 */
  /** Enable instruction cache in 1-way (direct mapped cache)
  */
  if (HAL_ICACHE_ConfigAssociativityMode(ICACHE_1WAY) != HAL_OK)
  {
	  Error_Handler();
  }
  if (HAL_ICACHE_Enable() != HAL_OK)
  {
	  Error_Handler();
  }
  /* USER CODE BEGIN ICACHE_Init 2 */

  /* USER CODE END ICACHE_Init 2 */

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM6 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM6) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @param char *File Name
  * @param int32_t Line number
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
/**
 * @brief  This method the Finish Good type
 * @retval FinishGood value
 */
static FinishGood_TypeDef BSP_CheckFinishGood(void)
{

  #define ST25_ADDR_DATA_I2C                ((uint8_t)0xAE)
  #define ST25_ICREF_REG                    ((uint16_t)0x0017)
  /* ST25DVxxKC 4Kbits ICref */
  #define IAM_ST25DV04KC                        0x50U
  /* ST25DVxxKC 16/64Kbits ICref */
  #define IAM_ST25DV64KC                        0x51U
  /* @brief ST25DV 4Kbits ICref */
  #define IAM_ST25DV04                        0x24
  /* @brief ST25DV 16/64Kbits ICref */
  #define IAM_ST25DV64                        0x26

  FinishGood_TypeDef FinishGood = FINISH_ERROR;
  uint8_t nfctag_id;
  BSP_ST25DV_I2C_INIT();

  BSP_ST25DV_I2C_READ_REG_16(ST25_ADDR_DATA_I2C, ST25_ICREF_REG, &nfctag_id, 1);

  if((nfctag_id == IAM_ST25DV04KC) | (nfctag_id == IAM_ST25DV64KC)) {
    FinishGood = FINISHB;
  } else if((nfctag_id == IAM_ST25DV04) | (nfctag_id == IAM_ST25DV64)) {
    FinishGood = FINISHA;
  }

  BSP_ST25DV_I2C_DEINIT();

  #undef ST25_ADDR_DATA_I2C
  #undef ST25_ICREF_REG
  #undef IAM_ST25DV04KC
  #undef IAM_ST25DV64KC
  #undef IAM_ST25DV04
  #undef IAM_ST25DV64

  return FinishGood;
}


int _write(int file, char *ptr, int len)
{
  (void)file;
  int DataIdx;

  for (DataIdx = 0; DataIdx < len; DataIdx++)
  {
    ITM_SendChar(*ptr++);

  }
  return len;
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

```

also edit the main.h file as 

```
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32u5xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "SensorTileBoxPro.h"
/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define V4_GOOD_Pin GPIO_PIN_6
#define V4_GOOD_GPIO_Port GPIOI
#define WIFI_FLOW_Pin GPIO_PIN_15
#define WIFI_FLOW_GPIO_Port GPIOG
#define SPI_SEN_CS_G_Pin GPIO_PIN_5
#define SPI_SEN_CS_G_GPIO_Port GPIOI
#define MCU_SEL_Pin GPIO_PIN_0
#define MCU_SEL_GPIO_Port GPIOI
#define LED3_Pin GPIO_PIN_12
#define LED3_GPIO_Port GPIOH
#define MDF1_SDI3_Pin GPIO_PIN_4
#define MDF1_SDI3_GPIO_Port GPIOE
#define SPI_SEN_CS_A_Pin GPIO_PIN_7
#define SPI_SEN_CS_A_GPIO_Port GPIOI
#define V_BT_E1_Pin GPIO_PIN_1
#define V_BT_E1_GPIO_Port GPIOE
#define BLE_RST_Pin GPIO_PIN_4
#define BLE_RST_GPIO_Port GPIOD
#define EN_SD_Pin GPIO_PIN_10
#define EN_SD_GPIO_Port GPIOH
#define GPIO_JP4_Pin GPIO_PIN_5
#define GPIO_JP4_GPIO_Port GPIOE
#define WC_INTB_Pin GPIO_PIN_3
#define WC_INTB_GPIO_Port GPIOE
#define WC_INTB_EXTI_IRQn EXTI3_IRQn
#define SW2_Pin GPIO_PIN_0
#define SW2_GPIO_Port GPIOE
#define SW2_EXTI_IRQn EXTI0_IRQn
#define MDF1_SDI0_Pin GPIO_PIN_3
#define MDF1_SDI0_GPIO_Port GPIOD
#define LED2_Pin GPIO_PIN_11
#define LED2_GPIO_Port GPIOH
#define SEL_SD_V_Pin GPIO_PIN_8
#define SEL_SD_V_GPIO_Port GPIOH
#define SW1_Pin GPIO_PIN_13
#define SW1_GPIO_Port GPIOC
#define SW1_EXTI_IRQn EXTI13_IRQn
#define MAG_DRDY_Pin GPIO_PIN_6
#define MAG_DRDY_GPIO_Port GPIOE
#define MAG_DRDY_EXTI_IRQn EXTI6_IRQn
#define SPI_DUT_CS2_Pin GPIO_PIN_12
#define SPI_DUT_CS2_GPIO_Port GPIOG
#define SW_ON_Pin GPIO_PIN_8
#define SW_ON_GPIO_Port GPIOF
#define ACC_INT1_Pin GPIO_PIN_2
#define ACC_INT1_GPIO_Port GPIOF
#define ACC_INT1_EXTI_IRQn EXTI2_IRQn
#define BT_BOOT_Pin GPIO_PIN_1
#define BT_BOOT_GPIO_Port GPIOD
#define WC_RSTB_Pin GPIO_PIN_7
#define WC_RSTB_GPIO_Port GPIOF
#define USB_ENUM_LED_Pin GPIO_PIN_9
#define USB_ENUM_LED_GPIO_Port GPIOF
#define MDF1_CCK_Pin GPIO_PIN_10
#define MDF1_CCK_GPIO_Port GPIOF
#define LED1_Pin GPIO_PIN_6
#define LED1_GPIO_Port GPIOF
#define SPI_DUT_CS_Pin GPIO_PIN_1
#define SPI_DUT_CS_GPIO_Port GPIOG
#define DIL_INT2_Pin GPIO_PIN_6
#define DIL_INT2_GPIO_Port GPIOG
#define LOCK_1v8_Pin GPIO_PIN_0
#define LOCK_1v8_GPIO_Port GPIOC
#define BUTTON_PWR_Pin GPIO_PIN_1
#define BUTTON_PWR_GPIO_Port GPIOC
#define BUTTON_PWR_EXTI_IRQn EXTI1_IRQn
#define VBATT_Pin GPIO_PIN_0
#define VBATT_GPIO_Port GPIOB
#define PRESS_INT_Pin GPIO_PIN_8
#define PRESS_INT_GPIO_Port GPIOE
#define PRESS_INT_EXTI_IRQn EXTI8_IRQn
#define DIL_INT1_Pin GPIO_PIN_2
#define DIL_INT1_GPIO_Port GPIOG
#define MDF1_SDI2_Pin GPIO_PIN_7
#define MDF1_SDI2_GPIO_Port GPIOE
#define PWM_OUT_T1_C3_Pin GPIO_PIN_13
#define PWM_OUT_T1_C3_GPIO_Port GPIOE
#define BLE_INT_Pin GPIO_PIN_11
#define BLE_INT_GPIO_Port GPIOB
#define BLE_INT_EXTI_IRQn EXTI11_IRQn
#define MDF1_SDI1_Pin GPIO_PIN_12
#define MDF1_SDI1_GPIO_Port GPIOB
#define TEMP_INT_Pin GPIO_PIN_15
#define TEMP_INT_GPIO_Port GPIOB
#define BLE_SPI_CS_Pin GPIO_PIN_2
#define BLE_SPI_CS_GPIO_Port GPIOA
#define SD_DETECT_Pin GPIO_PIN_5
#define SD_DETECT_GPIO_Port GPIOC
#define SD_DETECT_EXTI_IRQn EXTI5_IRQn
#define LDO_EN_Pin GPIO_PIN_15
#define LDO_EN_GPIO_Port GPIOE
#define IMU_INT1_Pin GPIO_PIN_4
#define IMU_INT1_GPIO_Port GPIOA
#define IMU_INT1_EXTI_IRQn EXTI4_IRQn
#define ACC_INT2_Pin GPIO_PIN_15
#define ACC_INT2_GPIO_Port GPIOF
#define ACC_INT2_EXTI_IRQn EXTI15_IRQn
#define NFC_GPO_Pin GPIO_PIN_12
#define NFC_GPO_GPIO_Port GPIOE

/* USER CODE BEGIN Private defines */
#define STTS22H_ODR 1.0f /* ODR = 1.0Hz */
#define ISM330DHCX_ACC_ODR 104.0f /* ODR = 104Hz */
#define ISM330DHCX_ACC_FS 4 /* FS = 4g */
#define ISM330DHCX_GYRO_ODR 104.0f /* ODR = 104Hz */
#define ISM330DHCX_GYRO_FS 2000 /* FS = 2000dps */
#define ILPS22QS_ODR 25.0f /* ODR = 25.0Hz */
#define IIS2MDC_MAG_ODR 100.0f /* ODR = 100Hz */
#define IIS2MDC_MAG_FS 50 /* FS = 50gauss */
/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

```


# Current Limitations

### Not fully tested, only STTS22H works!
### Many files and code lines were deleted to avoid compilation errors!

Below some know parts not utilized:
* BSP_SD_Init();
* void PrintInfo(void);
* Error_Handler(char *File,int32_t Line);
*Interrupt handler GPDMA5

Interrupt handler GPDMA5 is deleted because of compilation error. 

# Current output
![Output of STTS22H](../Graphics/STTS22H.png)
