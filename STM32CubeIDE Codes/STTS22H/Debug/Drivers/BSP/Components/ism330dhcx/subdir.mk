################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/ism330dhcx/ism330dhcx.c \
../Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.c 

OBJS += \
./Drivers/BSP/Components/ism330dhcx/ism330dhcx.o \
./Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.o 

C_DEPS += \
./Drivers/BSP/Components/ism330dhcx/ism330dhcx.d \
./Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/ism330dhcx/%.o Drivers/BSP/Components/ism330dhcx/%.su Drivers/BSP/Components/ism330dhcx/%.cyclo: ../Drivers/BSP/Components/ism330dhcx/%.c Drivers/BSP/Components/ism330dhcx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32U585xx -c -I../Core/Inc -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/st25dvxxkc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ST25DV" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lsm6dsv16x" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lps22df" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lis2mdl" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lis2du12" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ism330dhcx" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ilps22qs" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis3dwb" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2dlpc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2iclx" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2mdc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/Common" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stc3115" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components" -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-ism330dhcx

clean-Drivers-2f-BSP-2f-Components-2f-ism330dhcx:
	-$(RM) ./Drivers/BSP/Components/ism330dhcx/ism330dhcx.cyclo ./Drivers/BSP/Components/ism330dhcx/ism330dhcx.d ./Drivers/BSP/Components/ism330dhcx/ism330dhcx.o ./Drivers/BSP/Components/ism330dhcx/ism330dhcx.su ./Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.cyclo ./Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.d ./Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.o ./Drivers/BSP/Components/ism330dhcx/ism330dhcx_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-ism330dhcx

