# DiskSpaceReport.ps1

param(
    [switch]$h, # Human-readable
    [switch]$k, # Kilobytes
    [switch]$m, # Megabytes
    [int]$B = 0 # Custom block size in bytes
)

function ConvertTo-Unit {
    param(
        [double]$Bytes,
        [string]$Unit
    )

    switch ($Unit) {
        "KB" { return [math]::Round($Bytes / 1KB, 2) }
        "MB" { return [math]::Round($Bytes / 1MB, 2) }
        "GB" { return [math]::Round($Bytes / 1GB, 2) }
        default { return $Bytes }
    }
}

# Get all drives
$drives = Get-PSDrive -PSProvider 'FileSystem'

# Determine the unit of measure
$unit = "GB" # Set default unit to GB
if ($k) { $unit = "KB" }
if ($m) { $unit = "MB" }
if ($B -gt 0) { $unit = "B" }

# Create a custom object for each drive and add it to an array
$driveInfo = @()
foreach ($drive in $drives) {
    # Calculate total, used, and available space in specified unit
    $total = ConvertTo-Unit -Bytes ($drive.Used + $drive.Free) -Unit $unit
    $used = ConvertTo-Unit -Bytes $drive.Used -Unit $unit
    $available = ConvertTo-Unit -Bytes $drive.Free -Unit $unit

    # Initialize use percentage
    $usePercent = "N/A"

    # Calculate the use percentage if total is not zero
    if ($total -gt 0) {
        $usePercentValue = [math]::Round(($used / $total) * 100)
        $usePercent = "$usePercentValue%"
    }

    # Add drive information to the array
    $driveInfo += New-Object PSObject -Property @{
        Filesystem = $drive.Name
        "Total ($unit)" = $total
        "Used ($unit)" = $used
        "Available ($unit)" = $available
        'Use%' = $usePercent
        'Mounted on' = $drive.Root
    }
}

# Display the information in a formatted table
$driveInfo | Format-Table -AutoSize
