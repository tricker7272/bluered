@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Looking for Admin Access!
goto UACPrompt
) else ( goto Meet Admin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:Meet Admin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d 7onez /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName\ /v ComputerName /t REG_SZ /d 7onez /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ /v Hostname /t REG_SZ /d 7onez /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ /v "AD Host" /t REG_SZ /d AdityaRDP /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v Manufacturer /t REG_SZ /d "AdHost" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v Model /t REG_SZ /d "AdHost Virtual Machine" /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation /v SupportURL /t REG_SZ /d "https://github.com/7onez/AdityaRDP/issues" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f

curl -o "C:\Users\Administrator\Desktop\AutoTangLikeCheo.zip" "https://drive.google.com/uc?id=159CmpmXL54hX-sFxcoGMqrUQaMmLFRoq&export=download&confirm=t&uuid=3ce136a4-c505-4b75-a4c2-dfff56f31462"
cd 'C:\Users\\Administrator\Desktop';
expand AutoTangLikeCheo.zip -F:* .
cd 'C:\Users\\Administrator\Desktop\AutoTangLikeCheo'
Start 'AutoTangLikeCheo.exe'


