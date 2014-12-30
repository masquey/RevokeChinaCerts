:: RevokeChinaCerts CodeSigning Choice batch
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
set Folder=%Folder%\ArchiveCerts\CodeSigning
set /p UserChoice="Revoke WoSign Code Signing Authority(UTN-USERFirst-Object)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-1
%CertMgr% -add -c "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed

:CERT-1
@echo.
set /p UserChoice="Revoke WoTrust Code Signing Authority(UTN-USERFirst-Object)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-2
%CertMgr% -add -c "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed

:CERT-2
@echo.
set /p UserChoice="Revoke 91.Com? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-3
%CertMgr% -add -c "%Folder%\91Com.crt" -s Disallowed

:CERT-3
@echo.
set /p UserChoice="Revoke Baidu (China) Co., Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-4
%CertMgr% -add -c "%Folder%\Baidu_China_CoLtd.crt" -s Disallowed

:CERT-4
@echo.
set /p UserChoice="Revoke Beijing baidu Netcom science and technology co.ltd? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-5
%CertMgr% -add -c "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt" -s Disallowed

:CERT-5
@echo.
set /p UserChoice="Revoke Beijing Baofeng Technology Co., Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-6
%CertMgr% -add -c "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt" -s Disallowed

:CERT-6
@echo.
set /p UserChoice="Revoke Beijing Funshion Online Technologies Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-7
%CertMgr% -add -c "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt" -s Disallowed

:CERT-7
@echo.
set /p UserChoice="Revoke Beijing Kingsoft Security software Co.,Ltd? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-8
%CertMgr% -add -c "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd.crt" -s Disallowed

:CERT-8
@echo.
set /p UserChoice="Revoke BEIJING KUWO TECHNOLOGY CO.,LTD.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-9
%CertMgr% -add -c "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt" -s Disallowed

:CERT-9
@echo.
set /p UserChoice="Revoke BEIJING QIYI CENTURY SCIENCE&TECHNOLOGY CO.,LTD.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-10
%CertMgr% -add -c "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt" -s Disallowed

:CERT-10
@echo.
set /p UserChoice="Revoke Beijing Rising Information Technology Corporation Limited? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-11
%CertMgr% -add -c "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt" -s Disallowed

:CERT-11
@echo.
set /p UserChoice="Revoke Beijing Sohu New Media Information Technology Co., Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-12
%CertMgr% -add -c "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt" -s Disallowed

:CERT-12
@echo.
set /p UserChoice="Revoke Guangzhou Tieren Network Technology Co.,Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-13
%CertMgr% -add -c "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt" -s Disallowed

:CERT-13
@echo.
set /p UserChoice="Revoke Kingsoft Security Co.,Ltd? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-14
%CertMgr% -add -c "%Folder%\Kingsoft_Security_CoLtd.crt" -s Disallowed

:CERT-14
@echo.
set /p UserChoice="Revoke LE SHI INTERNET INFORMATION TECHNOLOGY CORP.,BEI JING? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-15
%CertMgr% -add -c "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt" -s Disallowed

:CERT-15
@echo.
set /p UserChoice="Revoke Maxthon (Asia) Limited? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-16
%CertMgr% -add -c "%Folder%\Maxthon_Asia_Limited.crt" -s Disallowed

:CERT-16
@echo.
set /p UserChoice="Revoke Meitu.Com? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-17
%CertMgr% -add -c "%Folder%\MeituCom.crt" -s Disallowed

:CERT-17
@echo.
set /p UserChoice="Revoke NetEase(Hangzhou) Network Co. Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-18
%CertMgr% -add -c "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt" -s Disallowed

:CERT-18
@echo.
set /p UserChoice="Revoke PPLive Corporation? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-19
%CertMgr% -add -c "%Folder%\PPLive_Corporation.crt" -s Disallowed

:CERT-19
@echo.
set /p UserChoice="Revoke Qihoo 360 Software Beijing Company Limited? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-20
%CertMgr% -add -c "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt" -s Disallowed

:CERT-20
@echo.
set /p UserChoice="Revoke Shanghai Quan Tudou Network Technology Co., Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-21
%CertMgr% -add -c "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt" -s Disallowed

:CERT-21
@echo.
set /p UserChoice="Revoke ShenZhen Xunlei Networking Technologies Ltd.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-22
%CertMgr% -add -c "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt" -s Disallowed

:CERT-22
@echo.
set /p UserChoice="Revoke TAOBAO (CHINA) SOFTWARE CO.,LTD.? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-23
%CertMgr% -add -c "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt" -s Disallowed

:CERT-23
@echo.
set /p UserChoice="Revoke Tencent Technology Shenzhen Company Limited? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-24
%CertMgr% -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited.crt" -s Disallowed

:CERT-24
@echo.
set /p UserChoice="Revoke Tencent Technology Shenzhen Company Limited(2010-01-26)? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-25
%CertMgr% -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt" -s Disallowed

:CERT-25
@echo.
set /p UserChoice="Revoke UC Mobile Limited? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-26
%CertMgr% -add -c "%Folder%\UC_Mobile_Limited.crt" -s Disallowed

:CERT-26
@echo.
set /p UserChoice="Revoke Wandou Technology Ltd? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-27
%CertMgr% -add -c "%Folder%\Wandou_Technology_Ltd.crt" -s Disallowed

:CERT-27
@echo.
set /p UserChoice="Revoke Xiamen Yitianxia Network Technology Co., Ltd? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-28
%CertMgr% -add -c "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt" -s Disallowed

:CERT-28
@echo.
set /p UserChoice="Revoke Xiami.Com? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-29
%CertMgr% -add -c "%Folder%\XiamiCom.crt" -s Disallowed

:CERT-29
@echo.
set /p UserChoice="Revoke Ylmf.Com? [Y/N]"
if /i not "%UserChoice%" == "Y" goto CERT-30
%CertMgr% -add -c "%Folder%\YlmfCom.crt" -s Disallowed

:CERT-30
@echo.
set /p UserChoice="Revoke YY Inc? [Y/N]"
if /i not "%UserChoice%" == "Y" goto Exit
%CertMgr% -add -c "%Folder%\YY_Inc.crt" -s Disallowed

:: Print to screen.
:Exit
@echo.
@echo RevokeChinaCerts CodeSigning Choice version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
