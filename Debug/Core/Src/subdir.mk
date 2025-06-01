################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/app_freertos.c \
../Core/Src/display.c \
../Core/Src/main.c \
../Core/Src/stm32c0xx_hal_msp.c \
../Core/Src/stm32c0xx_hal_timebase_tim.c \
../Core/Src/stm32c0xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32c0xx.c \
../Core/Src/u8x8_8x8.c \
../Core/Src/u8x8_byte.c \
../Core/Src/u8x8_cad.c \
../Core/Src/u8x8_d_ssd1327.c \
../Core/Src/u8x8_display.c \
../Core/Src/u8x8_fonts.c \
../Core/Src/u8x8_gpio.c \
../Core/Src/u8x8_stm32_spi.c 

OBJS += \
./Core/Src/app_freertos.o \
./Core/Src/display.o \
./Core/Src/main.o \
./Core/Src/stm32c0xx_hal_msp.o \
./Core/Src/stm32c0xx_hal_timebase_tim.o \
./Core/Src/stm32c0xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32c0xx.o \
./Core/Src/u8x8_8x8.o \
./Core/Src/u8x8_byte.o \
./Core/Src/u8x8_cad.o \
./Core/Src/u8x8_d_ssd1327.o \
./Core/Src/u8x8_display.o \
./Core/Src/u8x8_fonts.o \
./Core/Src/u8x8_gpio.o \
./Core/Src/u8x8_stm32_spi.o 

C_DEPS += \
./Core/Src/app_freertos.d \
./Core/Src/display.d \
./Core/Src/main.d \
./Core/Src/stm32c0xx_hal_msp.d \
./Core/Src/stm32c0xx_hal_timebase_tim.d \
./Core/Src/stm32c0xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32c0xx.d \
./Core/Src/u8x8_8x8.d \
./Core/Src/u8x8_byte.d \
./Core/Src/u8x8_cad.d \
./Core/Src/u8x8_d_ssd1327.d \
./Core/Src/u8x8_display.d \
./Core/Src/u8x8_fonts.d \
./Core/Src/u8x8_gpio.d \
./Core/Src/u8x8_stm32_spi.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32C031xx -c -I../Core/Inc -I../Drivers/STM32C0xx_HAL_Driver/Inc -I../Drivers/STM32C0xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32C0xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32C0xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include/ -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/ -I../Middlewares/Third_Party/CMSIS/RTOS2/Include/ -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/app_freertos.cyclo ./Core/Src/app_freertos.d ./Core/Src/app_freertos.o ./Core/Src/app_freertos.su ./Core/Src/display.cyclo ./Core/Src/display.d ./Core/Src/display.o ./Core/Src/display.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/stm32c0xx_hal_msp.cyclo ./Core/Src/stm32c0xx_hal_msp.d ./Core/Src/stm32c0xx_hal_msp.o ./Core/Src/stm32c0xx_hal_msp.su ./Core/Src/stm32c0xx_hal_timebase_tim.cyclo ./Core/Src/stm32c0xx_hal_timebase_tim.d ./Core/Src/stm32c0xx_hal_timebase_tim.o ./Core/Src/stm32c0xx_hal_timebase_tim.su ./Core/Src/stm32c0xx_it.cyclo ./Core/Src/stm32c0xx_it.d ./Core/Src/stm32c0xx_it.o ./Core/Src/stm32c0xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32c0xx.cyclo ./Core/Src/system_stm32c0xx.d ./Core/Src/system_stm32c0xx.o ./Core/Src/system_stm32c0xx.su ./Core/Src/u8x8_8x8.cyclo ./Core/Src/u8x8_8x8.d ./Core/Src/u8x8_8x8.o ./Core/Src/u8x8_8x8.su ./Core/Src/u8x8_byte.cyclo ./Core/Src/u8x8_byte.d ./Core/Src/u8x8_byte.o ./Core/Src/u8x8_byte.su ./Core/Src/u8x8_cad.cyclo ./Core/Src/u8x8_cad.d ./Core/Src/u8x8_cad.o ./Core/Src/u8x8_cad.su ./Core/Src/u8x8_d_ssd1327.cyclo ./Core/Src/u8x8_d_ssd1327.d ./Core/Src/u8x8_d_ssd1327.o ./Core/Src/u8x8_d_ssd1327.su ./Core/Src/u8x8_display.cyclo ./Core/Src/u8x8_display.d ./Core/Src/u8x8_display.o ./Core/Src/u8x8_display.su ./Core/Src/u8x8_fonts.cyclo ./Core/Src/u8x8_fonts.d ./Core/Src/u8x8_fonts.o ./Core/Src/u8x8_fonts.su ./Core/Src/u8x8_gpio.cyclo ./Core/Src/u8x8_gpio.d ./Core/Src/u8x8_gpio.o ./Core/Src/u8x8_gpio.su ./Core/Src/u8x8_stm32_spi.cyclo ./Core/Src/u8x8_stm32_spi.d ./Core/Src/u8x8_stm32_spi.o ./Core/Src/u8x8_stm32_spi.su

.PHONY: clean-Core-2f-Src

