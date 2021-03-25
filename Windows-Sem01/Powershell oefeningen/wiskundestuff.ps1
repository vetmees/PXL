Clear-Host
[int]$a = Read-Host "geef waarde A op"
[int]$b = Read-Host "geef waarde B op"
$plus = $a + $b
$min = $a - $b
$maal = $a * $b
$delen = $a / $b
Write-Host "de uitkomst van a + b =" $plus
Write-Host "de uitkomst van a - b =" $min
Write-Host "de uitkomst van a * b =" $maal
Write-Host "de uitkomst van a / b =" $delen