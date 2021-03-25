Clear-Host
New-Item -ItemType Directory -Path c:\data1
1..50| ForEach-Object{New-Item -ItemType file -Path c:\data1 -Name "file_$_.txt"}