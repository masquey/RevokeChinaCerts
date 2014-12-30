:: RevokeChinaCerts CodeSigning batch
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
%CertMgr% -add -c "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\91Com.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Baidu_China_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Kingsoft_Security_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Maxthon_Asia_Limited.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\MeituCom.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\PPLive_Corporation.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\UC_Mobile_Limited.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Wandou_Technology_Ltd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\XiamiCom.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\YlmfCom.crt" -s Disallowed
%CertMgr% -add -c "%Folder%\YY_Inc.crt" -s Disallowed

:: Print to screen.
@echo.
@echo RevokeChinaCerts CodeSigning version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
