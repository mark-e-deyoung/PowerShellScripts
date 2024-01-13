
# PowerShell 7 Script to Toggle Recycle Bin Visibility on Desktop

param (
    [Parameter(Mandatory=$false)]
    [switch]$Restore
)

function Hide-RecycleBin {
    $keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
    Set-ItemProperty -Path $keyPath -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value 1
    Write-Host "Recycle Bin has been hidden from the desktop."
}

function Show-RecycleBin {
    $keyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
    Set-ItemProperty -Path $keyPath -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value 0
    Write-Host "Recycle Bin has been shown on the desktop."
}

# Run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   
    Write-Warning "You do not have Administrator rights to run this script! Please re-run this as an Administrator!"
    exit
}

# Hide or Show Recycle Bin based on the command line option
if ($Restore) {
    Show-RecycleBin
} else {
    Hide-RecycleBin
}

# Refreshing the Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Process explorer
