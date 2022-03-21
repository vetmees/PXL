Clear-Host
[int]$invoer= Read-Host "geef einde fibonacci index nummer"
$0 = 0
$0
$a = 1
$a
$b = 1
$b


for($i = 1;$i -le $invoer;$i++){
$som = $a + $b
Write-Host "$som"
$a = $b
$b = $som

}