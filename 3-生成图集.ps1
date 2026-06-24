# 3-生成图集.ps1
if (-not (Test-Path -Path atlas_packer/node_modules)) {
    Write-Host "Installing node dependencies..."
    npm install --prefix atlas_packer
}
node atlas_packer/run.js
