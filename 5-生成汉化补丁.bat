@echo off
setlocal enabledelayedexpansion
chcp 65001

for /f "tokens=*" %%a in ('powershell -Command "Get-Date -Format 'MMddHHmm'"') do set "date=%%a"

if exist temp rd /s /q temp
mkdir temp

for /L %%i in (1,1,4) do (
    echo Processing Chapter %%i...
    bin\xdelta3.exe -e -s "workspace\ch%%i\data.win" "workspace\result\ch%%i\data.win" "temp\chapter%%i.xdelta"
    mkdir "temp\chapter%%i_windows\lang"
    copy "workspace\result\ch%%i\*.json" "temp\chapter%%i_windows\lang\"
)

mkdir "temp\chapter3_windows\vid"
xcopy /e /i /y "workspace\ch3\vid" "temp\chapter3_windows\vid"
bin\xdelta3.exe -e -s "workspace\main\data.win" "workspace\main\data_new.win" "temp\main.xdelta"

del /f /q *.7z *.tar.gz
bin\7z.exe a -t7z "patch_chs_windowslinux_%date%.7z" ".\temp\*"

set "platforms=linux win"

for %%p in (%platforms%) do (
    echo Packaging for %%p...
    xcopy /e /i /y "cn_installer\%%p" "temp\%%p"
    copy "cn_installer\readme.txt" "temp\%%p\汉化安装教程-readme-%date%.txt"
    copy "patch_chs_windowslinux_%date%.7z" "temp\%%p\"
    if "%%p" == "linux" (
        tar -czf "【%%p-%date%】三角符文安装补丁.tar.gz" -C "temp\%%p" .
    )
    if "%%p" == "win" (
        bin\7z a -t7z "【%%p-%date%】三角符文安装补丁.7z" ".\temp\%%p\*"
    )
)

rd /s /q temp