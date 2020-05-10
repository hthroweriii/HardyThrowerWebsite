$ErrorActionPreference = 'Stop'
# Are you running in 32-bit mode?
#   (\SysWOW64\ = 32-bit mode)

if ($PSHOME -like "*SysWOW64*")
{
  Write-Warning "Restarting this script under 64-bit Windows PowerShell."

  # Restart this script under 64-bit Windows PowerShell.
  #   (\SysNative\ redirects to \System32\ for 64-bit mode)

  & (Join-Path ($PSHOME -replace "SysWOW64", "SysNative") powershell.exe) -File `
    (Join-Path $PSScriptRoot $MyInvocation.MyCommand) @args

  # Exit 32-bit script.

  Exit $LastExitCode
}

# Was restart successful?
Write-Warning "Hello from $PSHOME"
Write-Warning "  (\SysWOW64\ = 32-bit mode, \System32\ = 64-bit mode)"
Write-Warning "Original arguments (if any): $args"

# Your 64-bit script code follows here...
# TODO find out better way to call dotnet instead of using a hard coded location.
# Unfortuantely there are multiple versions of  dotnet installed and the deployment always chooses the wrong one :(
C:\Users\Administrator\AppData\Local\Microsoft\dotnet\dotnet.exe restore C:/HardyWebsite
C:\Windows\System32\inetsrv\appcmd.exe stop site "HardyWebsite"
C:\Users\Administrator\AppData\Local\Microsoft\dotnet\dotnet.exe publish C:/HardyWebsite --configuration release -o c:\HardyWebsite\publish 
C:\Windows\System32\inetsrv\appcmd.exe start site "HardyWebsite" 
