dotnet restore
dotnet publish --configuration release -o c:\HardyWebsite\publish 

C:\Windows\System32\inetsrv\appcmd.exe stop site "HardyWebsite"
C:\Windows\System32\inetsrv\appcmd.exe start site "HardyWebsite" 
