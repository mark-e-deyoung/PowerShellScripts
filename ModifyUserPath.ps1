
# PowerShell 7 Script to Add or Remove a Path from User's Environment Variable

param (
    [string]$PathToModify = "$HOME\Bin",
    [switch]$Remove
)

function Add-PathToUserProfile {
    param (
        [string]$Path
    )

    # Getting the current path environment variable
    $currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)

    # Check if the path already exists in the environment variable
    if ($currentPath -like "*$Path*") {
        Write-Host "Path $Path already exists in user environment variable."
    } else {
        # Adding the new path
        $newPath = $currentPath + ";" + $Path
        [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)

        Write-Host "Path $Path added to user environment variable."
    }
}

function Remove-PathFromUserProfile {
    param (
        [string]$Path
    )

    # Getting the current path environment variable
    $currentPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)

    # Check if the path exists in the environment variable
    if ($currentPath -like "*$Path*") {
        # Removing the path
        $newPath = ($currentPath -split ';' | Where-Object { $_ -ne $Path }) -join ';'
        [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::User)

        Write-Host "Path $Path removed from user environment variable."
    } else {
        Write-Host "Path $Path does not exist in user environment variable."
    }
}

# Modify the PATH based on the command line option
if ($Remove) {
    Remove-PathFromUserProfile -Path $PathToModify
} else {
    Add-PathToUserProfile -Path $PathToModify
}
