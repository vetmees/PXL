Clear-Host
[int]$a = Read-Host "getal 1 "
[int]$b = Read-Host "getal 2 "

if($a -gt $b){
Write-Host $a " is het grootste getal"}
elseif($a -lt $b){
Write-Host $b " is het grootste getal"}
else{
Write-Host "de getallen zijn gelijk"}