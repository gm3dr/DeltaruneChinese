@echo off
setlocal enabledelayedexpansion
chcp 65001

for /f "tokens=*" %%a in ('powershell -Command "Get-Date -Format 'MMddHHmm'"') do set "date=%%a"
set "date=1225rc1"
set "fixedTime=2025-12-25 12:25"
if exist temp rd /s /q temp
mkdir "temp\patch"
for /L %%i in (1,1,4) do (
    echo Processing Chapter %%i...
    bin\xdelta3.exe -e -s "workspace\ch%%i\data.win" "workspace\result\ch%%i\data.win" "temp\patch\chapter%%i.xdelta"
    mkdir "temp\patch\chapter%%i_windows\lang"
    copy "workspace\result\ch%%i\*.json" "temp\patch\chapter%%i_windows\lang\"
)
mkdir "temp\patch_mac"
for /L %%i in (1,1,4) do (
    echo Processing Chapter %%i...
    bin\xdelta3.exe -e -s "workspace\ch%%i\game.ios" "workspace\result\ch%%i\data.win" "temp\patch_mac\chapter%%i.xdelta"
    mkdir "temp\patch_mac\chapter%%i_mac\lang"
    copy "workspace\result\ch%%i\*.json" "temp\patch_mac\chapter%%i_mac\lang\"
)

mkdir "temp\patch\chapter3_windows\vid"
xcopy /e /i /y "workspace\ch3\vid" "temp\patch\chapter3_windows\vid"
bin\xdelta3.exe -e -s "workspace\main\data.win" "workspace\main\data_new.win" "temp\patch\main.xdelta"

mkdir "temp\patch_mac\chapter3_mac\vid"
xcopy /e /i /y "workspace\ch3\vid" "temp\patch_mac\chapter3_mac\vid"
bin\xdelta3.exe -e -s "workspace\main\game.ios" "workspace\main\data_new.win" "temp\patch_mac\main.xdelta"


rem Normalize timestamps before any packaging
powershell -NoProfile -Command ^
    "$ts = Get-Date '%fixedTime%';" ^
    "$root = Get-Item -LiteralPath '.\temp';" ^
    "$items = Get-ChildItem -LiteralPath $root -Recurse -Force;" ^
    "($items + $root) | ForEach-Object { $_.LastWriteTime = $ts }"

del /f /q *.7z *.tar.gz
bin\7z.exe a -t7z "patch_chs_windowslinux_%date%.7z" ".\temp\patch\*"
bin\7z.exe a -t7z "patch_chs_macos_%date%.7z" ".\temp\patch_mac\*"

set "platforms=linux win"

for %%p in (%platforms%) do (
    echo Packaging for %%p...
    xcopy /e /i /y "cn_installer\%%p" "temp\%%p"
    copy "cn_installer\readme.txt" "temp\%%p\汉化安装教程-readme-%date%.txt"
    copy "patch_chs_windowslinux_%date%.7z" "temp\%%p\"
    powershell -NoProfile -Command ^
        "$ts = Get-Date '%fixedTime%';" ^
        "$root = Get-Item -LiteralPath '.\temp\%%p';" ^
        "$items = Get-ChildItem -LiteralPath $root -Recurse -Force;" ^
        "($items + $root) | ForEach-Object { $_.LastWriteTime = $ts }"
    if "%%p" == "linux" (
        %MSYS_HOME%\usr\bin\tar -czf "【%%p-%date%】三角符文汉化补丁.tar.gz" -C "temp\%%p" .
    )
    if "%%p" == "win" (
        bin\7z a -t7z "【%%p-%date%】三角符文汉化补丁.7z" ".\temp\%%p\*"
    )
)

rd /s /q temp