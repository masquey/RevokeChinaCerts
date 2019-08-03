:: RevokeChinaCerts Online batch
:: Revoke Chinese certificates.
:: 
:: Contributions: JayXon, Hugo Chan, ntkme, Chengr28
:: 


@CHCP 65001
@ECHO off
CLS


:: Check administrative permission.
net session >nul 2>nul
IF ERRORLEVEL 1 (
	COLOR 4F
	ECHO Please run as Administrator.
	ECHO.
	PAUSE & BREAK
	ECHO.
	CLS
)


:: Locate folder and architecture check.
CD /D "%~dp0"
SET CertMgr="%~dp0Tools\CertMgr.exe"
IF %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (
	SET CertMgr="%~dp0Tools\CertMgr_x86.exe"
)
SET Certificates="%~dp0..\Shared\Certificates


:: Command
SET Command=%~1
IF NOT "%Command%" == "" (
	GOTO CASE_%Command%
)


:: Choice
ECHO RevokeChinaCerts Online batch
ECHO.
ECHO 1: Base version
ECHO 2: Extended version
ECHO 3: All version
ECHO 4: Restore all Online revoking
ECHO.
SET /P UserChoice="Choose: "
SET UserChoice=CASE_%UserChoice%
CLS
GOTO %UserChoice%


:: Support functions
:REVOKE_ROOT_CA
%CertMgr% -del -c -sha1 %~1 -s -r localMachine Root
%CertMgr% -del -c -sha1 %~1 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 %~1 -s -r currentUser Root
%CertMgr% -del -c -sha1 %~1 -s -r currentUser AuthRoot
%CertMgr% -add -c %Certificates%\%~1.crt" -s -r localMachine Disallowed
%CertMgr% -add -c %Certificates%\%~1.crt" -s -r currentUser Disallowed
GOTO :EOF

:REVOKE_INTERMEDIATE_CA
%CertMgr% -del -c -sha1 %~1 -s -r localMachine CA
%CertMgr% -del -c -sha1 %~1 -s -r currentUser CA
%CertMgr% -add -c %Certificates%\%~1.crt" -s -r localMachine Disallowed
%CertMgr% -add -c %Certificates%\%~1.crt" -s -r currentUser Disallowed
GOTO :EOF

:REVOKE_SSL
CALL :REVOKE_ROOT_CA %~1
GOTO :EOF

:RESTORE
%CertMgr% -del -c -sha1 %~1 -s -r localMachine Disallowed
%CertMgr% -del -c -sha1 %~1 -s -r currentUser Disallowed
GOTO :EOF


:: All version
:CASE_3
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.Root.CA.txt") DO CALL :REVOKE_ROOT_CA "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.Intermediate.CA.txt") DO CALL :REVOKE_INTERMEDIATE_CA "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.SSL.txt") DO CALL :REVOKE_SSL "%%i"

:: Extended version
:CASE_2
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.Root.CA.txt") DO CALL :REVOKE_ROOT_CA "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.Intermediate.CA.txt") DO CALL :REVOKE_INTERMEDIATE_CA "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.SSL.txt") DO CALL :REVOKE_SSL "%%i"

:: Base version
:CASE_1
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.Root.CA.txt") DO CALL :REVOKE_ROOT_CA "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.Intermediate.CA.txt") DO CALL :REVOKE_INTERMEDIATE_CA "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.SSL.txt") DO CALL :REVOKE_SSL "%%i"
GOTO END

:: Restore version
:CASE_4
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.Root.CA.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.Intermediate.CA.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.SSL.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.Root.CA.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.Intermediate.CA.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.SSL.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.Root.CA.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.Intermediate.CA.txt") DO CALL :RESTORE "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.SSL.txt") DO CALL :RESTORE "%%i"
GOTO END


:: End
:END
COLOR
CD /D "%~dp0"
ECHO.
ECHO RevokeChinaCerts Online batch
ECHO Done, please confirm the messages on screen.
ECHO.
PAUSE
CLS
