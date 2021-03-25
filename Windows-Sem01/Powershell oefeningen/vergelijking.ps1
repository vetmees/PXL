Clear-Host
[long]$r1=0
[long]$r2=0
$a = Read-Host "waarde a"
$b = Read-Host "waarde b"
$c = Read-Host "waarde c"
[long]$discriminant =  ($b * $b) - (4 * $a * $c)
[long]$sqrt = [Math]::Sqrt($discriminant)

if($discriminant -gt 0){
$r1 = (-$b +$sqrt)/(2*$a)
$r2 = (-$b - $sqrt)/(2*$a)
Write-Host "roots are :: "$r1 " & " $r2}
elseif($discriminant -is 0){
Write-Host "root is :: " + (-$b + $sqrt)/(2*$a)}