# Define the action for the scheduled task to run the script
$action = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument '/c "C:\Program Files (x86)\Sophos\Connect\sccli" enable -n 115.246.27.108'

# Define the trigger for the scheduled task to run every 15 minutes
$trigger1 = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 15)

# Define the settings for the scheduled task
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd

# Create the scheduled task with the specified action and trigger for every 15 minutes
Register-ScheduledTask -TaskName "InternetConnectedTask_15mins" -Action $action -Trigger $trigger1 -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd)

# Define the trigger for the scheduled task to run at logon
$trigger2 = New-ScheduledTaskTrigger -AtLogOn

# Define the settings for the scheduled task
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd

# Create the scheduled task with the specified action and trigger for logon
Register-ScheduledTask -TaskName "InternetConnectedTask_Logon" -Action $action -Trigger $trigger2 -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd)
