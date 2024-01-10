rem
rem usage: build build-dir {Debug|Release} {all|clean}
rem

setlocal

if not [%3]==[] goto :get_args
echo "Insufficient arguments"
exit /b 1

:get_args

set "build_dir=%1"
set "build_type=%2"
set "target=%3"

cd "%build_dir%"

@REM set PATH=C:\ST\STM32CubeIDE_1.6.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.9-2020-q2-update.win32_1.5.0.202011040924\tools\bin;C:\ST\STM32CubeIDE_1.6.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_1.5.0.202011040924\tools\bin;C:/ST/STM32CubeIDE_1.6.1/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_1.6.0.202102191308/jre/bin/client;C:/ST/STM32CubeIDE_1.6.1/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_1.6.0.202102191308/jre/bin;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\nodejs\;C:\Program Files\Git\cmd;C:\Program Files\TortoiseSVN\bin;C:\Program Files\Calibre2\;C:\Program Files\SlikSvn\bin;C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility;C:\Program Files\Graphviz\bin;D:\OneDrive\1_WorkMain\MKAC_Project\MKAC_MKVC_SensingIoT\MKAC_Maintain\11_ToolScript\AutoLoginOpenChrome;C:\Program Files\MongoDB\Tools\100\bin;;C:\Program Files\Docker\Docker\resources\bin;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\Admin\AppData\Local\Programs\Python\Python37\Scripts\;C:\Users\Admin\AppData\Local\Programs\Python\Python37\;C:\Users\Admin\AppData\Local\Microsoft\WindowsApps;C:\Users\Admin\AppData\Roaming\npm;C:\src\flutter\bin;C:\Program Files\Java\jre1.8.0_351\bin;C:\Users\Admin\AppData\Local\Pub\Cache\bin;C:\ST\STM32CubeIDE_1.6.1\STM32CubeIDE
set PATH=C:\ST\STM32CubeIDE_1.6.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.9-2020-q2-update.win32_1.5.0.202011040924\tools\bin;C:\ST\STM32CubeIDE_1.6.1\STM32CubeIDE\plugins\com.st.stm32cube.ide.mcu.externaltools.make.win32_1.5.0.202011040924\tools\bin;C:/ST/STM32CubeIDE_1.6.1/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_1.6.0.202102191308/jre/bin/client;C:/ST/STM32CubeIDE_1.6.1/STM32CubeIDE//plugins/com.st.stm32cube.ide.jre.win64_1.6.0.202102191308/jre/bin;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\nodejs\;C:\Program Files\Git\cmd;C:\Program Files\TortoiseSVN\bin;C:\Program Files\Calibre2\;C:\Program Files\SlikSvn\bin;C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility;C:\Program Files\Graphviz\bin;D:\OneDrive\1_WorkMain\MKAC_Project\MKAC_MKVC_SensingIoT\MKAC_Maintain\11_ToolScript\AutoLoginOpenChrome;C:\Program Files\MongoDB\Tools\100\bin;;C:\Program Files\Docker\Docker\resources\bin;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\Admin\AppData\Local\Programs\Python\Python37\Scripts\;C:\Users\Admin\AppData\Local\Programs\Python\Python37\;C:\Users\Admin\AppData\Local\Microsoft\WindowsApps;C:\Users\Admin\AppData\Roaming\npm;C:\src\flutter\bin;C:\Program Files\Java\jre1.8.0_351\bin;C:\Users\Admin\AppData\Local\Pub\Cache\bin;C:\ST\STM32CubeIDE_1.6.1\STM32CubeIDE
set compiler_prefix=arm-none-eabi-gcc

set "version_file=..\App\gpio-app\version.h"

if [%BUILD_TAG%]==[] goto :do_make

echo #ifndef _VERSION_H_ >"%version_file%"
echo #define _VERSION_H_ >>"%version_file%"
echo #define VERSION "%BUILD_TAG%-%build_type%" >>"%version_file%"
echo #endif >>"%version_file%"

:do_make

make -j4 "%target%"
