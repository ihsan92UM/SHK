################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.c \
../Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.c 

OBJS += \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.o \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.o 

C_DEPS += \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.d \
./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32U5xx_HAL_Driver/Src/%.o Drivers/STM32U5xx_HAL_Driver/Src/%.su Drivers/STM32U5xx_HAL_Driver/Src/%.cyclo: ../Drivers/STM32U5xx_HAL_Driver/Src/%.c Drivers/STM32U5xx_HAL_Driver/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m33 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32U585xx -c -I../Core/Inc -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/st25dvxxkc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ST25DV" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lsm6dsv16x" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lps22df" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lis2mdl" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/lis2du12" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ism330dhcx" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/ilps22qs" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis3dwb" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2dlpc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2iclx" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/iis2mdc" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/Common" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stts22h" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components/stc3115" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/SensorTileBoxPro" -I"C:/Users/Ihsan/STM32CubeIDE/SHK/STTS22H/Drivers/BSP/Components" -I../Drivers/STM32U5xx_HAL_Driver/Inc -I../Drivers/STM32U5xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32U5xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-STM32U5xx_HAL_Driver-2f-Src

clean-Drivers-2f-STM32U5xx_HAL_Driver-2f-Src:
	-$(RM) ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_cortex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_dma_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_exti.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_flash_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gpio.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_gtzc.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_i2c_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_icache.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mdf.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_mmc_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pcd_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_pwr_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rcc_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rng_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_rtc_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai.su
	-$(RM) ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sai_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sd_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_sdio.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_spi_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_tim_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_hal_uart_ex.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_dlyb.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_sdmmc.su ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.cyclo ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.d ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.o ./Drivers/STM32U5xx_HAL_Driver/Src/stm32u5xx_ll_usb.su

.PHONY: clean-Drivers-2f-STM32U5xx_HAL_Driver-2f-Src

