################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/main.c \
../Core/Src/stm32u5xx_hal_msp.c \
../Core/Src/stm32u5xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32u5xx.c 

OBJS += \
./Core/Src/main.o \
./Core/Src/stm32u5xx_hal_msp.o \
./Core/Src/stm32u5xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32u5xx.o 

C_DEPS += \
./Core/Src/main.d \
./Core/Src/stm32u5xx_hal_msp.d \
./Core/Src/stm32u5xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32u5xx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32U585xx -c -I../Core/Inc -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/st25dvxxkc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ST25DV" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lsm6dsv16x" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lps22df" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lis2mdl" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lis2du12" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ism330dhcx" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ilps22qs" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis3dwb" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2dlpc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2iclx" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2mdc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/Common" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stc3115" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components" -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/stm32u5xx_hal_msp.cyclo ./Core/Src/stm32u5xx_hal_msp.d ./Core/Src/stm32u5xx_hal_msp.o ./Core/Src/stm32u5xx_hal_msp.su ./Core/Src/stm32u5xx_it.cyclo ./Core/Src/stm32u5xx_it.d ./Core/Src/stm32u5xx_it.o ./Core/Src/stm32u5xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32u5xx.cyclo ./Core/Src/system_stm32u5xx.d ./Core/Src/system_stm32u5xx.o ./Core/Src/system_stm32u5xx.su

.PHONY: clean-Core-2f-Src

