SET PortNumber="%1"
IF [%1] == [] SET PortNumber=8080

start "IIS Express" "C:\Program Files (x86)\IIS Express\iisexpress.exe" /path:%CD% /port:%PortNumber%
start "Browser" "http://localhost:%PortNumber%"
pause