################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32u585aiixq.s 

OBJS += \
./Core/Startup/startup_stm32u585aiixq.o 

S_DEPS += \
./Core/Startup/startup_stm32u585aiixq.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m33 -g3 -DDEBUG -c -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup_stm32u585aiixq.d ./Core/Startup/startup_stm32u585aiixq.o

.PHONY: clean-Core-2f-Startup

