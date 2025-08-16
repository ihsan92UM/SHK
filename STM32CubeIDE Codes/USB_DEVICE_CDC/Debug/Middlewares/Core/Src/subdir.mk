################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Core/Src/usbd_core.c \
../Middlewares/Core/Src/usbd_ctlreq.c \
../Middlewares/Core/Src/usbd_ioreq.c 

OBJS += \
./Middlewares/Core/Src/usbd_core.o \
./Middlewares/Core/Src/usbd_ctlreq.o \
./Middlewares/Core/Src/usbd_ioreq.o 

C_DEPS += \
./Middlewares/Core/Src/usbd_core.d \
./Middlewares/Core/Src/usbd_ctlreq.d \
./Middlewares/Core/Src/usbd_ioreq.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Core/Src/%.o Middlewares/Core/Src/%.su Middlewares/Core/Src/%.cyclo: ../Middlewares/Core/Src/%.c Middlewares/Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_NUCLEO_64 -DUSE_HAL_DRIVER -DSTM32U545xx -c -I../Core/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/BSP/STM32U5xx_Nucleo -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/USB DEVICE/App/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/USB DEVICE/Target/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/Middlewares/Class/CDC/Inc" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/USB_DEVICE_CDC/Middlewares/Core/Inc" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Core-2f-Src

clean-Middlewares-2f-Core-2f-Src:
	-$(RM) ./Middlewares/Core/Src/usbd_core.cyclo ./Middlewares/Core/Src/usbd_core.d ./Middlewares/Core/Src/usbd_core.o ./Middlewares/Core/Src/usbd_core.su ./Middlewares/Core/Src/usbd_ctlreq.cyclo ./Middlewares/Core/Src/usbd_ctlreq.d ./Middlewares/Core/Src/usbd_ctlreq.o ./Middlewares/Core/Src/usbd_ctlreq.su ./Middlewares/Core/Src/usbd_ioreq.cyclo ./Middlewares/Core/Src/usbd_ioreq.d ./Middlewares/Core/Src/usbd_ioreq.o ./Middlewares/Core/Src/usbd_ioreq.su

.PHONY: clean-Middlewares-2f-Core-2f-Src

