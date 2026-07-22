# ===============================
# 5-生成补丁.ps1 - 生成基础补丁包
# ===============================
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

# ---------- 时间与环境变量 ----------
$fixedTime = Get-Date -Format "yyyy-MM-dd HH:mm"
$date      = Get-Date -Format "yyMMdd"
$ts        = Get-Date $fixedTime

Write-Host "Build time : $fixedTime"
Write-Host "Build date : $date"

$TempDir       = "temp"
$OldPatchCount = 6

$PatchDirs = @{
    "Win"     = "$TempDir\patch"
    "Mac"     = "$TempDir\patch_mac"
    "WinDemo" = "$TempDir\patch_demo"
    "MacDemo" = "$TempDir\patch_mac_demo"
}

# ---------- 通用函数 ----------
function New-CleanDir([string]$Path) {
    Remove-Item $Path -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path $Path -Force | Out-Null
}

function Make-XDelta([string]$Src, [string]$Dst, [string]$Patch) {
    .\tool\xdelta3 -S lzma -e -s $Src $Dst $Patch
}

function Copy-Lang([int]$Ch, [string]$Dest) {
    $langDir = Join-Path "workspace\result" "ch$Ch"
    $target  = Join-Path $Dest "lang"
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-Item "$langDir\*.json" $target -Force
}

function Process-Chapter([int]$Ch) {
    Write-Host "Processing Chapter $Ch..."
    
    Make-XDelta "data_win\current\ch$Ch\data.win" "workspace\result\ch$Ch\data.win" "$($PatchDirs.Win)\chapter$Ch.xdelta"
    Copy-Lang $Ch "$($PatchDirs.Win)\chapter${Ch}_windows"

    Make-XDelta "data_win\current\ch$Ch\game.ios" "workspace\result\ch$Ch\data.win" "$($PatchDirs.Mac)\chapter$Ch.xdelta"
    Copy-Lang $Ch "$($PatchDirs.Mac)\chapter${Ch}_mac"
    
    1..$OldPatchCount | ForEach-Object {
        $oldPath = "data_win\old-$_\ch$Ch"
        if (Test-Path -Path $oldPath) {
            $hashWin = (Get-FileHash -Path "$oldPath\data.win" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
            Make-XDelta "$oldPath\data.win" "workspace\result\ch$Ch\data.win" "$($PatchDirs.Win)\chapter${Ch}_$hashWin.xdelta"
            
            $hashMac = (Get-FileHash -Path "$oldPath\game.ios" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
            Make-XDelta "$oldPath\game.ios" "workspace\result\ch$Ch\data.win" "$($PatchDirs.Mac)\chapter${Ch}_$hashMac.xdelta"
        }
    }

    # 处理包含视频的章节 (Ch 3, Ch 5)
    if ($Ch -in @(3, 5)) {
        foreach ($p in @("Win", "Mac")) {
            $plower = if ($p -eq "Win") { "windows" } else { "mac" }
            $vidDir = Join-Path $PatchDirs[$p] "chapter${Ch}_${plower}\vid"
            New-Item -ItemType Directory -Path $vidDir -Force | Out-Null
            Copy-Item "workspace\ch$Ch\vid\*" $vidDir -Recurse -Force
        }
    }
}

function Build-Patch([string]$Dir, [string]$Tag) {
    $PureName = "patch_chs_${Tag}_$date.7z"
    .\tool\7z a -t7z -mx=9 -ms=on -mmt=on $PureName ".\$Dir\*"
}

# ---------- 清理旧文件并初始化 ----------
Write-Host "Initializing directories..."
Remove-Item *.7z, *.tar.gz, *.dmg, *.exe, *.zip -Force -ErrorAction SilentlyContinue
New-CleanDir $TempDir
foreach ($d in $PatchDirs.Values) { New-CleanDir $d }

# ---------- 处理所有章节 ----------
1..5 | ForEach-Object { Process-Chapter $_ }

# ---------- 处理 Demo 文本 ----------
New-Item -ItemType Directory -Path "$($PatchDirs.WinDemo)\lang" -Force | Out-Null
New-Item -ItemType Directory -Path "$($PatchDirs.MacDemo)\lang" -Force | Out-Null
Copy-Item "workspace\result\demo\*.json" "$($PatchDirs.WinDemo)\lang" -Force
Copy-Item "workspace\result\demo\*.json" "$($PatchDirs.MacDemo)\lang" -Force

# ---------- 处理 Main & Demo XDelta ----------
Write-Host "Processing Main & Demo..."
Make-XDelta "data_win\current\main\data.win" "workspace\result\main\data.win" "$($PatchDirs.Win)\main.xdelta"
Make-XDelta "data_win\current\main\game.ios" "workspace\result\main\data.win" "$($PatchDirs.Mac)\main.xdelta"

1..$OldPatchCount | ForEach-Object {
    $oldMain = "data_win\old-$_\main"
    if (Test-Path $oldMain) {
        $hashWin = (Get-FileHash -Path "$oldMain\data.win" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
        Make-XDelta "$oldMain\data.win" "workspace\result\main\data.win" "$($PatchDirs.Win)\main_$hashWin.xdelta"
        
        $hashMac = (Get-FileHash -Path "$oldMain\game.ios" -Algorithm SHA256).Hash.Substring(0, 8).ToLower()
        Make-XDelta "$oldMain\game.ios" "workspace\result\main\data.win" "$($PatchDirs.Mac)\main_$hashMac.xdelta"
    }
}

Make-XDelta "data_win\current\demo\data.win" "workspace\result\demo\data.win" "$($PatchDirs.WinDemo)\main.xdelta"
Make-XDelta "data_win\current\demo\game.ios" "workspace\result\demo\data.win" "$($PatchDirs.MacDemo)\main.xdelta"

# ---------- 归一化并打包补丁 ----------
Write-Host "Normalizing timestamps and packing..."

$Tasks = @(
    @{ Dir=$PatchDirs.Win;     Tag="windowslinux" }
    @{ Dir=$PatchDirs.Mac;     Tag="macos" }
    @{ Dir=$PatchDirs.WinDemo; Tag="windowslinux_demo" }
    @{ Dir=$PatchDirs.MacDemo; Tag="macos_demo" }
)
foreach ($t in $Tasks) { Build-Patch $t.Dir $t.Tag }

# 清理中间文件
Remove-Item $TempDir -Recurse -Force
Write-Host "Phase 1 (Patch Generation) finished successfully."