
# PowerShell Script to Clear Quick Access Entries in File Explorer

function Clear-QuickAccess {
    try {
        # Clearing recent files
        $recentItems = [System.Environment]::GetFolderPath('Recent')
        Remove-Item "$recentItems\*" -Force

        # Clearing Quick Access
        $automaticDestinations = "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations"
        Remove-Item "$automaticDestinations\*" -Force

        Write-Host "Quick Access entries have been cleared."
    } catch {
        Write-Host "An error occurred while clearing Quick Access entries."
    }
}

# Execute the function
Clear-QuickAccess
