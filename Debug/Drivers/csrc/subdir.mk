################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/csrc/u8x8_byte.c \
../Drivers/csrc/u8x8_cad.c \
../Drivers/csrc/u8x8_d_ssd1327.c \
../Drivers/csrc/u8x8_fonts.c \
../Drivers/csrc/u8x8_gpio.c 

OBJS += \
./Drivers/csrc/u8x8_byte.o \
./Drivers/csrc/u8x8_cad.o \
./Drivers/csrc/u8x8_d_ssd1327.o \
./Drivers/csrc/u8x8_fonts.o \
./Drivers/csrc/u8x8_gpio.o 

C_DEPS += \
./Drivers/csrc/u8x8_byte.d \
./Drivers/csrc/u8x8_cad.d \
./Drivers/csrc/u8x8_d_ssd1327.d \
./Drivers/csrc/u8x8_fonts.d \
./Drivers/csrc/u8x8_gpio.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/csrc/%.o Drivers/csrc/%.su Drivers/csrc/%.cyclo: ../Drivers/csrc/%.c Drivers/csrc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32C031xx -c -I../Core/Inc -I../Drivers/STM32C0xx_HAL_Driver/Inc -I../Drivers/STM32C0xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32C0xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32C0xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include/ -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/ -I../Middlewares/Third_Party/CMSIS/RTOS2/Include/ -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/ -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-csrc

clean-Drivers-2f-csrc:
	-$(RM) ./Drivers/csrc/u8x8_byte.cyclo ./Drivers/csrc/u8x8_byte.d ./Drivers/csrc/u8x8_byte.o ./Drivers/csrc/u8x8_byte.su ./Drivers/csrc/u8x8_cad.cyclo ./Drivers/csrc/u8x8_cad.d ./Drivers/csrc/u8x8_cad.o ./Drivers/csrc/u8x8_cad.su ./Drivers/csrc/u8x8_d_ssd1327.cyclo ./Drivers/csrc/u8x8_d_ssd1327.d ./Drivers/csrc/u8x8_d_ssd1327.o ./Drivers/csrc/u8x8_d_ssd1327.su ./Drivers/csrc/u8x8_fonts.cyclo ./Drivers/csrc/u8x8_fonts.d ./Drivers/csrc/u8x8_fonts.o ./Drivers/csrc/u8x8_fonts.su ./Drivers/csrc/u8x8_gpio.cyclo ./Drivers/csrc/u8x8_gpio.d ./Drivers/csrc/u8x8_gpio.o ./Drivers/csrc/u8x8_gpio.su

.PHONY: clean-Drivers-2f-csrc

