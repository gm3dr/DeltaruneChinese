$ErrorActionPreference = "Stop"
# 首先需要运行 steam://open/console打开控制台
# 运行下列指令下载depot
# download_depot 1671210 1671212
# download_depot 1671210 1671213
# download_depot 1690940 1690941
# download_depot 1690940 1690942

# 1. 自动识别操作系统并设置 Steam 根目录
$gameVer = "current"
if ($IsWindows -or $env:OS -like "*Windows*") {
    $DirInst = "C:/Program Files (x86)/Steam/steamapps/common/DELTARUNE"
    $AppsDir = "C:/Program Files (x86)/Steam/steamapps/content"
} elseif ($IsMacOS) {
    $DirInst = "$env:HOME/Library/Application Support/Steam/steamapps/common/DELTARUNE/DELTARUNE.app/Contents/Resources"
    $AppsDir = "$env:HOME/Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/steamapps/content"
} elseif ($IsLinux) {
    $DirInst = "$env:HOME/.local/share/Steam/steamapps/common/DELTARUNE"
    $AppsDir = "$env:HOME/.local/share/Steam/ubuntu12_32/steamapps/content"
} else {
    Write-Error "Unsupported OS."
    exit
}

# 2. 定义源目录变量 (基于 Steam 根目录)
$DirWin     = Join-Path $AppsDir "app_1671210/depot_1671212"
$DirMac     = Join-Path $AppsDir "app_1671210/depot_1671213/DELTARUNE.app/Contents/Resources"
$DirDemoWin = Join-Path $AppsDir "app_1690940/depot_1690941"
$DirDemoMac = Join-Path $AppsDir "app_1690940/depot_1690942/DELTARUNE.app/Contents/Resources"

# 3. 极简复制工具函数
function Copy-File($src, $dest) {
    if (Test-Path $src) {
        $destDir = Split-Path $dest
        # 如果目标文件夹不存在，强制创建目录树
        if (-not (Test-Path $destDir)) { 
            New-Item -ItemType Directory -Force -Path $destDir | Out-Null 
        }
        Copy-Item $src $dest -Force
        Write-Host "[√] Copied to: $dest" -ForegroundColor Green
    } else {
        Write-Host "[!] Not found: $src" -ForegroundColor Yellow
    }
}

Write-Host "Starting file extraction..." -ForegroundColor Cyan

# 4. 批量处理 Chapters 1-4 (合并循环逻辑)
1..5 | ForEach-Object {
    $ch = $_
    if ($IsMacOS) { Copy-File (Join-Path $DirInst "chapter$ch`_mac/game.ios") "workspace/ch$ch/data.win" }
    else { Copy-File (Join-Path $DirInst "chapter$ch`_windows/data.win") "workspace/ch$ch/data.win" }
    Copy-File (Join-Path $DirWin "chapter$ch`_windows/data.win")  "data_win/$gameVer/ch$ch/data.win"
    Copy-File (Join-Path $DirMac "chapter$ch`_mac/game.ios")       "data_win/$gameVer/ch$ch/game.ios"
}

# 5. 处理 Main Launcher
if ($IsMacOS) { Copy-File (Join-Path $DirInst "game.ios") "workspace/main/data.win" }
else { Copy-File (Join-Path $DirInst "data.win") "workspace/main/data.win" }
Copy-File (Join-Path $DirWin "data.win")  "data_win/$gameVer/main/data.win"
Copy-File (Join-Path $DirMac "game.ios")  "data_win/$gameVer/main/game.ios"

# 6. 处理 Demo
Copy-File (Join-Path $DirDemoWin "data.win") "workspace/demo/data.win"
Copy-File (Join-Path $DirDemoWin "data.win") "data_win/$gameVer/demo/data.win"
Copy-File (Join-Path $DirDemoMac "game.ios") "data_win/$gameVer/demo/game.ios"

Write-Host "Extraction complete!" -ForegroundColor Cyan
