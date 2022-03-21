cls
Write-Output "* Rapport Windows Systeem $env:COMPUTERNAME $([Environment]::OSVersion)"
Write-Output "* Lijst: Automatic Services van LocalSystem"
Get-Service * | select name, DisplayName, username, StartType  