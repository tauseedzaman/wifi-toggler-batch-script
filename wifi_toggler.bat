@echo off
%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin

set interface="Ethernet"
ipconfig | find %interface% >NUL

rem if errorlevel 0 goto LAN
rem if errorlevel 1 goto WLAN
if %errorlevel% EQU 0 goto LAN
if %errorlevel% EQU goto WLAN

:WLAN
echo "WLAN"
netsh interface set interface %interface% enabled
goto end
:LAN
echo "LAN"
netsh interface set interface %interface% disabled
goto end

:end