:: RevokeChinaCerts CodeSigning batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off


:: Locate folder, architecture check and choice
cd /d %~dp0
set CertMgr=%cd%\Tools\CertMgr
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (
	set CertMgr=%cd%\Tools\CertMgr_x86
)
set Folder=%cd%\Certs\CodeSigning
set /a SetForce = 0
set SetForceAppender=%cd%\Tools\SoftCertPolicyAppender\Binary\SoftCertPolicyAppender
echo RevokeChinaCerts CodeSigning batch
echo.
echo Do you want to set force cetificates policy? [Y/N]
echo Setting force require:
echo   Administrative Privileges
echo   Microsoft .NET Framework 4.0+
set /p UserChoice="Choose: "
if /i %UserChoice% EQU Y (set /a SetForce=1)
echo.
echo 1: Revoke CodeSigning cetificates
echo 2: Revoke CodeSigning cetificates(Choice version)
echo 3: Restore all CodeSigning revoking
echo.
set /p UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:: All version
:CASE_1
if %SetForce% EQU 0 (
::  WoSign Code Signing Authority(UTN-USERFirst-Object)
"%CertMgr%" -add -c "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed
::  WoTrust Code Signing Authority(UTN-USERFirst-Object)
"%CertMgr%" -add -c "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed
:: Certification Authority of WoSign(UTN-USERFirst-Object)
"%CertMgr%" -add -c "%Folder%\Certification_Authority_Of_WoSign_UTN_USERFirst_Object.crt" -s Disallowed
::  91.Com
"%CertMgr%" -add -c "%Folder%\91Com.crt" -s Disallowed
::  Baidu (China) Co., Ltd.(2012-02-22)
"%CertMgr%" -add -c "%Folder%\Baidu_China_CoLtd_201202.crt" -s Disallowed
::  Baidu (China) Co., Ltd.(2015-02-12) [ProgramCaiCai]
"%CertMgr%" -add -c "%Folder%\Baidu_China_CoLtd_201502.crt" -s Disallowed
::  Beijing baidu Netcom science and technology co.ltd
"%CertMgr%" -add -c "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt" -s Disallowed
::  Beijing Baofeng Technology Co., Ltd.
"%CertMgr%" -add -c "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt" -s Disallowed
::  Beijing Funshion Online Technologies Ltd.
"%CertMgr%" -add -c "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt" -s Disallowed
::  Beijing Kingsoft Security software Co.,Ltd(2011-12-26)
"%CertMgr%" -add -c "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201112.crt" -s Disallowed
::  Beijing Kingsoft Security software Co.,Ltd(2014-12-29)
"%CertMgr%" -add -c "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201412.crt" -s Disallowed
::  BEIJING KUWO TECHNOLOGY CO.,LTD.
"%CertMgr%" -add -c "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt" -s Disallowed
::  BEIJING QIYI CENTURY SCIENCE&TECHNOLOGY CO.,LTD.
"%CertMgr%" -add -c "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt" -s Disallowed
::  Beijing Rising Information Technology Corporation Limited
"%CertMgr%" -add -c "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt" -s Disallowed
::  Beijing Sohu New Media Information Technology Co., Ltd.
"%CertMgr%" -add -c "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt" -s Disallowed
::  Guangzhou Tieren Network Technology Co.,Ltd.
"%CertMgr%" -add -c "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt" -s Disallowed
::  Kingsoft Security Co.,Ltd
"%CertMgr%" -add -c "%Folder%\Kingsoft_Security_CoLtd.crt" -s Disallowed
::  LE SHI INTERNET INFORMATION TECHNOLOGY CORP.,BEI JING
"%CertMgr%" -add -c "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt" -s Disallowed
::  Maxthon (Asia) Limited
"%CertMgr%" -add -c "%Folder%\Maxthon_Asia_Limited.crt" -s Disallowed
::  Meitu.Com(2012-12-18)
"%CertMgr%" -add -c "%Folder%\MeituCom_201212.crt" -s Disallowed
::  Meitu.Com(2014-11-20)
"%CertMgr%" -add -c "%Folder%\MeituCom_201411.crt" -s Disallowed
::  NetEase(Hangzhou) Network Co. Ltd.
"%CertMgr%" -add -c "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt" -s Disallowed
::  PPLive Corporation
"%CertMgr%" -add -c "%Folder%\PPLive_Corporation.crt" -s Disallowed
::  Qihoo 360 Software Beijing Company Limited
"%CertMgr%" -add -c "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt" -s Disallowed
::  Shanghai Quan Tudou Network Technology Co., Ltd.
"%CertMgr%" -add -c "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt" -s Disallowed
::  ShenZhen Xunlei Networking Technologies Ltd.
"%CertMgr%" -add -c "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt" -s Disallowed
::  TAOBAO (CHINA) SOFTWARE CO.,LTD.
"%CertMgr%" -add -c "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt" -s Disallowed
::  Tencent Technology Shenzhen Company Limited(2010-01-26)
"%CertMgr%" -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt" -s Disallowed
::  Tencent Technology Shenzhen Company Limited(2013-01-17)
"%CertMgr%" -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201301.crt" -s Disallowed
::  UC Mobile Limited
"%CertMgr%" -add -c "%Folder%\UC_Mobile_Limited.crt" -s Disallowed
::  Wandou Technology Ltd
"%CertMgr%" -add -c "%Folder%\Wandou_Technology_Ltd.crt" -s Disallowed
::  Xiamen Yitianxia Network Technology Co., Ltd
"%CertMgr%" -add -c "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt" -s Disallowed
::  Xiami.Com
"%CertMgr%" -add -c "%Folder%\XiamiCom.crt" -s Disallowed
::  Ylmf.Com
"%CertMgr%" -add -c "%Folder%\YlmfCom.crt" -s Disallowed
::  YY Inc
"%CertMgr%" -add -c "%Folder%\YY_Inc.crt" -s Disallowed
) else (
:: Set force
"%SetForceAppender%" --set-force "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt" "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt" "%Folder%\Certification_Authority_Of_WoSign_UTN_USERFirst_Object.crt" "%Folder%\91Com.crt" "%Folder%\Baidu_China_CoLtd_201202.crt" "%Folder%\Baidu_China_CoLtd_201502.crt" "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt" "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt" "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt" "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201112.crt" "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201412.crt" "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt" "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt" "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt" "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt" "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt" "%Folder%\Kingsoft_Security_CoLtd.crt" "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt" "%Folder%\Maxthon_Asia_Limited.crt" "%Folder%\MeituCom_201212.crt" "%Folder%\MeituCom_201411.crt" "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt" "%Folder%\PPLive_Corporation.crt" "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt" "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt" "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt" "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt" "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt" "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201301.crt" "%Folder%\UC_Mobile_Limited.crt" "%Folder%\Wandou_Technology_Ltd.crt" "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt" "%Folder%\XiamiCom.crt" "%Folder%\YlmfCom.crt" "%Folder%\YY_Inc.crt")
goto EXIT


