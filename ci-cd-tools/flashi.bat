rem @echo off
set "usage=usage: flashi [{Debug|Release}]"

setlocal

set "build_type=Debug"
if not [%1]==[] set "build_type=%1"

set "ws_root=C:\Users\Admin\Downloads\ci-cd-class-1"
set "sn=55FF70066685485510331367"
set "image_file=%ws_root%\%build_type%\ci-cd-class-1.bin"

"%ws_root%\ci-cd-tools\flash.bat" %sn% "%image_file%"