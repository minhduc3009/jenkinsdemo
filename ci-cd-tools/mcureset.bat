setlocal

set "flash_tool=C:\Program Files\STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI"

"%flash_tool%" --connect port=SWD sn=55FF70066685485510331367 -hardRst
