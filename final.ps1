
# Define the action for the scheduled task to run the script
$action = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument '/c "C:\Program Files (x86)\Sophos\Connect\sccli" enable -n 115.246.27.108'

# Define the trigger for the scheduled task (e.g., run when the system starts up)
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)

# Define the settings for the scheduled task
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd

# Create the scheduled task with the specified action, trigger, and settings
Register-ScheduledTask -TaskName "InternetConnectedTask" -Action $action -Trigger $trigger -Settings $settings