:: Choice version
:CASE_2
set /p UserChoice="Revoke WoSign Code Signing Authority(UTN-USERFirst-Object)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt"))
echo.
set /p UserChoice="Revoke WoTrust Code Signing Authority(UTN-USERFirst-Object)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt"))
echo.
set /p UserChoice="Revoke Certification Authority of WoSign(UTN-USERFirst-Object)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Certification_Authority_Of_WoSign_UTN_USERFirst_Object.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Certification_Authority_Of_WoSign_UTN_USERFirst_Object.crt"))
echo.
set /p UserChoice="Revoke 91.Com? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\91Com.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\91Com.crt"))
echo.
set /p UserChoice="Revoke Baidu (China) Co., Ltd.(2012-02-22)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Baidu_China_CoLtd_201202.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Baidu_China_CoLtd_201202.crt"))
echo.
set /p UserChoice="Revoke Baidu (China) Co., Ltd.(2015-02-12)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Baidu_China_CoLtd_201502.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Baidu_China_CoLtd_201502.crt"))
echo.
set /p UserChoice="Revoke Beijing baidu Netcom science and technology co.ltd? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt"))
echo.
set /p UserChoice="Revoke Beijing Baofeng Technology Co., Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt"))
echo.
set /p UserChoice="Revoke Beijing Funshion Online Technologies Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt"))
echo.
set /p UserChoice="Revoke Beijing Kingsoft Security software Co.,Ltd(2011-12-26)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201112.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201112.crt"))
echo.
set /p UserChoice="Revoke Beijing Kingsoft Security software Co.,Ltd(2014-12-29)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201412.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201412.crt"))
echo.
set /p UserChoice="Revoke BEIJING KUWO TECHNOLOGY CO.,LTD.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt"))
echo.
set /p UserChoice="Revoke BEIJING QIYI CENTURY SCIENCE&TECHNOLOGY CO.,LTD.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt"))
echo.
set /p UserChoice="Revoke Beijing Rising Information Technology Corporation Limited? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt"))
echo.
set /p UserChoice="Revoke Beijing Sohu New Media Information Technology Co., Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt"))
echo.
set /p UserChoice="Revoke Guangzhou Tieren Network Technology Co.,Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt"))
echo.
set /p UserChoice="Revoke Kingsoft Security Co.,Ltd? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Kingsoft_Security_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Kingsoft_Security_CoLtd.crt"))
echo.
set /p UserChoice="Revoke LE SHI INTERNET INFORMATION TECHNOLOGY CORP.,BEI JING? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt"))
echo.
set /p UserChoice="Revoke Maxthon (Asia) Limited? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Maxthon_Asia_Limited.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Maxthon_Asia_Limited.crt"))
echo.
set /p UserChoice="Revoke Meitu.Com(2012-12-18)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\MeituCom_201212.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\MeituCom_201212.crt"))
echo.
set /p UserChoice="Revoke Meitu.Com(2014-11-20)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\MeituCom_201411.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\MeituCom_201411.crt"))
echo.
set /p UserChoice="Revoke NetEase(Hangzhou) Network Co. Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt"))
echo.
set /p UserChoice="Revoke PPLive Corporation? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\PPLive_Corporation.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\PPLive_Corporation.crt"))
echo.
set /p UserChoice="Revoke Qihoo 360 Software Beijing Company Limited? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt"))
echo.
set /p UserChoice="Revoke Shanghai Quan Tudou Network Technology Co., Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt"))
echo.
set /p UserChoice="Revoke ShenZhen Xunlei Networking Technologies Ltd.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt"))
echo.
set /p UserChoice="Revoke TAOBAO (CHINA) SOFTWARE CO.,LTD.? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt"))
echo.
set /p UserChoice="Revoke Tencent Technology Shenzhen Company Limited(2010-01-26)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt"))
echo.
set /p UserChoice="Revoke Tencent Technology Shenzhen Company Limited(2013-01-17)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201301.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201301.crt"))
echo.
set /p UserChoice="Revoke UC Mobile Limited? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\UC_Mobile_Limited.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\UC_Mobile_Limited.crt"))
echo.
set /p UserChoice="Revoke Wandou Technology Ltd? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Wandou_Technology_Ltd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Wandou_Technology_Ltd.crt"))
echo.
set /p UserChoice="Revoke Xiamen Yitianxia Network Technology Co., Ltd? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt"))
echo.
set /p UserChoice="Revoke Xiami.Com? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\XiamiCom.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\XiamiCom.crt"))
echo.
set /p UserChoice="Revoke Ylmf.Com? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\YlmfCom.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\YlmfCom.crt"))
echo.
set /p UserChoice="Revoke YY Inc? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 ("%CertMgr%" -add -c "%Folder%\YY_Inc.crt" -s Disallowed) else ("%SetForceAppender%" --set-force "%Folder%\YY_Inc.crt"))
goto EXIT


