SET PortNumber="%1"
IF [%1] == [] SET PortNumber=8080

SET InstallDir="C:\Program Files (x86)\IIS Express\"

SET RegKey=HKLM\Software\Microsoft\IISExpress
SET RegVal=InstallPath
for /f "tokens=2,*" %%a in ('reg query %RegKey% /s /v %RegVal% ^| findstr %RegVal%') do (
    SET InstallDir=%%b
)

ECHO %InstallDir%

start "IIS Express" "%InstallDir%\iisexpress.exe" /path:"%CD%" /port:%PortNumber%
start "Browser" "http://localhost:%PortNumber%"
