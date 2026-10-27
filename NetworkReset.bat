@echo off
for /f "skip=2 tokens=3*" %%i in ('netsh interface show interface') do (
netsh int ip set address "%%j" dhcp
netsh int ip set dns "%%j" dhcp
netsh interface set interface name="%%j" admin=enabled
)
certutil -URLCache * delete
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
ipconfig /release >nul
ipconfig /renew >nul
ipconfig /flushdns
netsh advfirewall reset
netsh winsock reset
