:: RevokeChinaCerts Online batch
:: Revoke China Certificates.
:: 
:: Author: JayXon, Hugo Chan, ntkme, Chengr28
:: 

@echo off


:: Locate folder, architecture check, choice and update certificates
cd /d "%~dp0"
set CertMgr="%~dp0\Tools\CertMgr.exe"
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (
	set CertMgr="%~dp0\Tools\CertMgr_x86.exe"
)
set Certificates=%~dp0\..\Shared\Certificates
echo RevokeChinaCerts Online batch
echo.
echo 1: Base version
echo 2: Extended version
echo 3: All version
echo 4: Restore all Online revoking
echo.
set /p UserChoice="Choose: "
if %UserChoice% GTR 0 (if %UserChoice% LEQ 4 ("%~dp0\Tools\RootSUPD_201403_x86.exe"))
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:REVOKE_ROOT_CA
%CertMgr% -del -c -sha1 %1 -s -r localMachine Root
%CertMgr% -del -c -sha1 %1 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 %1 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 %1 -s -r CurrentUser AuthRoot
%CertMgr% -add -c "%Certificates%\%1.crt" -s Disallowed
goto :EOF

:REVOKE_INTERMEDIATE_CA
%CertMgr% -del -c -sha1 %1 -s -r localMachine CA
%CertMgr% -del -c -sha1 %1 -s -r CurrentUser CA
%CertMgr% -add -c "%Certificates%\%1.crt" -s Disallowed
goto :EOF

:REVOKE_SSL
call :REVOKE_ROOT_CA %1
goto :EOF

:RESTORE
%CertMgr% -del -c -sha1 %1 -s Disallowed
goto :EOF


:: All version
:CASE_3
for /F "tokens=*" %%i in (%Certificates%\Severity.Low.Root.CA.txt) do call :REVOKE_ROOT_CA %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Low.Intermediate.CA.txt) do call :REVOKE_INTERMEDIATE_CA %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Low.SSL.txt) do call :REVOKE_SSL %%i

:: Extended version
:CASE_2
for /F "tokens=*" %%i in (%Certificates%\Severity.Medium.Root.CA.txt) do call :REVOKE_ROOT_CA %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Medium.Intermediate.CA.txt) do call :REVOKE_INTERMEDIATE_CA %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Medium.SSL.txt) do call :REVOKE_SSL %%i

:: Base version
:CASE_1
for /F "tokens=*" %%i in (%Certificates%\Severity.High.Root.CA.txt) do call :REVOKE_ROOT_CA %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.High.Intermediate.CA.txt) do call :REVOKE_INTERMEDIATE_CA %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.High.SSL.txt) do call :REVOKE_SSL %%i
goto EXIT

:: Restore certificates
:CASE_4
for /F "tokens=*" %%i in (%Certificates%\Severity.High.Root.CA.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.High.Intermediate.CA.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.High.SSL.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Medium.Root.CA.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Medium.Intermediate.CA.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Medium.SSL.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Low.Root.CA.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Low.Intermediate.CA.txt) do call :RESTORE %%i
for /F "tokens=*" %%i in (%Certificates%\Severity.Low.SSL.txt) do call :RESTORE %%i


:: Print to screen.
:EXIT
echo.
echo RevokeChinaCerts Online batch
echo Done, please confirm the messages on screen.
echo.
@pause
