# Define the script that checks for internet connectivity
$script = {
    while (-not (Test-Connection -ComputerName google.com -Count 1 -Quiet)) {
        Start-Sleep -Seconds 60  # Wait for 60 seconds before checking again
    }
    # Internet connection detected, execute your desired action here
    Write-Host ""C:\Program Files (x86)\Sophos\Connect\sccli" enable -n 115.246.27.108"
    # Replace the following line with the actual command or script you want to run
    # Invoke-Expression -Command 'Your-Command-Here'
}

# Define the action for the scheduled task to run the script
$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -Command `"$script`""

# Define the trigger for the scheduled task (e.g., run when the system starts up)
$trigger = New-ScheduledTaskTrigger -AtStartup

# Define the settings for the scheduled task
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd

# Create the scheduled task with the specified action, trigger, and settings
Register-ScheduledTask -TaskName "InternetConnectedTask" -Action $action -Trigger $trigger -Settings $settings
