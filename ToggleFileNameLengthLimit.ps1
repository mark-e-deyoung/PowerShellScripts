
# PowerShell Script to Toggle File Name Length Limit in Windows

param (
    [Parameter(Mandatory=$false)]
    [switch]$Restore
)

function Enable-LongPathSupport {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1
    Write-Host "Long path support has been enabled."
}

function Disable-LongPathSupport {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 0
    Write-Host "Long path support has been disabled."
}

# Run as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {   
    Write-Warning "You do not have Administrator rights to run this script! Please re-run this as an Administrator!"
    exit
}

# Toggle the file name length limit based on the command line option
if ($Restore) {
    Disable-LongPathSupport
} else {
    Enable-LongPathSupport
}
