#Automatically deploy wireless configurations

#Get Wifi Adapter GUID
$guid = (Get-NetAdapter 'wi-fi').InterfaceGuid

#Windows 7/8/8.1/10 wireless profile location
$InterfacesDirectory = "C:\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces\$guid"

#Location of Wireless Configurations
$DeploymentShare = "\\fileshare\Wireless Configuration"

#Import's XML(s) to configure wireless
#Gets all XML files from the deployment share and for each object it uses "netsh wlan add profile" to add the wireless profile.

Get-ChildItem $DeploymentShare | Where-Object {$_.Extension -eq ".xml"} | ForEach-Object {netsh wlan add profile filename=($DeploymentShare+"\"+$_.name)} 

