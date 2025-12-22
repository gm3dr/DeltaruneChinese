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

set "SRC=%DELTARUNE_DIR%\data.win"
set "DEST=workspace\main\data.win"
if exist "!SRC!" (
    if exist "!DEST!" del /Q "!DEST!"
    copy "!SRC!" "!DEST!"
    echo [I] Copied Deltarune Launcher
) else (
    echo [W] !SRC! not found.
)

set "DELTARUNE_DIR_MAC=C:\Program Files (x86)\Steam\steamapps\content\app_1671210\depot_1671213\DELTARUNE.app\Contents\Resources"

for /l %%i in (1,1,4) do (
    set "SRC=%DELTARUNE_DIR_MAC%\chapter%%i_mac\game.ios"
    set "DEST=workspace\ch%%i\game.ios"
    
    if exist "!SRC!" (
        if exist "!DEST!" del /Q "!DEST!"
        copy "!SRC!" "!DEST!"
        echo [I] Copied Deltarune Chapter %%i Mac
    ) else (
        echo [W] !SRC! not found.
    )
)

set "SRC=%DELTARUNE_DIR_MAC%\game.ios"
set "DEST=workspace\main\game.ios"
if exist "!SRC!" (
    if exist "!DEST!" del /Q "!DEST!"
    copy "!SRC!" "!DEST!"
    echo [I] Copied Deltarune Launcher Mac
) else (
    echo [W] !SRC! not found.
)