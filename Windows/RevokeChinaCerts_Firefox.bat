:: RevokeChinaCerts Online(Firefox) batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off


:: Locate directory and architecture check
cd /D "%~dp0"
set Certutil="%~dp0Tools\Certutil\certutil.exe"
set Certificates="%~dp0..\Shared\Certificates


:: Check Firefox profiles
echo RevokeChinaCerts Online(Firefox) batch
echo.
cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
if ERRORLEVEL 1 (
	echo.
	echo Cannot load any Firefox profiles, please check your configuration.
	echo.
	pause
	exit
)


:: Choice and scan all Firefox profile directories
echo 1: Base version
echo 2: Extended version
echo 3: All version
echo 4: Restore all Online revoking
echo.
set /P UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
dir /A:D-S /B > "%~dp0ProfileList.txt"
cls
goto %UserChoice%


:: Process
:REVOKE_SCAN
for /F "usebackq tokens=*" %%i in ("%~dp0ProfileList.txt") do call :REVOKE %%i %%1
goto :EOF

:REVOKE
cd /D "%APPDATA%\Mozilla\Firefox\Profiles\%~1"
%Certutil% -d . -A -i %Certificates%\%2.crt" -n %2 -t "p,p,p"
goto :EOF

:RESTORE
del "%APPDATA%\Mozilla\Firefox\Profiles\%1\cert8.db"
goto :EOF


:: All version
:CASE_3
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.Low.Root.CA.txt") do call :REVOKE_SCAN %%i
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.Low.Intermediate.CA.txt") do call :REVOKE_SCAN %%i
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.Low.SSL.txt") do call :REVOKE_SCAN %%i

:: Extended version
:CASE_2
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.Medium.Root.CA.txt") do call :REVOKE_SCAN %%i
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.Medium.Intermediate.CA.txt") do call :REVOKE_SCAN %%i
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.Medium.SSL.txt") do call :REVOKE_SCAN %%i

:: Base version
:CASE_1
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.High.Root.CA.txt") do call :REVOKE_SCAN %%i
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.High.Intermediate.CA.txt") do call :REVOKE_SCAN %%i
for /F "usebackq tokens=*" %%i in (%Certificates%\Severity.High.SSL.txt") do call :REVOKE_SCAN %%i
goto EXIT

:: Restore version
:CASE_4
for /F "usebackq tokens=*" %%i in ("%~dp0ProfileList.txt") do call :RESTORE %%i


:: Exit
:EXIT
del "%~dp0ProfileList.txt"
echo.
echo RevokeChinaCerts Online(Firefox) batch
echo Done, please confirm the messages on screen.
echo.
pause
