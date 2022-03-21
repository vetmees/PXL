$url = "http://go.microsoft.com/fwlink/?linkid=863265"
$output = "C:\temp\dotnet.exe"

Invoke-WebRequest -Uri $url -OutFile $output 
& "$output" /passive /norestart


