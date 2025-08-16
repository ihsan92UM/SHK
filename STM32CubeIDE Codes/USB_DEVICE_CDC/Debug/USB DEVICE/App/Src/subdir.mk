################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USB\ DEVICE/App/Src/usbd_desc.c 

OBJS += \
./USB\ DEVICE/App/Src/usbd_desc.o 

C_DEPS += \
./USB\ DEVICE/App/Src/usbd_desc.d 


# Each subdirectory must supply rules for building sources it contributes
USB\ DEVICE/App/Src/usbd_desc.o: ../USB\ DEVICE/App/Src/usbd_desc.c USB\ DEVICE/App/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32U545xx -c -I../Core/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32U5xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/USB DEVICE/App/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/USB DEVICE/Target/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/Middlewares/Class/CDC/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/Middlewares/Core/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"USB DEVICE/App/Src/usbd_desc.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-USB-20-DEVICE-2f-App-2f-Src

clean-USB-20-DEVICE-2f-App-2f-Src:
	-$(RM) ./USB\ DEVICE/App/Src/usbd_desc.cyclo ./USB\ DEVICE/App/Src/usbd_desc.d ./USB\ DEVICE/App/Src/usbd_desc.o ./USB\ DEVICE/App/Src/usbd_desc.su

.PHONY: clean-USB-20-DEVICE-2f-App-2f-Src

