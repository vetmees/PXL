Clear-Host
[int]$einde = -1
$som =0
$plus =1
do{
[int]$a = Read-Host "Geef een getal in"
$som += $a
}while ($a -notmatch $einde)
$uitkomst = $som + $plus
Write-Host "De som van de getallen is" $uitkomst
