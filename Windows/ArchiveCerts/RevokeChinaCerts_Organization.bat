:: RevokeChinaCerts Organization batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off

:: Folder location
cd /d %~dp0
cd..
set Folder=%cd%

:: Architecture check
set CertMgr="%Folder%\Tools\CertMgr"
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" set CertMgr="%Folder%\Tools\CertMgr_x86"

:: Add certificates to CRL
set Folder=%Folder%\ArchiveCerts\Organization
%CertMgr% -add -c "%Folder%\ABC.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ABC_TEST_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ABC2048.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\AlibabaCom_Corporation_Root_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ALIPAY_ROOT.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Alipay_Trust_NetWork.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\BOCOMCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_199906.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_200906.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA_CS_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA_CS_TEST_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA_Operation_CA3.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA_RCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA_Root_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\CFCA_RSA_RCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\China_Trust_Network_1.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\China_Trust_Network_2.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\China_Trust_Network_3.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ICBC.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ICBC_Root_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\IcbcCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_1.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_2.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_3.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Personal_ICBC_CA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ROOTCA_OSCCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\SZCA.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\SZCA_200307.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\TenpayCom_Root_CA.crt" -s Disallowed

:: Print to screen.
@echo.
@echo RevokeChinaCerts Organization version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
