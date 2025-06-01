//#include "u8g2.h"
//#include "stm32c0xx_hal.h"
//
//extern SPI_HandleTypeDef hspi1;
//#define OLED_CS_GPIO_Port GPIOA
//#define OLED_CS_Pin GPIO_PIN_5
//#define OLED_DC_GPIO_Port GPIOA
//#define OLED_DC_Pin GPIO_PIN_9
//#define OLED_RST_GPIO_Port GPIOC
//#define OLED_RST_Pin GPIO_PIN_9
//
//uint8_t u8x8_byte_4wire_hw_spi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
//    switch(msg) {
//        case U8X8_MSG_BYTE_SEND:
//            HAL_SPI_Transmit(&hspi1, (uint8_t *)arg_ptr, arg_int, HAL_MAX_DELAY);
//            break;
//        case U8X8_MSG_BYTE_INIT:
//            break;
//        case U8X8_MSG_BYTE_START_TRANSFER:
//            HAL_GPIO_WritePin(OLED_CS_GPIO_Port, OLED_CS_Pin, GPIO_PIN_RESET);
//            break;
//        case U8X8_MSG_BYTE_END_TRANSFER:
//            HAL_GPIO_WritePin(OLED_CS_GPIO_Port, OLED_CS_Pin, GPIO_PIN_SET);
//            break;
//        default:
//            return 0;
//    }
//    return 1;
//}
//
//uint8_t u8x8_gpio_and_delay_stm32_spi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
//    switch(msg) {
//        case U8X8_MSG_DELAY_MILLI:
//            HAL_Delay(arg_int);
//            break;
//        case U8X8_MSG_GPIO_AND_DELAY_INIT:
//            break;
//        case U8X8_MSG_GPIO_RESET:
//            HAL_GPIO_WritePin(OLED_RST_GPIO_Port, OLED_RST_Pin, arg_int);
//            break;
//        case U8X8_MSG_GPIO_CS:
//            // CS handled in byte function
//            break;
//        case U8X8_MSG_GPIO_DC:
//            HAL_GPIO_WritePin(OLED_DC_GPIO_Port, OLED_DC_Pin, arg_int);
//            break;
//        default:
//            return 0;
//    }
//    return 1;
//}
