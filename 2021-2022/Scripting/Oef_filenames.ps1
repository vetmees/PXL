Get-ChildItem  'C:\Windows' -File| Select-Object -Property Name |Out-File .\filenames.txt
Get-Content .\filenames.txt