################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Class/CDC/Src/usbd_cdc.c \
../Middlewares/Class/CDC/Src/usbd_cdc_if.c 

OBJS += \
./Middlewares/Class/CDC/Src/usbd_cdc.o \
./Middlewares/Class/CDC/Src/usbd_cdc_if.o 

C_DEPS += \
./Middlewares/Class/CDC/Src/usbd_cdc.d \
./Middlewares/Class/CDC/Src/usbd_cdc_if.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Class/CDC/Src/%.o Middlewares/Class/CDC/Src/%.su Middlewares/Class/CDC/Src/%.cyclo: ../Middlewares/Class/CDC/Src/%.c Middlewares/Class/CDC/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32U545xx -c -I../Core/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32U5xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/USB DEVICE/App/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/USB DEVICE/Target/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/Middlewares/Class/CDC/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/Middlewares/Core/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Class-2f-CDC-2f-Src

clean-Middlewares-2f-Class-2f-CDC-2f-Src:
	-$(RM) ./Middlewares/Class/CDC/Src/usbd_cdc.cyclo ./Middlewares/Class/CDC/Src/usbd_cdc.d ./Middlewares/Class/CDC/Src/usbd_cdc.o ./Middlewares/Class/CDC/Src/usbd_cdc.su ./Middlewares/Class/CDC/Src/usbd_cdc_if.cyclo ./Middlewares/Class/CDC/Src/usbd_cdc_if.d ./Middlewares/Class/CDC/Src/usbd_cdc_if.o ./Middlewares/Class/CDC/Src/usbd_cdc_if.su

.PHONY: clean-Middlewares-2f-Class-2f-CDC-2f-Src

