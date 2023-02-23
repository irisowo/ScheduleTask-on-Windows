
####################### CONFIG ##########################

# Scheduled task description
$DESCRIPTION = "The job is to execute collect_info.ps1 every 10 minutes."

# Scheduled task name
$TASKNAME = "CS_project"

# Scheduled task
$TASKPATH = "\Users\scripts\schedule.ps1"

# Script to hide the window
$Hidden = "\Users\scripts\HiddenPowershell.vbs"

# Script to schedule
$SCRIPT = "C:\Users\scripts\collect_info.ps1"

########################################################

Function CreateScheduledTaskFolder ($TASKPATH)
{
    $ERRORACTIONPREFERENCE = "stop"
    $SCHEDULE_OBJECT = New-Object -ComObject schedule.service
    $SCHEDULE_OBJECT.connect()
    $ROOT = $SCHEDULE_OBJECT.GetFolder("\")
    Try {$null = $SCHEDULE_OBJECT.GetFolder($TASKPATH)}
    Catch { $null = $ROOT.CreateFolder($TASKPATH) }
    Finally { $ERRORACTIONPREFERENCE = "continue" } 
}

Function CreateScheduledTask ($TASKNAME, $TASKPATH)
{
    $ACTION = New-ScheduledTaskAction -Execute "wscript.exe" -Argument "$Hidden -ExecutionPolicy ByPass -File $SCRIPT"
    $TRIGGER =   New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 10)
    Register-ScheduledTask -Action $ACTION -Trigger $TRIGGER -TaskName $TASKNAME -Description "$DESCRIPTION" -TaskPath $TaskPath -RunLevel Highest
}

Function ConfigureScheduledTaskSettings ($TASKNAME, $TASKPATH)
{
    $SETTINGS = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden -ExecutionTimeLimit (New-TimeSpan -Minutes 1) -RestartCount 3
    Set-ScheduledTask -TaskName $TASKNAME -Settings $SETTINGS -TaskPath $TASKPATH 
}

#CreateScheduledTaskFolder $TASKNAME $TASKPATH
CreateScheduledTask $TASKNAME $TASKPATH | Out-Null
ConfigureScheduledTaskSettings $TASKNAME $TASKPATH | Out-Null
