@echo off
setlocal enabledelayedexpansion

set "DELTARUNE_DIR=C:\Program Files (x86)\Steam\steamapps\common\Deltarune"

for /l %%i in (1,1,4) do (
    set "SRC=%DELTARUNE_DIR%\chapter%%i_windows\data.win"
    set "DEST=workspace\ch%%i\data.win"
    
    if exist "!SRC!" (
        if exist "!DEST!" del /Q "!DEST!"
        copy "!SRC!" "!DEST!"
        echo [I] Copied Deltarune Chapter %%i
    ) else (
        echo [W] !SRC! not found.
    )
)

pause