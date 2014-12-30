:: RevokeChinaCerts Organization Choice batch
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
set /p UserChoice="Revoke ABC? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-1
%CertMgr% -add -c "%Folder%\ABC.crt" -s Disallowed

:CERT-1
@echo.
set /p UserChoice="Revoke ABC TEST CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-2
%CertMgr% -add -c "%Folder%\ABC_TEST_CA.crt" -s Disallowed

:CERT-2
@echo.
set /p UserChoice="Revoke ABC2048? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-3
%CertMgr% -add -c "%Folder%\ABC2048.crt" -s Disallowed

:CERT-3
@echo.
set /p UserChoice="Revoke Alibaba.com Corporation Root CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-4
%CertMgr% -add -c "%Folder%\AlibabaCom_Corporation_Root_CA.crt" -s Disallowed

:CERT-4
@echo.
set /p UserChoice="Revoke ALIPAY_ROOT? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-5
%CertMgr% -add -c "%Folder%\ALIPAY_ROOT.crt" -s Disallowed

:CERT-5
@echo.
set /p UserChoice="Revoke Alipay Trust NetWork? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-6
%CertMgr% -add -c "%Folder%\Alipay_Trust_NetWork.crt" -s Disallowed

:CERT-6
@echo.
set /p UserChoice="Revoke BOCOMCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-7
%CertMgr% -add -c "%Folder%\BOCOMCA.crt" -s Disallowed

:CERT-7
@echo.
set /p UserChoice="Revoke CCB CA ROOT(1999-06-29)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-8
%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_199906.crt" -s Disallowed

:CERT-8
@echo.
set /p UserChoice="Revoke CCB CA ROOT(2009-06-01)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-9
%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_200906.crt" -s Disallowed

:CERT-9
@echo.
set /p UserChoice="Revoke CFCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-10
%CertMgr% -add -c "%Folder%\CFCA.crt" -s Disallowed

:CERT-10
@echo.
set /p UserChoice="Revoke CFCA CS CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-11
%CertMgr% -add -c "%Folder%\CFCA_CS_CA.crt" -s Disallowed

:CERT-11
@echo.
set /p UserChoice="Revoke CFCA CS TEST CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-12
%CertMgr% -add -c "%Folder%\CFCA_CS_TEST_CA.crt" -s Disallowed

:CERT-12
@echo.
set /p UserChoice="Revoke CFCA Operation CA3? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-13
%CertMgr% -add -c "%Folder%\CFCA_Operation_CA3.crt" -s Disallowed

:CERT-13
@echo.
set /p UserChoice="Revoke CFCA RCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-14
%CertMgr% -add -c "%Folder%\CFCA_RCA.crt" -s Disallowed

:CERT-14
@echo.
set /p UserChoice="Revoke CFCA Root CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-15
%CertMgr% -add -c "%Folder%\CFCA_Root_CA.crt" -s Disallowed

:CERT-15
@echo.
set /p UserChoice="Revoke CFCA RSA RCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-16
%CertMgr% -add -c "%Folder%\CFCA_RSA_RCA.crt" -s Disallowed

:CERT-16
@echo.
set /p UserChoice="Revoke China Trust Network(1)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-17
%CertMgr% -add -c "%Folder%\China_Trust_Network_1.crt" -s Disallowed

:CERT-17
@echo.
set /p UserChoice="Revoke China Trust Network(2)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-18
%CertMgr% -add -c "%Folder%\China_Trust_Network_2.crt" -s Disallowed

:CERT-18
@echo.
set /p UserChoice="Revoke China Trust Network(3)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-19
%CertMgr% -add -c "%Folder%\China_Trust_Network_3.crt" -s Disallowed

:CERT-19
@echo.
set /p UserChoice="Revoke ICBC? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-20
%CertMgr% -add -c "%Folder%\ICBC.crt" -s Disallowed

:CERT-20
@echo.
set /p UserChoice="Revoke ICBC Root CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-21
%CertMgr% -add -c "%Folder%\ICBC_Root_CA.crt" -s Disallowed

:CERT-21
@echo.
set /p UserChoice="Revoke IcbcCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-22
%CertMgr% -add -c "%Folder%\IcbcCA.crt" -s Disallowed

:CERT-22
@echo.
set /p UserChoice="Revoke iTruschina CN Root CA(1)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-23
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_1.crt" -s Disallowed

:CERT-23
@echo.
set /p UserChoice="Revoke iTruschina CN Root CA(2)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-24
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_2.crt" -s Disallowed

:CERT-24
@echo.
set /p UserChoice="Revoke iTruschina CN Root CA(3)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-25
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_3.crt" -s Disallowed

:CERT-25
@echo.
set /p UserChoice="Revoke Personal ICBC CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-26
%CertMgr% -add -c "%Folder%\Personal_ICBC_CA.crt" -s Disallowed

:CERT-26
@echo.
set /p UserChoice="Revoke ROOTCA OSCCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-27
%CertMgr% -add -c "%Folder%\ROOTCA_OSCCA.crt" -s Disallowed

:CERT-27
@echo.
set /p UserChoice="Revoke SZCA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-28
%CertMgr% -add -c "%Folder%\SZCA.crt" -s Disallowed

:CERT-28
@echo.
set /p UserChoice="Revoke SZCA(20030722)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-29
%CertMgr% -add -c "%Folder%\SZCA_200307.crt" -s Disallowed

:CERT-29
@echo.
set /p UserChoice="Revoke TenpayCom Root CA? [Y/N]"
if /i not "%UserChoice%" == "Y" goto Exit
%CertMgr% -add -c "%Folder%\TenpayCom_Root_CA.crt" -s Disallowed

:: Print to screen.
:Exit
@echo.
@echo RevokeChinaCerts Organization Choice version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
