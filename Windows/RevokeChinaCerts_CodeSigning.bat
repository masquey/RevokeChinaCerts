:: RevokeChinaCerts CodeSigning batch
:: Revoke China Certificates.
:: 
:: Author: Hugo Chan, ntkme, Chengr28
:: 

@echo off


:: Locate folder and architecture check
cd /d "%~dp0"
set CertMgr="%~dp0Tools\CertMgr.exe"
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 (set CertMgr="%~dp0Tools\CertMgr_x86.exe")
set Certificates="%~dp0Certificates\CodeSigning
set /a SetForce = 0
set SetForceAppender="%~dp0Tools\SoftCertPolicyAppender\Binary\SoftCertPolicyAppender.exe"


:: Choice
echo RevokeChinaCerts CodeSigning batch
echo.
echo Do you want to set force certificates policy? [Y/N]
echo Setting force require:
echo   Administrative Privileges
echo   Microsoft .NET Framework 4.0+
set /p UserChoice="Choose: "
if /i %UserChoice% EQU Y (set /a SetForce=1)
echo.
echo 1: Revoke CodeSigning certificates
echo 2: Revoke CodeSigning certificates(Choice version)
echo 3: Restore all CodeSigning revoking
echo.
set /p UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:: Call functions
:REVOKE
%CertMgr% -add -c %Certificates%\%1.crt" -s Disallowed
goto :EOF

:REVOKE_CHOICE
if /i %1 EQU Y (
	if %SetForce% EQU 0 (
		%CertMgr% -add -c %Certificates%\%2.crt" -s Disallowed
	) else (
		%SetForceAppender% --set-force %Certificates%\%2.crt"
	)
)
goto :EOF

:RESTORE
%CertMgr% -del -c -sha1 %1 -s Disallowed
goto :EOF


