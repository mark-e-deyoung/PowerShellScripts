
# PowerShell 7 Script to Add 'Bin' in User's Home to Environment Variable

param (
    [string]$PathToAdd = "$HOME\Bin"
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

# Call the function with either the default 'Bin' directory or the provided path
Add-PathToUserProfile -Path $PathToAdd
