Clear-Host
New-Item -ItemType Directory -Path c:\running_processes
Get-Process * | Out-File c:\running_processes\p.txt
Stop-Process -Name "notepad","mspaint","winword" -Force