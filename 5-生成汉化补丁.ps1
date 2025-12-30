# ===============================
# 三角符文汉化补丁 构建脚本
# ===============================

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

# ---------- 时间 ----------
$fixedTime = Get-Date -Format "yyyy-MM-dd HH:mm"
$date      = Get-Date -Format "yyMMdd"
$ts        = Get-Date $fixedTime

$fixedTime = "2025-12-25 12:25"
$date = "1225"
$ts = Get-Date $fixedTime

Write-Host "Build time : $fixedTime"
Write-Host "Build date : $date"

# ---------- 路径 ----------
$TempDir      = "temp"
$PatchWinDir  = "$TempDir\patch"
$PatchMacDir  = "$TempDir\patch_mac"

$XDelta = "bin\xdelta3.exe"
$SevenZip = "bin\7z.exe"

# ---------- 清理 ----------
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item *.7z, *.tar.gz, *.zip -Force -ErrorAction SilentlyContinue

New-Item -ItemType Directory -Path $PatchWinDir | Out-Null
New-Item -ItemType Directory -Path $PatchMacDir | Out-Null

# ---------- Chapter Patch ----------
1..4 | ForEach-Object {
    Write-Host "Processing Chapter $_..."

    # Windows / Linux
    & $XDelta -e `
        -s "workspace\ch$_\data.win" `
        "workspace\result\ch$_\data.win" `
        "$PatchWinDir\chapter$_.xdelta"

    $langWin = "$PatchWinDir\chapter${_}_windows\lang"
    New-Item -ItemType Directory -Path $langWin -Force | Out-Null
    Copy-Item "workspace\result\ch$_\*.json" $langWin

    # macOS
    & $XDelta -e `
        -s "workspace\ch$_\game.ios" `
        "workspace\result\ch$_\data.win" `
        "$PatchMacDir\chapter$_.xdelta"

    $langMac = "$PatchMacDir\chapter${_}_mac\lang"
    New-Item -ItemType Directory -Path $langMac -Force | Out-Null
    Copy-Item "workspace\result\ch$_\*.json" $langMac
}

# ---------- Chapter 3 视频 ----------
Write-Host "Copying Chapter 3 videos..."

$vidWin = "$PatchWinDir\chapter3_windows\vid"
$vidMac = "$PatchMacDir\chapter3_mac\vid"

New-Item -ItemType Directory -Path $vidWin -Force | Out-Null
New-Item -ItemType Directory -Path $vidMac -Force | Out-Null

Copy-Item "workspace\ch3\vid\*" $vidWin -Recurse -Force
Copy-Item "workspace\ch3\vid\*" $vidMac -Recurse -Force

# ---------- Main Patch ----------
& $XDelta -e `
    -s "workspace\main\data.win" `
    "workspace\main\data_new.win" `
    "$PatchWinDir\main.xdelta"

& $XDelta -e `
    -s "workspace\main\game.ios" `
    "workspace\main\data_new.win" `
    "$PatchMacDir\main.xdelta"

# ---------- 时间归一化 ----------
Write-Host "Normalizing timestamps..."

Get-ChildItem $TempDir -Recurse -Force | ForEach-Object {
    $_.LastWriteTime = $ts
}

(Get-Item $TempDir).LastWriteTime = $ts

# ---------- 打补丁包 ----------
$PatchWinName = "patch_chs_windowslinux_$date.7z"
$PatchMacName = "patch_chs_macos_$date.7z"

& $SevenZip a -t7z $PatchWinName ".\$PatchWinDir\*"
& $SevenZip a -t7z $PatchMacName ".\$PatchMacDir\*"

$PatchWinManual = "【winlinux手动安装-$date】三角符文汉化补丁.7z"
$PatchMacManual = "【mac手动安装-$date】三角符文汉化补丁.zip"
$QQGroupFile = "汉化答疑QQ群1033065757-遇到问题可以来求助.jpg"

Copy-Item "cn_installer\manual\汉化手动安装器Windows版.exe" $PatchWinDir
Copy-Item "cn_installer\manual\汉化手动安装器Linux版.sh" $PatchWinDir
Copy-Item "cn_installer\manual\安装教程.pdf" $PatchWinDir
Copy-Item "cn_installer\$QQGroupFile" $PatchWinDir
& $SevenZip a -t7z $PatchWinManual ".\$PatchWinDir\*"
Copy-Item "cn_installer\manual\汉化手动安装器macOS版（请先解压）.zip" $PatchMacDir
Copy-Item "cn_installer\manual\安装教程_macOS版.pdf" $PatchMacDir
Copy-Item "cn_installer\$QQGroupFile" $PatchMacDir
& $SevenZip a $PatchMacManual ".\$PatchMacDir\*"

# ---------- 平台安装包 ----------
$Platforms = @("linux", "win")

foreach ($p in $Platforms) {
    Write-Host "Packaging installer for $p..."

    $PlatformDir = "$TempDir\$p"
    New-Item -ItemType Directory -Path $PlatformDir -Force | Out-Null

    Copy-Item "cn_installer\$p\*" $PlatformDir -Recurse -Force

    $ReadmePath = "$PlatformDir\汉化安装教程-readme-$date.txt"
    Copy-Item "cn_installer\readme.txt" $ReadmePath
    Copy-Item "cn_installer\$QQGroupFile" $PlatformDir

    # readme 占位符替换
    (Get-Content -Raw $ReadmePath) `
        -replace '\$\(CURRENT_TIME\)', $fixedTime `
        -replace '\$\(CURRENT_DATE\)', $date |
        Set-Content -Encoding UTF8 $ReadmePath

    Copy-Item $PatchWinName $PlatformDir

    # 再次时间归一化
    Get-ChildItem $PlatformDir -Recurse -Force | ForEach-Object {
        $_.LastWriteTime = $ts
    }

    (Get-Item $PlatformDir).LastWriteTime = $ts

    if ($p -eq "linux") {
        & "$env:MSYS_HOME\usr\bin\tar.exe" `
            -czf "【$p-$date】三角符文汉化补丁.tar.gz" `
            -C $PlatformDir .
    }

    if ($p -eq "win") {
        & $SevenZip a `
            -t7z "【$p-$date】三角符文汉化补丁.7z" `
            ".\$PlatformDir\*"
    }
}

# ---------- mac 安装器 ----------
Copy-Item "cn_installer\mac.zip" "【mac-$date】三角符文汉化安装器.zip"

# ---------- 收尾 ----------
Remove-Item $TempDir -Recurse -Force

Write-Host "Build finished successfully."
