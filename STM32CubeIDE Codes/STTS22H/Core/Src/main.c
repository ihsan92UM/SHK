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
