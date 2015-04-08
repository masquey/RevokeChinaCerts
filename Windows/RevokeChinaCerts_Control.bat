:: RevokeChinaCerts Control batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off


:: Locate folder and convert newline format
cd /d "%~dp0"
find "" /V <"%~dp0RevokeChinaCerts_Online.bat">"%~dp0RevokeChinaCerts_Online.bat.new"
find "" /V <"%~dp0RevokeChinaCerts_CodeSigning.bat">"%~dp0RevokeChinaCerts_CodeSigning.bat.new"
find "" /V <"%~dp0RevokeChinaCerts_Organization.bat">"%~dp0RevokeChinaCerts_Organization.bat.new"
del "%~dp0RevokeChinaCerts_Online.bat"
del "%~dp0RevokeChinaCerts_CodeSigning.bat"
del "%~dp0RevokeChinaCerts_Organization.bat"
ren "%~dp0RevokeChinaCerts_Online.bat.new" RevokeChinaCerts_Online.bat
ren "%~dp0RevokeChinaCerts_CodeSigning.bat.new" RevokeChinaCerts_CodeSigning.bat
ren "%~dp0RevokeChinaCerts_Organization.bat.new" RevokeChinaCerts_Organization.bat


:: Choice
echo RevokeChinaCerts Control batch
echo.
echo 1: Online
echo 2: CodeSigning
echo 3: Organization
echo.
set /p UserChoice="Choose: "
cls
if %UserChoice% EQU 2 (
	"%~dp0RevokeChinaCerts_CodeSigning.bat"
) else (
	if %UserChoice% EQU 3 (
		"%~dp0RevokeChinaCerts_Organization.bat"
	) else (
		"%~dp0RevokeChinaCerts_Online.bat"
	)
)

:: Exit
exit
