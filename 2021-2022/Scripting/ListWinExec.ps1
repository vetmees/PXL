Get-ChildItem 'C:\Windows'  | Where-Object Extension -EQ ".exe"| Where-Object Length -ge 128 | Where-Object IsReadOnly -EQ $false