:: Restore certificates
:CASE_3
::  WoSign Code Signing Authority(UTN-USERFirst-Object)
"%CertMgr%" -del -c -sha1 EA36152981E296F9763E1DC74B3262D3928563F8 -s Disallowed
::  WoTrust Code Signing Authority(UTN-USERFirst-Object)
"%CertMgr%" -del -c -sha1 B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6 -s Disallowed
:: Certification Authority of WoSign(UTN-USERFirst-Object)
"%CertMgr%" -del -c -sha1 1C1ECDCCf764E6168177C5711F33EC9229A29F88 -s Disallowed
::  91.Com
"%CertMgr%" -del -c -sha1 E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405 -s Disallowed
::  Baidu (China) Co., Ltd.(2012-02-22)
"%CertMgr%" -del -c -sha1 A34B70840C2B6F718877DDB1C2DE2C27F2C91C43 -s Disallowed
::  Baidu (China) Co., Ltd.(2015-02-12) [ProgramCaiCai]
"%CertMgr%" -del -c -sha1 0E6193159596F8150ED9ED2A402E67C28FAAC1BE -s Disallowed
::  Beijing baidu Netcom science and technology co.ltd
"%CertMgr%" -del -c -sha1 D60C12D1FDB9E45551A00C8815CCD486C043945B -s Disallowed
::  Beijing Baofeng Technology Co., Ltd.
"%CertMgr%" -del -c -sha1 CB6F65314E5B25D61304AB2C9C8870B574CC21F5 -s Disallowed
::  Beijing Funshion Online Technologies Ltd.
"%CertMgr%" -del -c -sha1 9AB5445104C6CCE5A22431CF29C4331CBC328A1B -s Disallowed
::  Beijing Kingsoft Security software Co.,Ltd(2011-01-26)
"%CertMgr%" -del -c -sha1 E88DD1ACD2DB3A352072AA49C675F4944A3FEF82 -s Disallowed
::  Beijing Kingsoft Security software Co.,Ltd(2014-12-29)
"%CertMgr%" -del -c -sha1 CC9467907AD45574588F4E16F29CA36D5F78C0F8 -s Disallowed
::  BEIJING KUWO TECHNOLOGY CO.,LTD.
"%CertMgr%" -del -c -sha1 5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F -s Disallowed
::  BEIJING QIYI CENTURY SCIENCE&TECHNOLOGY CO.,LTD.
"%CertMgr%" -del -c -sha1 5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE -s Disallowed
::  Beijing Rising Information Technology Corporation Limited
"%CertMgr%" -del -c -sha1 D9421BEDD9F5B8A91DD3F8691E7A42D83C983325 -s Disallowed
::  Beijing Sohu New Media Information Technology Co., Ltd.
"%CertMgr%" -del -c -sha1 D1BB252CAC3D250C55978F7EAAF121DA91A17B42 -s Disallowed
::  Guangzhou Tieren Network Technology Co.,Ltd.
"%CertMgr%" -del -c -sha1 2529C0C0D833806AFBFA3C31987C19A18722A2FE -s Disallowed
::  Kingsoft Security Co.,Ltd
"%CertMgr%" -del -c -sha1 2BDEC50B4446652C126709A08248E572B859CCCC -s Disallowed
::  LE SHI INTERNET INFORMATION TECHNOLOGY CORP.,BEI JING
"%CertMgr%" -del -c -sha1 62DF2BC4B5902B52C215C697D06038E3B28CF5D3 -s Disallowed
::  Maxthon (Asia) Limited
"%CertMgr%" -del -c -sha1 1481414E8E87412A00D3341167FE3A92C681B830 -s Disallowed
::  Meitu.Com(2012-12-18)
"%CertMgr%" -del -c -sha1 7B6FAE77BD19FEC5410293344B36124774A6D8F1 -s Disallowed
::  Meitu.Com(2014-11-20)
"%CertMgr%" -del -c -sha1 EBA2ADB1C0B7A61E5BA25B8356387F27049BA1A1 -s Disallowed
::  NetEase(Hangzhou) Network Co. Ltd.
"%CertMgr%" -del -c -sha1 E0387F3AF5752A4620EC617C39153C0E666CF5F8 -s Disallowed
::  PPLive Corporation
"%CertMgr%" -del -c -sha1 5477E38783CD37B1E5729B15D7C0873A2D72DB9D -s Disallowed
::  Qihoo 360 Software Beijing Company Limited
"%CertMgr%" -del -c -sha1 1E5BB77FCB63F26277F95AAE09B852699327A08A -s Disallowed
::  Shanghai Quan Tudou Network Technology Co., Ltd.
"%CertMgr%" -del -c -sha1 935140881F50BDF775D3CEF034C0D21C18FD2567 -s Disallowed
::  ShenZhen Xunlei Networking Technologies Ltd.
"%CertMgr%" -del -c -sha1 4099665730474153EADF671B8B475C03C08A46D0 -s Disallowed
::  TAOBAO (CHINA) SOFTWARE CO.,LTD.
"%CertMgr%" -del -c -sha1 E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881 -s Disallowed
::  Tencent Technology Shenzhen Company Limited(2010-01-26)
"%CertMgr%" -del -c -sha1 8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791 -s Disallowed
::  Tencent Technology Shenzhen Company Limited(2013-01-17)
"%CertMgr%" -del -c -sha1 2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9 -s Disallowed
::  UC Mobile Limited
"%CertMgr%" -del -c -sha1 1540C77B5D19FC5A71A04DB001488E55B45DDC7F -s Disallowed
::  Wandou Technology Ltd
"%CertMgr%" -del -c -sha1 AB09D1AFE555CFC580575F5BC78B16B9F1C4E432 -s Disallowed
::  Xiamen Yitianxia Network Technology Co., Ltd
"%CertMgr%" -del -c -sha1 F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC -s Disallowed
::  Xiami.Com
"%CertMgr%" -del -c -sha1 EEC507F719D5BA0CB913F034E045A24A509D8A5F -s Disallowed
::  Ylmf.Com
"%CertMgr%" -del -c -sha1 93A77CA50F165A5873DD3995874867B616AB3644 -s Disallowed
::  YY Inc
"%CertMgr%" -del -c -sha1 B3B89CD7940DC67E4291A3EE767AC17A3BC9E620 -s Disallowed
:: Unset force
echo.
if %SetForce% EQU 1 ("%SetForceAppender%" -r --unset-force "%Folder%\WoSign_Code_Signing_Authority_UTN_USERFirst_Object.crt" "%Folder%\WoTrust_Code_Signing_Authority_UTN_USERFirst_Object.crt" "%Folder%\Certification_Authority_Of_WoSign_UTN_USERFirst_Object.crt" "%Folder%\91Com.crt" "%Folder%\Baidu_China_CoLtd_201202.crt" "%Folder%\Baidu_China_CoLtd_201502.crt" "%Folder%\Beijing_Baidu_Netcom_Science_And_Technology_CoLtd.crt" "%Folder%\Beijing_Baofeng_Technology_CoLtd.crt" "%Folder%\Beijing_Funshion_Online_Technologies_Ltd.crt" "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201112.crt" "%Folder%\Beijing_Kingsoft_Security_Software_CoLtd_201412.crt" "%Folder%\BEIJING_KUWO_TECHNOLOGY_COLTD.crt" "%Folder%\BEIJING_QIYI_CENTURY_SCIENCE_TECHNOLOGY_COLTD.crt" "%Folder%\Beijing_Rising_Information_Technology_Corporation_Limited.crt" "%Folder%\Beijing_Sohu_New_Media_Information_Technology_CoLtd.crt" "%Folder%\Guangzhou_Tieren_Network_Technology_CoLtd.crt" "%Folder%\Kingsoft_Security_CoLtd.crt" "%Folder%\LE_SHI_INTERNET_INFORMATION_TECHNOLOGY_CORP_BEIJING.crt" "%Folder%\Maxthon_Asia_Limited.crt" "%Folder%\MeituCom_201212.crt" "%Folder%\MeituCom_201411.crt" "%Folder%\NetEase_Hangzhou_Network_CoLtd.crt" "%Folder%\PPLive_Corporation.crt" "%Folder%\Qihoo_360_Software_Beijing_Company_Limited.crt" "%Folder%\Shanghai_Quan_Tudou_Network_Technology_CoLtd.crt" "%Folder%\ShenZhen_Xunlei_Networking_Technologies_Ltd.crt" "%Folder%\TAOBAO_CHINA_SOFTWARE_COLTD.crt" "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201001.crt" "%Folder%\Tencent_Technology_Shenzhen_Company_Limited_201301.crt" "%Folder%\UC_Mobile_Limited.crt" "%Folder%\Wandou_Technology_Ltd.crt" "%Folder%\Xiamen_Yitianxia_Network_Technology_CoLtd.crt" "%Folder%\XiamiCom.crt" "%Folder%\YlmfCom.crt" "%Folder%\YY_Inc.crt")


:: Print to screen.
:EXIT
echo.
echo RevokeChinaCerts CodeSigning batch
echo Done, please confirm the messages on screen.
echo.
@pause
