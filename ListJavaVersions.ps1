
# PowerShell Script to List All Installed Java Versions, Including Registry Entries and User Locations

function Get-JavaVersions {
    # Paths to check for Java installations
    $javaPaths = @(
        "C:\Program Files\Java\*",
        "C:\Program Files (x86)\Java\*",
        "$env:LOCALAPPDATA\Programs\Java\*"
    )

    # Gathering Java installations from file system
    $javaVersions = @()
    foreach ($path in $javaPaths) {
        if (Test-Path $path) {
            Get-ChildItem -Path $path -Directory | ForEach-Object {
                $version = $_.Name
                $javaVersions += "Java Version: $version - Path: $($_.FullName)"
            }
        }
    }

    # Checking the registry for Java installations
    try {
        $javaRegPaths = @(
            "HKLM:\SOFTWARE\JavaSoft\Java Runtime Environment",
            "HKLM:\SOFTWARE\WOW6432Node\JavaSoft\Java Runtime Environment",
            "HKCU:\SOFTWARE\JavaSoft\Java Runtime Environment",
            "HKCU:\SOFTWARE\WOW6432Node\JavaSoft\Java Runtime Environment"
        )

        foreach ($regPath in $javaRegPaths) {
            if (Test-Path $regPath) {
                Get-ChildItem -Path $regPath | ForEach-Object {
                    $version = $_.GetValue("CurrentVersion")
                    $javaHome = $_.OpenSubKey($version).GetValue("JavaHome")
                    $javaVersions += "Java Version: $version - Path: $javaHome (from Registry)"
                }
            }
        }
    } catch {
        Write-Warning "An error occurred while reading from the registry."
    }

    # Returning the found Java versions
    if ($javaVersions.Count -eq 0) {
        Write-Host "No Java installations found."
    } else {
        Write-Host "Found Java Installations:"
        $javaVersions
    }
}

# Execute the function
Get-JavaVersions
