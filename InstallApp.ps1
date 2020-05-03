#TODO find out better way to call dotnet instead of using a hard coded location.
#Unfortuantely there are multiple versions of  dotnet installed and the deployment always chooses the wrong one :(
C:\Users\Administrator\AppData\Local\Microsoft\dotnet\dotnet.exe restore
C:\Users\Administrator\AppData\Local\Microsoft\dotnet\dotnet.exe dotnet publish --configuration release -o c:\HardyWebsite\publish 

C:\Windows\System32\inetsrv\appcmd.exe stop site "HardyWebsite"
C:\Windows\System32\inetsrv\appcmd.exe start site "HardyWebsite" 
