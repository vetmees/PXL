Clear-Host
[int]$invoer = Read-Host "Geef een getal op om de faculteit te berekenen"
$faculteit = $invoer
Do{
$invoer--
}
While ( $invoer -gt 2){
$invoer -= -1
$faculteit *= $invoer}
Write-Host "de faculteit van getal "$invoer " is: "$faculteit
