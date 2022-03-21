Import-Module ServerManager


## basic authentication aanzetten
# installatie web-basic-auth
Add-WindowsFeature Web-Basic-Auth

# anonieme authentication: uit
Set-WebConfigurationProperty `
-filter /system.webServer/security/authentication/anonymousAuthentication `
-name enabled `
-value false `
-PSPath IIS:\ `
-Location "inside" 


# basic authentication aan
 Set-WebConfigurationProperty `
-filter /system.webServer/security/authentication/basicAuthentication `
-name enabled `
-value true `
-PSPath IIS:\ `
-Location "inside"  

invoke-command -scriptblock {iisreset}

## Windows Authentication aan
Import-Module ServerManager
Add-WindowsFeature Web-Windows-Auth
Set-WebConfigurationProperty `
-filter /system.webServer/security/authentication/basicAuthentication `
-name enabled `
-value false `
-PSPath IIS:\ `
-Location "inside" 

Set-WebConfigurationProperty `
-filter /system.webServer/security/authentication/windowsAuthentication `
-name enabled `
-value true `
-PSPath IIS:\ `
-Location "inside" 

invoke-command -scriptblock {iisreset}

