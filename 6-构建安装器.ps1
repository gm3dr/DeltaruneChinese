# ===============================
# 6-构建安装器.ps1 - 打包最终安装器
# ===============================
# 【注意】
# 运行前需要先手动创建好 patcher 文件夹
# 并从 github.com/gm3dr/DeltaruneChinesePatcher 的 Release
# 下载 Win/Mac/Linux/WinOld 安装器，并放到文件夹
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

# ---------- 时间与环境变量 ----------
$fixedTime = Get-Date -Format "yyyy-MM-dd HH:mm"
$date      = Get-Date -Format "yyMMdd"
$ts        = Get-Date $fixedTime

$TempDir = "temp"

# ---------- 验证前置依赖 ----------
if (-not (Test-Path "patch_chs_windowslinux_*.7z")) {
    Write-Warning "未找到生成的补丁 7z 文件。请先运行 5-生成补丁.ps1"
    exit
}

# ---------- 通用函数 ----------
function Normalize-Timestamp([string]$Path) {
    Get-ChildItem $Path -Recurse -Force | ForEach-Object { $_.LastWriteTime = $ts }
    (Get-Item $Path).LastWriteTime = $ts
}

function Build-SfxInstaller([string]$OutputFile, [string]$Platform) {
    $cmdLine = "copy /b /y `"cn_installer\7zS2.sfx`"+`"cn_installer\$Platform\config.txt`"+`"temp\$Platform.7z`" `"$OutputFile`""
    cmd.exe /d /c $cmdLine
    if ($LASTEXITCODE -ne 0) { throw "SFX binary merge failed for: $OutputFile" }
}

# ---------- 清理并初始化 ----------
Remove-Item $TempDir -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item 【* -Force -ErrorAction SilentlyContinue

# ---------- 构建各平台安装包 ----------
foreach ($p in @("linux", "win", "winold", "mac")) {
    if (-not (Test-Path "patcher\$p")) {
        continue
    }
    Write-Host "Packaging installer for $p..."
    $PlatformDir = "$TempDir\$p"
    New-Item -ItemType Directory -Path $PlatformDir -Force | Out-Null
    
    # 复制 patcher 基础文件
    Copy-Item "patcher\$p\*" $PlatformDir -Recurse -Force
    $TargetDataDir = if ($p -eq "mac") { "$PlatformDir\DELTARUNE Chinese Patcher.app\Contents\MacOS" } else { $PlatformDir }
    if ($p -eq "mac") {
        New-Item -ItemType Directory -Path $TargetDataDir -Force | Out-Null
    }
    
    # 生成 readme
    $ReadmePath = "$TargetDataDir\汉化更新日志-readme-$date.txt"
    Copy-Item "cn_installer\readme.txt" $ReadmePath
    (Get-Content -Raw $ReadmePath) -replace '\$\(CURRENT_TIME\)', $fixedTime -replace '\$\(CURRENT_DATE\)', $date | 
        Set-Content -Encoding UTF8 $ReadmePath
    
    # 答疑图
    Copy-Item "cn_installer\汉化答疑QQ群1033065757-可以来此求助.jpg" $TargetDataDir

    # Windows / WinOld 逻辑合并
    if ($p -in @("win", "winold")) { 
        # 通配符匹配补丁文件，提升兼容性
        Copy-Item "patch_chs_windowslinux_*.7z" $TargetDataDir
        Copy-Item "patch_chs_windowslinux_demo_*.7z" $TargetDataDir
        
        Normalize-Timestamp $PlatformDir
        .\tool\7z a -t7z -mx=9 -ms=on -mmt=on "temp\$p.7z" ".\$PlatformDir" 
        
        $prefix = if ($p -eq "win") { "【Win10+（推荐）】" } else { "【Win7-】" }
        $file_name = "${prefix}三角符文汉化补丁-V$date"
        
        Build-SfxInstaller "$file_name.exe" $p
        Compress-Archive -DestinationPath "$file_name.zip" -Path "$file_name.exe"
        Remove-Item "$file_name.exe"
    }
    # Linux 逻辑
    elseif ($p -eq "linux") { 
        Copy-Item "cn_installer\linux\*" $TargetDataDir -Recurse -Force
        Copy-Item "patch_chs_windowslinux_*.7z" $TargetDataDir
        Copy-Item "patch_chs_windowslinux_demo_*.7z" $TargetDataDir
        
        Normalize-Timestamp $PlatformDir
        tar -czf "【Linux】三角符文汉化补丁-V$date.tar.gz" -C $PlatformDir . 
    }
    # Mac 逻辑
    elseif ($p -eq "mac") {
        Copy-Item "patch_chs_macos_*.7z" $TargetDataDir
        Copy-Item "patch_chs_macos_demo_*.7z" $TargetDataDir
        # $AppPath = "$PlatformDir\DELTARUNE Chinese Patcher.app"
        # xattr -cr "$AppPath"
        # codesign --force --deep --sign - "$AppPath"
        Normalize-Timestamp $PlatformDir
        tar -czf "【macOS】三角符文汉化补丁-V$date.tar.gz" -C $PlatformDir . 
    }
}

# ---------- 处理 macOS DMG ----------
if (Test-Path ".\patcher\mac.dmg") {
    Write-Host "Packaging macOS DMG..."
    Copy-Item ".\patcher\mac.dmg" "【macOS】三角符文汉化安装器-V$date.dmg"
}

# ---------- 收尾 ----------
Remove-Item $TempDir -Recurse -Force
Write-Host "Phase 2 (Installers Generation) finished successfully."