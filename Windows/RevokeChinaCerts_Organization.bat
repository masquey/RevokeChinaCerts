:: RevokeChinaCerts Organization batch
:: Revoke China Certificates.
:: 
:: Contributions: Hugo Chan, ntkme, Chengr28
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
SET Certificates="%~dp0Certificates\Organization
SET /A ForcePolicy = 0
SET SetForceAppender="%~dp0Tools\SoftCertPolicyAppender\Binary\SoftCertPolicyAppender.exe"


:: Command
SET CommandType=%~1
SET CommandPolicy=%~2
IF "%CommandPolicy%" == "-f" (
	SET /A ForcePolicy=1
)
IF NOT "%CommandType%" == "" (
	GOTO CASE_%CommandType%
)


:: Choice
ECHO RevokeChinaCerts Organization batch
ECHO.
ECHO Do you want to SET force certificate policy? [Y/N]
ECHO Setting force require:
ECHO   Administrative Privileges
ECHO   Microsoft .NET Framework 4.0 or later version
SET /P UserChoice="Choose: "
IF /I %UserChoice% EQU Y (
	SET /A ForcePolicy=1
)
ECHO.
ECHO 1: Revoke all Organization certificates
ECHO 2: Restore all Organization revoking
ECHO Notice: Choice version is no longer available. Please remove the certificate fingerprint(s) in 
ECHO         /Windows/Certificates/CodeSigning/CodeSigning.txt or 
ECHO         /Windows/Certificates/Organization/Organization.txt to 
ECHO         make it/them not to be revoked.
ECHO.
SET /P UserChoice="Choose: "
SET UserChoice=CASE_%UserChoice%
CLS
GOTO %UserChoice%


:: Support functions
:REVOKE_SYSTEM
%CertMgr% -add -c %Certificates%\%~1.crt" -s -r localMachine Disallowed
%CertMgr% -add -c %Certificates%\%~1.crt" -s -r currentUser Disallowed
GOTO :EOF

:REVOKE_POLICY
IF "%CommandType%" == "" (
	%SetForceAppender% --set-force --interval 1000 %Certificates%\%~1.crt"
) ELSE (
	%SetForceAppender% --set-force --quiet --interval 1000 %Certificates%\%~1.crt"
)
GOTO :EOF

:RESTORE_SYSTEM
%CertMgr% -del -c -sha1 %~1 -s -r localMachine Disallowed
%CertMgr% -del -c -sha1 %~1 -s -r currentUser Disallowed
GOTO :EOF

:RESTORE_POLICY
IF "%CommandType%" == "" (
	%SetForceAppender% --remove --unset-force --interval 1000 %Certificates%\%~1.crt"
) ELSE (
	%SetForceAppender% --remove --unset-force --quiet --interval 1000 %Certificates%\%~1.crt"
)
GOTO :EOF


:: All version
:CASE_1
IF %ForcePolicy% EQU 0 (
	FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Organization.txt") DO CALL :REVOKE_SYSTEM "%%i"
) ELSE (
	FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Organization.txt") DO CALL :REVOKE_POLICY "%%i"
)
GOTO END


:: Restore version
:CASE_2
IF %ForcePolicy% EQU 1 (
	FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Organization.txt") DO CALL :RESTORE_POLICY "%%i"
)
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Organization.txt") DO CALL :RESTORE_SYSTEM "%%i"
GOTO END


:: End
:END
COLOR
CD /D "%~dp0"
ECHO.
ECHO RevokeChinaCerts Organization batch
ECHO Done, please confirm the messages on screen.
ECHO.
PAUSE
CLS
