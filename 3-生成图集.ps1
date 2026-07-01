# 3-生成图集.ps1
# 执行此脚本前请先安装 Node.JS
if (-not (Test-Path -Path atlas_packer/node_modules)) {
    Write-Host "Installing node dependencies..."
    npm install --prefix atlas_packer
}
node atlas_packer/run.js
