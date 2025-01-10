# Script to rebuild and reinstall the display-names package
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Ensure we're in the correct directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -Path $scriptPath

Write-Output "Starting rebuild process..."
$host.UI.RawUI.ForegroundColor = "Cyan"

# Step 1: Clean directories
if (Test-Path "dist") {
    Remove-Item -Path "dist" -Recurse -Force
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Cleaned dist directory"
}

if (Test-Path "node_modules") {
    Remove-Item -Path "node_modules" -Recurse -Force
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Cleaned node_modules directory"
}

# Step 2: Install dependencies
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output "Installing dependencies..."
$host.UI.RawUI.ForegroundColor = "White"

npm install

if ($LASTEXITCODE -eq 0) {
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Dependencies installed successfully!"
} else {
    $host.UI.RawUI.ForegroundColor = "Red"
    Write-Output "Dependencies installation failed!"
    $host.UI.RawUI.ForegroundColor = "White"
    exit 1
}

# Step 3: Rebuild the package
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output "Building package..."
$host.UI.RawUI.ForegroundColor = "White"

npm run build

if ($LASTEXITCODE -eq 0) {
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Build successful!"
} else {
    $host.UI.RawUI.ForegroundColor = "Red"
    Write-Output "Build failed!"
    $host.UI.RawUI.ForegroundColor = "White"
    exit 1
}

# Step 4: Change to testing directory and reinstall
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output "Reinstalling in test environment..."
$host.UI.RawUI.ForegroundColor = "White"

Set-Location -Path "../TestingUnderstandingNpm"

# Clean directories in testing project
if (Test-Path "dist") {
    Remove-Item -Path "dist" -Recurse -Force
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Cleaned dist directory in testing project"
}

if (Test-Path "node_modules") {
    Remove-Item -Path "node_modules" -Recurse -Force
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Cleaned node_modules directory in testing project"
}

# Install dependencies in testing project
npm install

if ($LASTEXITCODE -eq 0) {
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "Installation successful!"
} else {
    $host.UI.RawUI.ForegroundColor = "Red"
    Write-Output "Installation failed!"
    $host.UI.RawUI.ForegroundColor = "White"
    exit 1
}

# Step 5: Build the TestingUnderstandingNpm project
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output "Building TestingUnderstandingNpm project..."
$host.UI.RawUI.ForegroundColor = "White"

npm run build

if ($LASTEXITCODE -eq 0) {
    $host.UI.RawUI.ForegroundColor = "Green"
    Write-Output "TestingUnderstandingNpm build successful!"
} else {
    $host.UI.RawUI.ForegroundColor = "Red"
    Write-Output "TestingUnderstandingNpm build failed!"
    $host.UI.RawUI.ForegroundColor = "White"
    exit 1
}

# Return to original directory
Set-Location -Path "../UnderstandingNpm"

$host.UI.RawUI.ForegroundColor = "Cyan"
Write-Output "All done! You can now test your changes."
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output "IMPORTANT: To see the changes:"
Write-Output "1. Open TestingUnderstandingNpm/index.html in your browser"
Write-Output "2. Press Ctrl+F5 to force a complete refresh"
$host.UI.RawUI.ForegroundColor = "White" 