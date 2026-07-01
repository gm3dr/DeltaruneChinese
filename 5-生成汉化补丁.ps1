# ===============================
# 三角符文汉化补丁 构建脚本
# ===============================

# 【注意】
# 运行前需要先手动创建好 patcher 文件夹
# 并从 github.com/gm3dr/DeltaruneChinesePatcher 的 Release
# 下载 Win/Mac/Linux/WinOld 安装器，并放到文件夹
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

# ---------- 时间 ----------
$fixedTime = Get-Date -Format "yyyy-MM-dd HH:mm"
$date      = "Beta2"
$ts        = Get-Date $fixedTime

Write-Host "Build time : $fixedTime"
Write-Host "Build date : $date"

# ---------- 工具 & 路径 ----------
$TempDir     = "temp"
$OldPatchCount = 4

$PatchDirs = @{
    "Win"   = "$TempDir\patch"
    "Mac"   = "$TempDir\patch_mac"
    "WinDemo" = "$TempDir\patch_demo"
    "MacDemo" = "$TempDir\patch_mac_demo"
}

# ---------- 函数 ----------
function Normalize-Timestamp($path) {
    Get-ChildItem $path -Recurse -Force | ForEach-Object { $_.LastWriteTime = $ts }
    (Get-Item $path).LastWriteTime = $ts
}

function New-CleanDir($path) {
    Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path $path | Out-Null
}

function Make-XDelta($src, $dst, $patch) {
    tool/xdelta3 -S lzma -e -s $src $dst $patch
}

function Copy-Lang($ch, $dest) {
    $langDir = Join-Path "workspace\result" "ch$ch"
    $target  = Join-Path $dest "lang"
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item "$langDir\*.json" $target -Force
}