:: All version
:CASE_1
if %SetForce% EQU 0 (
	for /F "usebackq tokens=*" %%i in (%Certificates%\CodeSigning.txt") do call :REVOKE %%i
) else (
	%SetForceAppender% --set-force %Certificates%\E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405.crt" %Certificates%\A34B70840C2B6F718877DDB1C2DE2C27F2C91C43.crt" %Certificates%\0E6193159596F8150ED9ED2A402E67C28FAAC1BE.crt" %Certificates%\D60C12D1FDB9E45551A00C8815CCD486C043945B.crt" %Certificates%\03FCF1B9FCAB6F7243F3E3E011C6FD28F64F9920.crt" %Certificates%\CB6F65314E5B25D61304AB2C9C8870B574CC21F5.crt" %Certificates%\CC79F55AB07E7A1D5CEC981CEEB864DDA5DC74E3.crt" %Certificates%\9AB5445104C6CCE5A22431CF29C4331CBC328A1B.crt" %Certificates%\E88DD1ACD2DB3A352072AA49C675F4944A3FEF82.crt" %Certificates%\CC9467907AD45574588F4E16F29CA36D5F78C0F8.crt" %Certificates%\5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F.crt" %Certificates%\5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE.crt" %Certificates%\D9421BEDD9F5B8A91DD3F8691E7A42D83C983325.crt" %Certificates%\D1BB252CAC3D250C55978F7EAAF121DA91A17B42.crt" %Certificates%\1C1ECDCCF764E6168177C5711F33EC9229A29F88.crt" %Certificates%\2529C0C0D833806AFBFA3C31987C19A18722A2FE.crt" %Certificates%\2BDEC50B4446652C126709A08248E572B859CCCC.crt" %Certificates%\62DF2BC4B5902B52C215C697D06038E3B28CF5D3.crt" %Certificates%\1481414E8E87412A00D3341167FE3A92C681B830.crt" %Certificates%\7B6FAE77BD19FEC5410293344B36124774A6D8F1.crt" %Certificates%\EBA2ADB1C0B7A61E5BA25B8356387F27049BA1A1.crt" %Certificates%\E0387F3AF5752A4620EC617C39153C0E666CF5F8.crt" %Certificates%\5477E38783CD37B1E5729B15D7C0873A2D72DB9D.crt" %Certificates%\1E5BB77FCB63F26277F95AAE09B852699327A08A.crt" %Certificates%\935140881F50BDF775D3CEF034C0D21C18FD2567.crt" %Certificates%\4099665730474153EADF671B8B475C03C08A46D0.crt" %Certificates%\E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881.crt" %Certificates%\8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791.crt" %Certificates%\2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9.crt" %Certificates%\1540C77B5D19FC5A71A04DB001488E55B45DDC7F.crt" %Certificates%\AB09D1AFE555CFC580575F5BC78B16B9F1C4E432.crt" %Certificates%\EA36152981E296F9763E1DC74B3262D3928563F8.crt" %Certificates%\B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6.crt" %Certificates%\F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC.crt" %Certificates%\EEC507F719D5BA0CB913F034E045A24A509D8A5F.crt" %Certificates%\93A77CA50F165A5873DD3995874867B616AB3644.crt" %Certificates%\B3B89CD7940DC67E4291A3EE767AC17A3BC9E620.crt"
)
goto EXIT


:: Choice version
:CASE_2
set /p UserChoice="Revoke WoSign Code Signing Authority(UTN-USERFirst-Object)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% EA36152981E296F9763E1DC74B3262D3928563F8
echo.
set /p UserChoice="Revoke WoTrust Code Signing Authority(UTN-USERFirst-Object)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6
echo.
set /p UserChoice="Revoke Certification Authority of WoSign(UTN-USERFirst-Object)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 1C1ECDCCF764E6168177C5711F33EC9229A29F88
echo.
set /p UserChoice="Revoke 91.Com? [Y/N]"
call :REVOKE_CHOICE %UserChoice% E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405
echo.
set /p UserChoice="Revoke Baidu (China) Co., Ltd.(2012-02-22)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% A34B70840C2B6F718877DDB1C2DE2C27F2C91C43
echo.
set /p UserChoice="Revoke Baidu (China) Co., Ltd.(2015-02-12)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 0E6193159596F8150ED9ED2A402E67C28FAAC1BE
echo.
set /p UserChoice="Revoke Beijing baidu Netcom science and technology co.ltd(2012-02-27)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% D60C12D1FDB9E45551A00C8815CCD486C043945B
echo.
set /p UserChoice="Revoke Beijing baidu Netcom science and technology co.ltd(2015-02-05)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 03FCF1B9FCAB6F7243F3E3E011C6FD28F64F9920
echo.
set /p UserChoice="Revoke Beijing Baofeng Technology Co., Ltd.(2012-02-22)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% CB6F65314E5B25D61304AB2C9C8870B574CC21F5
echo.
set /p UserChoice="Revoke Beijing Baofeng Technology Co., Ltd.(2015-02-05)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% CC79F55AB07E7A1D5CEC981CEEB864DDA5DC74E3
echo.
set /p UserChoice="Revoke Beijing Funshion Online Technologies Ltd.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 9AB5445104C6CCE5A22431CF29C4331CBC328A1B
echo.
set /p UserChoice="Revoke Beijing Kingsoft Security software Co.,Ltd(2011-12-26)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% E88DD1ACD2DB3A352072AA49C675F4944A3FEF82
echo.
set /p UserChoice="Revoke Beijing Kingsoft Security software Co.,Ltd(2014-12-29)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% CC9467907AD45574588F4E16F29CA36D5F78C0F8
echo.
set /p UserChoice="Revoke BEIJING KUWO TECHNOLOGY CO.,LTD.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F
echo.
set /p UserChoice="Revoke BEIJING QIYI CENTURY SCIENCE&TECHNOLOGY CO.,LTD.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE
echo.
set /p UserChoice="Revoke Beijing Rising Information Technology Corporation Limited? [Y/N]"
call :REVOKE_CHOICE %UserChoice% D9421BEDD9F5B8A91DD3F8691E7A42D83C983325
echo.
set /p UserChoice="Revoke Beijing Sohu New Media Information Technology Co., Ltd.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% D1BB252CAC3D250C55978F7EAAF121DA91A17B42
echo.
set /p UserChoice="Revoke Guangzhou Tieren Network Technology Co.,Ltd.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 2529C0C0D833806AFBFA3C31987C19A18722A2FE
echo.
set /p UserChoice="Revoke Kingsoft Security Co.,Ltd? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 2BDEC50B4446652C126709A08248E572B859CCCC
echo.
set /p UserChoice="Revoke LE SHI INTERNET INFORMATION TECHNOLOGY CORP.,BEI JING? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 62DF2BC4B5902B52C215C697D06038E3B28CF5D3
echo.
set /p UserChoice="Revoke Maxthon (Asia) Limited? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 1481414E8E87412A00D3341167FE3A92C681B830
echo.
set /p UserChoice="Revoke Meitu.Com(2012-12-18)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 7B6FAE77BD19FEC5410293344B36124774A6D8F1
echo.
set /p UserChoice="Revoke Meitu.Com(2014-11-20)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% EBA2ADB1C0B7A61E5BA25B8356387F27049BA1A1
echo.
set /p UserChoice="Revoke NetEase(Hangzhou) Network Co. Ltd.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% E0387F3AF5752A4620EC617C39153C0E666CF5F8
echo.
set /p UserChoice="Revoke PPLive Corporation? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 5477E38783CD37B1E5729B15D7C0873A2D72DB9D
echo.
set /p UserChoice="Revoke Qihoo 360 Software Beijing Company Limited? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 1E5BB77FCB63F26277F95AAE09B852699327A08A
echo.
set /p UserChoice="Revoke Shanghai Quan Tudou Network Technology Co., Ltd.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 935140881F50BDF775D3CEF034C0D21C18FD2567
echo.
set /p UserChoice="Revoke ShenZhen Xunlei Networking Technologies Ltd.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 4099665730474153EADF671B8B475C03C08A46D0
echo.
set /p UserChoice="Revoke TAOBAO (CHINA) SOFTWARE CO.,LTD.? [Y/N]"
call :REVOKE_CHOICE %UserChoice% E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881
echo.
set /p UserChoice="Revoke Tencent Technology Shenzhen Company Limited(2010-01-26)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791
echo.
set /p UserChoice="Revoke Tencent Technology Shenzhen Company Limited(2013-01-17)? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9
echo.
set /p UserChoice="Revoke UC Mobile Limited? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 1540C77B5D19FC5A71A04DB001488E55B45DDC7F
echo.
set /p UserChoice="Revoke Wandou Technology Ltd? [Y/N]"
call :REVOKE_CHOICE %UserChoice% AB09D1AFE555CFC580575F5BC78B16B9F1C4E432
echo.
set /p UserChoice="Revoke Xiamen Yitianxia Network Technology Co., Ltd? [Y/N]"
call :REVOKE_CHOICE %UserChoice% F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC
echo.
set /p UserChoice="Revoke Xiami.Com? [Y/N]"
call :REVOKE_CHOICE %UserChoice% EEC507F719D5BA0CB913F034E045A24A509D8A5F
echo.
set /p UserChoice="Revoke Ylmf.Com? [Y/N]"
call :REVOKE_CHOICE %UserChoice% 93A77CA50F165A5873DD3995874867B616AB3644
echo.
set /p UserChoice="Revoke YY Inc? [Y/N]"
call :REVOKE_CHOICE %UserChoice% B3B89CD7940DC67E4291A3EE767AC17A3BC9E620
goto EXIT


:: Restore version
:CASE_3
if %SetForce% EQU 1 (
	%SetForceAppender% -r --unset-force %Certificates%\E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405.crt" %Certificates%\A34B70840C2B6F718877DDB1C2DE2C27F2C91C43.crt" %Certificates%\0E6193159596F8150ED9ED2A402E67C28FAAC1BE.crt" %Certificates%\D60C12D1FDB9E45551A00C8815CCD486C043945B.crt" %Certificates%\03FCF1B9FCAB6F7243F3E3E011C6FD28F64F9920.crt" %Certificates%\CB6F65314E5B25D61304AB2C9C8870B574CC21F5.crt" %Certificates%\CC79F55AB07E7A1D5CEC981CEEB864DDA5DC74E3.crt" %Certificates%\9AB5445104C6CCE5A22431CF29C4331CBC328A1B.crt" %Certificates%\E88DD1ACD2DB3A352072AA49C675F4944A3FEF82.crt" %Certificates%\CC9467907AD45574588F4E16F29CA36D5F78C0F8.crt" %Certificates%\5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F.crt" %Certificates%\5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE.crt" %Certificates%\D9421BEDD9F5B8A91DD3F8691E7A42D83C983325.crt" %Certificates%\D1BB252CAC3D250C55978F7EAAF121DA91A17B42.crt" %Certificates%\1C1ECDCCF764E6168177C5711F33EC9229A29F88.crt" %Certificates%\2529C0C0D833806AFBFA3C31987C19A18722A2FE.crt" %Certificates%\2BDEC50B4446652C126709A08248E572B859CCCC.crt" %Certificates%\62DF2BC4B5902B52C215C697D06038E3B28CF5D3.crt" %Certificates%\1481414E8E87412A00D3341167FE3A92C681B830.crt" %Certificates%\7B6FAE77BD19FEC5410293344B36124774A6D8F1.crt" %Certificates%\EBA2ADB1C0B7A61E5BA25B8356387F27049BA1A1.crt" %Certificates%\E0387F3AF5752A4620EC617C39153C0E666CF5F8.crt" %Certificates%\5477E38783CD37B1E5729B15D7C0873A2D72DB9D.crt" %Certificates%\1E5BB77FCB63F26277F95AAE09B852699327A08A.crt" %Certificates%\935140881F50BDF775D3CEF034C0D21C18FD2567.crt" %Certificates%\4099665730474153EADF671B8B475C03C08A46D0.crt" %Certificates%\E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881.crt" %Certificates%\8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791.crt" %Certificates%\2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9.crt" %Certificates%\1540C77B5D19FC5A71A04DB001488E55B45DDC7F.crt" %Certificates%\AB09D1AFE555CFC580575F5BC78B16B9F1C4E432.crt" %Certificates%\EA36152981E296F9763E1DC74B3262D3928563F8.crt" %Certificates%\B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6.crt" %Certificates%\F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC.crt" %Certificates%\EEC507F719D5BA0CB913F034E045A24A509D8A5F.crt" %Certificates%\93A77CA50F165A5873DD3995874867B616AB3644.crt" %Certificates%\B3B89CD7940DC67E4291A3EE767AC17A3BC9E620.crt"
)
for /F "usebackq tokens=*" %%i in (%Certificates%\CodeSigning.txt") do call :RESTORE %%i


:: Exit
:EXIT
echo.
echo RevokeChinaCerts CodeSigning batch
echo Done, please confirm the messages on screen.
echo.
pause
