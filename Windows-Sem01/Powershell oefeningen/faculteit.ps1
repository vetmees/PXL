﻿Clear-Host
[string]$invoer = Read-Host -prompt “Waarvan wilt u de faculteit berekenen?”
[int]$getal = [int]$invoer
[int[]]$verzameling = 1..$getal
$oplossing = Invoke-Expression $oplossing
Write-Host “$getal! = $oplossing"