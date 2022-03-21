Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools

Import-Module ServerManager
Add-WindowsFeature Web-Scripting-Tools
Import-Module WebAdministration

cd IIS:\Sites\ 

# kijk naar resultaat


# plaats waar website wordt opgeslagen
$insidepath = "C:\inetpub\inside"

# naam van website
$insidename = 'inside'

# domain
$insidedomain = 'inside.pxl.local'

# plaats waar de website staat
$insidesource = 'C:\temp\insidewebfiles'

 
# maak website aan
 if (!(Test-Path IIS:\Sites\$insidename))
	{
	New-Item IIS:\Sites\$insidename `
	-bindings @{protocol="http";bindingInformation="*:80:$insidedomain"} `
	-physicalPath $insidepath -Verbose -Force
	}

# inhoud website verwijderen 
Remove-Item -Path $insidepath\* -Recurse 

# kopiëren van website
Copy-Item -Path C:\temp\insidewebfiles\* `
   	 -Destination $insidepath `
	 -Recurse

# reset iis
Invoke-Command -ScriptBlock {iisreset} 