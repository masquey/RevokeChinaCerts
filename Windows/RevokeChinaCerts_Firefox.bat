:: RevokeChinaCerts Online batch Firefox version
:: Revoke Chinese certificates.
:: 
:: Contributions: Chengr28
:: 


@CHCP 65001
@ECHO off
CLS


:: Locate folder and architecture check.
SETLOCAL EnableDelayedExpansion
CD /D "%~dp0"
SET Certutil="%~dp0Tools\Certutil\certutil.exe"
SET Certificates="%~dp0..\Shared\Certificates


:: Check Firefox profile folder.
SET Portable=1
SET CommandType=%~1
SET CommandPath=%~2
IF "%CommandType%" == "" (
	ECHO RevokeChinaCerts Online batch Firefox version
	ECHO.
	ECHO Revoke certificates in installed Firefox profile? [Y/N]
	ECHO When you select N:
	ECHO * Certificates in portable Firefox profile will be revoked.
	ECHO * Enter portable profile path, like "x:\Firefox\Data\profile\.." without quotes.
	ECHO * The profile folder must include cert*.db database file.
	ECHO.
	ECHO All revoking requires Microsoft Visual C++ Redistributable 2015 x86 version.
	SET /P UserChoice="Choose: "
	ECHO.
	IF /I !UserChoice! EQU Y (
		SET Portable=0
	)
) ELSE (
	IF "%CommandPath%" == "" (
		SET Portable=0
	)
	ELSE (
		SET PortablePath=%CommandPath%
	)
)


:: Check installed Firefox profile.
IF %Portable% EQU 0 (
	CD /D "%APPDATA%\Mozilla\Firefox\Profiles"
	IF ERRORLEVEL 1 (
		ECHO.
		ECHO Cannot load any installed Firefox profiles!
		ECHO * Enter portable profile path, like "C:\Firefox\Data\profile\.." without quotes.
		ECHO * The profile folder must include cert*.db database file.
		ECHO.
		SET Portable=1
	)
)
IF NOT %Portable% EQU 0 (
	IF "%PortablePath%" == "" (
		SET /P PortablePath="Profile path: "
		ECHO.
	)
	CD /D "!PortablePath!"
	IF ERRORLEVEL 1 (
		ECHO.
		ECHO Cannot load Firefox profile path, please check your configuration.
		ECHO.
		PAUSE
		EXIT
	)
)


:: List all certificates.
IF %Portable% EQU 0 (
	DEL /F "%~dp0ProfileList.txt"
	DIR /A:D-S /B > "%~dp0ProfileList.txt"
	CLS
)


:: Command
IF NOT "%CommandType%" == "" (
	GOTO CASE_%CommandType%
)


:: Choice and scan all Firefox profile directories
CLS
ECHO RevokeChinaCerts Online batch Firefox version
ECHO.
ECHO 1: Base version
ECHO 2: Extended version
ECHO 3: All version
ECHO 4: Restore all Online revoking
ECHO.
ECHO * Make sure that Firefox is not running when batch is running.
ECHO * Please start and stop Firefox after restoring IF you want to restore and then revokes again.
ECHO.
SET /P UserChoice="Choose: "
SET UserChoice=CASE_%UserChoice%
CLS
GOTO %UserChoice%


:: Support functions
:REVOKE_SCAN
IF %Portable% EQU 0 (
	FOR /F "usebackq tokens=*" %%i IN ("%~dp0ProfileList.txt") DO CALL :REVOKE "%%i" "%%~1"
) ELSE (
	CALL :REVOKE %~1
)
GOTO :EOF

:REVOKE
IF %Portable% EQU 0 (
	CD /D "%APPDATA%\Mozilla\Firefox\Profiles\%~1"
	%Certutil% -d . -A -i %Certificates%\%~2.crt" -n %~2 -t "p,p,p"
) ELSE (
	CD /D "%PortablePath%"
	%Certutil% -d . -A -i %Certificates%\%~1.crt" -n %~1 -t "p,p,p"
)
GOTO :EOF

:RESTORE
IF %Portable% EQU 0 (
	DEL /F "%APPDATA%\Mozilla\Firefox\Profiles\%~1\cert*.db"
) ELSE (
	DEL /F "%PortablePath%\cert*.db"
)
GOTO :EOF


:: All version
:CASE_3
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.Root.CA.txt") DO CALL :REVOKE_SCAN "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.Intermediate.CA.txt") DO CALL :REVOKE_SCAN "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Low.SSL.txt") DO CALL :REVOKE_SCAN "%%i"

:: Extended version
:CASE_2
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.Root.CA.txt") DO CALL :REVOKE_SCAN "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.Intermediate.CA.txt") DO CALL :REVOKE_SCAN "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.Medium.SSL.txt") DO CALL :REVOKE_SCAN "%%i"

:: Base version
:CASE_1
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.Root.CA.txt") DO CALL :REVOKE_SCAN "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.Intermediate.CA.txt") DO CALL :REVOKE_SCAN "%%i"
FOR /F "usebackq tokens=*" %%i IN (%Certificates%\Severity.High.SSL.txt") DO CALL :REVOKE_SCAN "%%i"
GOTO END

:: Restore version
:CASE_4
IF %Portable% EQU 0 (
	FOR /F "usebackq tokens=*" %%i IN ("%~dp0ProfileList.txt") DO CALL :RESTORE "%%i"
) ELSE (
	CALL :RESTORE
)
GOTO END


:: End
:END
CD /D "%~dp0"
IF %Portable% EQU 0 (
	DEL /F "%~dp0ProfileList.txt"
)
ECHO.
ECHO RevokeChinaCerts Online batch Firefox version
ECHO Done, please confirm the messages on screen.
ECHO.
PAUSE
CLS
