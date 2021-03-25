Clear-Host
$a=0
$b=1
$invoer = Read-Host "geef het eind index nummer van fibonnaci op: "
for ([int]$i = 2; $i -lt $invoer; $i++){
$som = $a+$b
$a=$b
$b=$som}