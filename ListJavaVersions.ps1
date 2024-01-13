
# PowerShell Script to List All Installed Java Versions

function Get-JavaVersions {
    # Paths to check for Java installations
    $javaPaths = @(
        "C:\Program Files\Java\*",
        "C:\Program Files (x86)\Java\*"
    )

    # Gathering Java installations
    $javaVersions = @()
    foreach ($path in $javaPaths) {
        if (Test-Path $path) {
            Get-ChildItem -Path $path -Directory | ForEach-Object {
                $version = $_.Name
                $javaVersions += "Java Version: $version - Path: $($_.FullName)"
            }
        }
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
