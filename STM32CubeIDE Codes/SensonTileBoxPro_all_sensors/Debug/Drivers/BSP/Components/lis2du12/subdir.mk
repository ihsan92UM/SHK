################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/lis2du12/lis2du12.c \
../Drivers/BSP/Components/lis2du12/lis2du12_reg.c 

OBJS += \
./Drivers/BSP/Components/lis2du12/lis2du12.o \
./Drivers/BSP/Components/lis2du12/lis2du12_reg.o 

C_DEPS += \
./Drivers/BSP/Components/lis2du12/lis2du12.d \
./Drivers/BSP/Components/lis2du12/lis2du12_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/lis2du12/%.o Drivers/BSP/Components/lis2du12/%.su Drivers/BSP/Components/lis2du12/%.cyclo: ../Drivers/BSP/Components/lis2du12/%.c Drivers/BSP/Components/lis2du12/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32U585xx -c -I../Core/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/Components/Common" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/Components/lis2du12" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/Components/lis2mdl" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/Components/lps22df" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/Components/lsm6dsv16x" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SensorTileBoxPro_IDE_V1.17.0/SensonTileBoxPro_all_sensors/Drivers/BSP/SensorTileBoxPro" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-lis2du12

clean-Drivers-2f-BSP-2f-Components-2f-lis2du12:
	-$(RM) ./Drivers/BSP/Components/lis2du12/lis2du12.cyclo ./Drivers/BSP/Components/lis2du12/lis2du12.d ./Drivers/BSP/Components/lis2du12/lis2du12.o ./Drivers/BSP/Components/lis2du12/lis2du12.su ./Drivers/BSP/Components/lis2du12/lis2du12_reg.cyclo ./Drivers/BSP/Components/lis2du12/lis2du12_reg.d ./Drivers/BSP/Components/lis2du12/lis2du12_reg.o ./Drivers/BSP/Components/lis2du12/lis2du12_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-lis2du12

