
# PowerShell Script to Toggle OneDrive Visibility

param (
    [Parameter(Mandatory=$false)]
    [switch]$Restore
)

function Hide-OneDrive {
    Remove-Item -Path "$registryPath\$oneDriveGUID" -Force
    Write-Host "OneDrive has been hidden successfully."
}

function Unhide-OneDrive {
    New-Item -Path "$registryPath" -Name $oneDriveGUID -Force
    Write-Host "OneDrive has been unhidden successfully."
}

# Run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   
    Write-Warning "You do not have Administrator rights to run this script! Please re-run this as an Administrator!"
    exit
}

# Path to the OneDrive registry key
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"

# GUID for OneDrive
$oneDriveGUID = "{018D5C66-4533-4307-9B53-224DE2ED1FE6}"

# Hide or Unhide OneDrive based on the command line option
if ($Restore) {
    Unhide-OneDrive
} else {
    Hide-OneDrive
}

# Refreshing the Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Process explorer
