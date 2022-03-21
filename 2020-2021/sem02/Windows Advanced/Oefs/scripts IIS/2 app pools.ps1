$insidepath = "C:\inetpub\inside"
$insidename = 'inside'
$insidedomain = 'inside.pxl.local'
$insidesource = 'C:\temp\insidewebfiles'


Import-Module WebAdministration
cd IIS:\AppPools 


dir

# kijk welke er nu zijn

if(!(Test-Path IIS:\AppPools\$insidename))
	{
	    $appPool = New-Item $insidename
	    $appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value 'v4.0’
	    $appPool | Set-ItemProperty -Name "enable32BitAppOnWin64" -Value $True
	}

	Set-ItemProperty iis:\Sites\$insidename -Name applicationpool -Value $insidename

dir IIS:\AppPools
