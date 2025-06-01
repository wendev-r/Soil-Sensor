/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * File Name          : app_freertos.c
 * Description        : FreeRTOS applicative file
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
#include "main.h"
extern ADC_HandleTypeDef hadc1;
#include "display.h"


/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "app_freertos.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
typedef struct {
	uint16_t soilMoisture;
	uint16_t lightLevel;
//    float temperature;
} SensorData_t;

SensorData_t sensorData;
osMutexId_t dataMutex;
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

/* USER CODE END Variables */
/* Definitions for defaultTask */
osThreadId_t defaultTaskHandle;
const osThreadAttr_t defaultTask_attributes = {
  .name = "defaultTask",
  .priority = (osPriority_t) osPriorityNormal,
  .stack_size = 128 * 4
};
/* Definitions for soilSensorTask */
osThreadId_t soilSensorTaskHandle;
const osThreadAttr_t soilSensorTask_attributes = {
  .name = "soilSensorTask",
  .priority = (osPriority_t) osPriorityNormal,
  .stack_size = 128 * 4
};
/* Definitions for waterPumpTask */
osThreadId_t waterPumpTaskHandle;
const osThreadAttr_t waterPumpTask_attributes = {
  .name = "waterPumpTask",
  .priority = (osPriority_t) osPriorityLow,
  .stack_size = 128 * 4
};
/* Definitions for displayTask */
osThreadId_t displayTaskHandle;
const osThreadAttr_t displayTask_attributes = {
  .name = "displayTask",
  .priority = (osPriority_t) osPriorityBelowNormal,
  .stack_size = 128 * 4
};

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/* USER CODE END FunctionPrototypes */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* USER CODE BEGIN RTOS_MUTEX */
	/* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
	/* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
	/* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* USER CODE BEGIN RTOS_QUEUES */
	/* add queues, ... */
  /* USER CODE END RTOS_QUEUES */
  /* creation of defaultTask */
  defaultTaskHandle = osThreadNew(StartDefaultTask, NULL, &defaultTask_attributes);

  /* creation of soilSensorTask */
  soilSensorTaskHandle = osThreadNew(StartSoilSensorTask, NULL, &soilSensorTask_attributes);

  /* creation of waterPumpTask */
  waterPumpTaskHandle = osThreadNew(StartWaterPumpTaskTask, NULL, &waterPumpTask_attributes);

  /* creation of displayTask */
  displayTaskHandle = osThreadNew(StartDisplayTask, NULL, &displayTask_attributes);

  /* USER CODE BEGIN RTOS_THREADS */
	/* add threads, ... */
  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_EVENTS */
	/* add events, ... */
  /* USER CODE END RTOS_EVENTS */

}
/* USER CODE BEGIN Header_StartDefaultTask */
/**
 * @brief Function implementing the defaultTask thread.
 * @param argument: Not used
 * @retval None
 */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* USER CODE BEGIN defaultTask */
	/* Infinite loop */
	for (;;) {
		osDelay(1);
	}
  /* USER CODE END defaultTask */
}

/* USER CODE BEGIN Header_StartSoilSensorTask */
/**
 * @brief Function implementing the soilSensorTask thread.
 * @param argument: Not used
 * @retval None
 */
/* USER CODE END Header_StartSoilSensorTask */
void StartSoilSensorTask(void *argument)
{
  /* USER CODE BEGIN soilSensorTask */
	/* Infinite loop */
	for (;;) {
		ADC_ChannelConfTypeDef sConfig = {0};
		SensorData_t localData;
		//Read Sensors
		sConfig.Channel = ADC_CHANNEL_6;
		sConfig.Rank = 1;
		sConfig.SamplingTime = ADC_SAMPLETIME_1CYCLE_5;
		HAL_ADC_ConfigChannel(&hadc1, &sConfig);

		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, 10);
		localData.soilMoisture = HAL_ADC_GetValue(&hadc1);
		HAL_ADC_Stop(&hadc1);
		sConfig.Channel = ADC_CHANNEL_1;
		HAL_ADC_ConfigChannel(&hadc1, &sConfig);

		HAL_ADC_Start(&hadc1);
		HAL_ADC_PollForConversion(&hadc1, 10);
		localData.lightLevel = HAL_ADC_GetValue(&hadc1);
		HAL_ADC_Stop(&hadc1);
		osMutexAcquire(dataMutex, osWaitForever);
		sensorData = localData;

		if (localData.soilMoisture > 700) {
		    // Notify the pump task to start
		    xTaskNotifyGive(waterPumpTaskHandle);
		}

		osMutexRelease(dataMutex);
		osDelay(1000);


	}
  /* USER CODE END soilSensorTask */
}

/* USER CODE BEGIN Header_StartWaterPumpTaskTask */
/**
* @brief Function implementing the waterPumpTask thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_StartWaterPumpTaskTask */
void StartWaterPumpTaskTask(void *argument)
{
  /* USER CODE BEGIN waterPumpTask */
  /* Infinite loop */

  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END waterPumpTask */
}

/* USER CODE BEGIN Header_StartDisplayTask */
/**
* @brief Function implementing the displayTask thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_StartDisplayTask */
void StartDisplayTask(void *argument)
{
  /* USER CODE BEGIN displayTask */
  /* Infinite loop */
	SensorData_t localCopy;
	    char buffer[32];

	    Display_Init();

	    for (;;)
	    {
	        osMutexAcquire(dataMutex, osWaitForever);
	        localCopy = sensorData;
	        osMutexRelease(dataMutex);

	        snprintf(buffer, sizeof(buffer), "Soil:%u", localCopy.soilMoisture);
	        u8x8_DrawString(&u8x8, 0, 0, buffer);
	        snprintf(buffer, sizeof(buffer), "Light:%u", localCopy.lightLevel);
	        u8x8_DrawString(&u8x8, 0, 1, buffer);

	        osDelay(1000);
	    }
  /* USER CODE END displayTask */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

/* USER CODE END Application */