function Process-Chapter($ch) {
    Write-Host "Processing Chapter $ch..."
    Make-XDelta "data_win\current\ch$ch\data.win" "workspace\result\ch$ch\data.win" "$($PatchDirs.Win)\chapter$ch.xdelta"
    Copy-Lang $ch "$($PatchDirs.Win)\chapter${ch}_windows"

    Make-XDelta "data_win\current\ch$ch\game.ios" "workspace\result\ch$ch\data.win" "$($PatchDirs.Mac)\chapter$ch.xdelta"
    Copy-Lang $ch "$($PatchDirs.Mac)\chapter${ch}_mac"
    1..$OldPatchCount | ForEach-Object {
        if (Test-Path -Path "data_win\old-$_\ch$ch") {
            $hash = (Get-FileHash -Path "data_win\old-$_\ch$ch\data.win" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
            Make-XDelta "data_win\old-$_\ch$ch\data.win" "workspace\result\ch$ch\data.win" "$($PatchDirs.Win)\chapter${ch}_$hash.xdelta"
            $hash = (Get-FileHash -Path "data_win\old-$_\ch$ch\game.ios" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
            Make-XDelta "data_win\old-$_\ch$ch\game.ios" "workspace\result\ch$ch\data.win" "$($PatchDirs.Mac)\chapter${ch}_$hash.xdelta"
        }
    }

    # Chapter 3 & 5 视频文件
    if ($ch -eq 3 -or $ch -eq 5) {
        foreach ($p in @("Win","Mac")) {
            $plower = if ($p -eq "Win") { "windows" } else { "mac" }
            $vidDir = Join-Path $PatchDirs[$p] "chapter${ch}_${plower}\vid"
            New-Item -ItemType Directory -Path $vidDir -Force | Out-Null
            Copy-Item "workspace\ch${ch}\vid\*" $vidDir -Recurse -Force
        }
    }
}

function Build-Patch($dir, $tag, $type) {
    $PureName   = "patch_chs_${tag}_$date.7z"
    tool/7z a -t7z -mx=9 -ms=on -mmt=on $PureName ".\$dir\*"
}

function Build-SfxInstaller($outputFile, $Platform) {
    $cmdLine = "copy /b /y `"cn_installer\7zS2.sfx`"+`"cn_installer\$Platform\config.txt`"+`"temp\$Platform.7z`" `"$outputFile`""
    cmd.exe /d /c $cmdLine
    if ($LASTEXITCODE -ne 0) {
        throw "SFX binary merge failed: $outputFile"
    }
}

# ---------- 清理 & 创建目录 ----------
New-CleanDir $TempDir
foreach ($d in $PatchDirs.Values) { New-CleanDir $d }
Remove-Item *.7z,*.tar.gz,*.dmg,*.exe,*.zip -Force -ErrorAction SilentlyContinue

# ---------- Chapters ----------
1..5 | ForEach-Object { Process-Chapter $_ }

New-Item -ItemType Directory -Path "$($PatchDirs.WinDemo)/lang" -Force | Out-Null
New-Item -ItemType Directory -Path "$($PatchDirs.MacDemo)/lang" -Force | Out-Null
Copy-Item "workspace\result\demo\*.json" "$($PatchDirs.WinDemo)/lang" -Force
Copy-Item "workspace\result\demo\*.json" "$($PatchDirs.MacDemo)/lang" -Force

# ---------- Main & Demo ----------
Make-XDelta "data_win\current\main\data.win" "workspace\result\main\data.win" "$($PatchDirs.Win)\main.xdelta"
Make-XDelta "data_win\current\main\game.ios" "workspace\result\main\data.win" "$($PatchDirs.Mac)\main.xdelta"
1..$OldPatchCount | ForEach-Object {
    if (Test-Path "data_win\old-$_\main") {
        $hash = (Get-FileHash -Path "data_win\old-$_\main\data.win" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
        Make-XDelta "data_win\old-$_\main\data.win" "workspace\result\main\data.win" "$($PatchDirs.Win)\main_$hash.xdelta"
        $hash = (Get-FileHash -Path "data_win\old-$_\main\game.ios" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
        Make-XDelta "data_win\old-$_\main\game.ios" "workspace\result\main\data.win" "$($PatchDirs.Mac)\main_$hash.xdelta"
    }
}

Make-XDelta "data_win\current\demo\data.win" "workspace\result\demo\data.win" "$($PatchDirs.WinDemo)\main.xdelta"
Make-XDelta "data_win\current\demo\game.ios" "workspace\result\demo\data.win" "$($PatchDirs.MacDemo)\main.xdelta"

# ---------- 时间归一化 ----------
Normalize-Timestamp $TempDir

# ---------- 打包补丁 ----------
$Tasks = @(
    @{ Dir=$PatchDirs.Win;     Tag="windowslinux";      Type="Win" },
    @{ Dir=$PatchDirs.Mac;     Tag="macos";             Type="Mac" },
    @{ Dir=$PatchDirs.WinDemo; Tag="windowslinux_demo"; Type="Win" },
    @{ Dir=$PatchDirs.MacDemo; Tag="macos_demo";        Type="Mac" }
)
foreach ($t in $Tasks) { Build-Patch $t.Dir $t.Tag $t.Type }

# ---------- 平台安装包 ----------
foreach ($p in @("linux", "win")) {
    Write-Host "Packaging installer for $p..."
    $PlatformDir = "$TempDir\$p"
    New-Item -ItemType Directory -Path $PlatformDir -Force | Out-Null
    Copy-Item "patcher\$p\*" $PlatformDir -Recurse -Force
    $ReadmePath = "$PlatformDir\汉化更新日志-readme-$date.txt"
    Copy-Item "cn_installer\readme.txt" $ReadmePath
    (Get-Content -Raw $ReadmePath) -replace '\$\(CURRENT_TIME\)', $fixedTime -replace '\$\(CURRENT_DATE\)', $date | Set-Content -Encoding UTF8 $ReadmePath
    Copy-Item "cn_installer\汉化答疑QQ群1033065757-可以来此求助.jpg" $PlatformDir

    if ($p -eq "win") { 
        Copy-Item "patch_chs_windowslinux_$date.7z" $PlatformDir
        Copy-Item "patch_chs_windowslinux_demo_$date.7z" $PlatformDir
        Normalize-Timestamp $PlatformDir
        tool/7z a -t7z -mx=9 -ms=on -mmt=on "temp\win.7z" ".\$PlatformDir" 
        $file_name = "【Win10+（推荐）】三角符文汉化补丁-V$date"
        Build-SfxInstaller "$file_name.exe" $p
        tool/7z a -t7z -mx=9 -ms=on -mmt=on "$file_name.7z" "$file_name.exe"
        Remove-Item "$file_name.exe"
    }
    elseif ($p -eq "winold") { 
        Copy-Item "patch_chs_windowslinux_$date.7z" $PlatformDir
        Copy-Item "patch_chs_windowslinux_demo_$date.7z" $PlatformDir
        Normalize-Timestamp $PlatformDir
        tool/7z a -t7z -mx=9 -ms=on -mmt=on "temp\winold.7z" ".\$PlatformDir" 
        $file_name = "【Win7-】三角符文汉化补丁-V$date"
        Build-SfxInstaller "$file_name.exe" $p
        tool/7z a -t7z -mx=9 -ms=on -mmt=on "$file_name.7z" "$file_name.exe"
        Remove-Item "$file_name.exe"
    }
    else {  # linux
        Copy-Item "cn_installer\linux\*" $PlatformDir -Recurse -Force
        Copy-Item "patch_chs_windowslinux_$date.7z" $PlatformDir
        Copy-Item "patch_chs_windowslinux_demo_$date.7z" $PlatformDir
        Normalize-Timestamp $PlatformDir
        tar -czf "【Linux】三角符文汉化补丁-V$date.tar.gz" -C $PlatformDir . 
    }
}

# ---------- 收尾 ----------
If (Test-Path .\patcher\mac.dmg) {
    Copy-Item .\patcher\mac.dmg "【macOS】三角符文汉化安装器-V$date.dmg"
}
Remove-Item $TempDir -Recurse -Force
Write-Host "Build finished successfully."
