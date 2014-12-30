:: RevokeChinaCerts CodeSigning Restore batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off

:: Folder location
cd /d %~dp0
cd..

:: Architecture check
set CertMgr="%cd%\Tools\CertMgr"
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" set CertMgr="%cd%\Tools\CertMgr_x86"

:: Restore certificates
::  WoSign Code Signing Authority(UTN-USERFirst-Object)
%CertMgr% -del -c -sha1 EA36152981E296F9763E1DC74B3262D3928563F8 -s Disallowed
::  WoTrust Code Signing Authority(UTN-USERFirst-Object)
%CertMgr% -del -c -sha1 B28CCC46D234A7D7CF7F21CCB9406F48A5273CC6 -s Disallowed
::  91.Com
%CertMgr% -del -c -sha1 E87D1C1D3FE2BCA700EB7B8DC0E45B97EAF19405 -s Disallowed
::  Baidu (China) Co., Ltd.
%CertMgr% -del -c -sha1 A34B70840C2B6F718877DDB1C2DE2C27F2C91C43 -s Disallowed
::  Beijing baidu Netcom science and technology co.ltd
%CertMgr% -del -c -sha1 D60C12D1FDB9E45551A00C8815CCD486C043945B -s Disallowed
::  Beijing Baofeng Technology Co., Ltd.
%CertMgr% -del -c -sha1 CB6F65314E5B25D61304AB2C9C8870B574CC21F5 -s Disallowed
::  Beijing Funshion Online Technologies Ltd.
%CertMgr% -del -c -sha1 9AB5445104C6CCE5A22431CF29C4331CBC328A1B -s Disallowed
::  Beijing Kingsoft Security software Co.,Ltd
%CertMgr% -del -c -sha1 E88DD1ACD2DB3A352072AA49C675F4944A3FEF82 -s Disallowed
::  BEIJING KUWO TECHNOLOGY CO.,LTD.
%CertMgr% -del -c -sha1 5FFFD1A3EAE5ED74558913C4A8476D1514C6D61F -s Disallowed
::  BEIJING QIYI CENTURY SCIENCE&TECHNOLOGY CO.,LTD.
%CertMgr% -del -c -sha1 5DC57AF121E3101F4BFEA8A22BBDADC0869C80EE -s Disallowed
::  Beijing Rising Information Technology Corporation Limited
%CertMgr% -del -c -sha1 D9421BEDD9F5B8A91DD3F8691E7A42D83C983325 -s Disallowed
::  Beijing Sohu New Media Information Technology Co., Ltd.
%CertMgr% -del -c -sha1 D1BB252CAC3D250C55978F7EAAF121DA91A17B42 -s Disallowed
::  Guangzhou Tieren Network Technology Co.,Ltd.
%CertMgr% -del -c -sha1 2529C0C0D833806AFBFA3C31987C19A18722A2FE -s Disallowed
::  Kingsoft Security Co.,Ltd
%CertMgr% -del -c -sha1 2BDEC50B4446652C126709A08248E572B859CCCC -s Disallowed
::  LE SHI INTERNET INFORMATION TECHNOLOGY CORP.,BEI JING
%CertMgr% -del -c -sha1 62DF2BC4B5902B52C215C697D06038E3B28CF5D3 -s Disallowed
::  Maxthon (Asia) Limited
%CertMgr% -del -c -sha1 1481414E8E87412A00D3341167FE3A92C681B830 -s Disallowed
::  Meitu.Com
%CertMgr% -del -c -sha1 7B6FAE77BD19FEC5410293344B36124774A6D8F1 -s Disallowed
::  NetEase(Hangzhou) Network Co. Ltd.
%CertMgr% -del -c -sha1 E0387F3AF5752A4620EC617C39153C0E666CF5F8 -s Disallowed
::  PPLive Corporation
%CertMgr% -del -c -sha1 5477E38783CD37B1E5729B15D7C0873A2D72DB9D -s Disallowed
::  Qihoo 360 Software Beijing Company Limited
%CertMgr% -del -c -sha1 1E5BB77FCB63F26277F95AAE09B852699327A08A -s Disallowed
::  Shanghai Quan Tudou Network Technology Co., Ltd.
%CertMgr% -del -c -sha1 935140881F50BDF775D3CEF034C0D21C18FD2567 -s Disallowed
::  ShenZhen Xunlei Networking Technologies Ltd.
%CertMgr% -del -c -sha1 4099665730474153EADF671B8B475C03C08A46D0 -s Disallowed
::  TAOBAO (CHINA) SOFTWARE CO.,LTD.
%CertMgr% -del -c -sha1 E5777A69CAFD7F7C6F89C5297DD1159C7AE9B881 -s Disallowed
::  Tencent Technology Shenzhen Company Limited
%CertMgr% -del -c -sha1 2FDD445591CD2EEDBEF8B8A281896A59C08B3DC9 -s Disallowed
::  Tencent Technology Shenzhen Company Limited(2010-01-26)
%CertMgr% -del -c -sha1 8B46390D86B891E5A3D3AAB2B00D6FDB27A0F791 -s Disallowed
::  UC Mobile Limited
%CertMgr% -del -c -sha1 1540C77B5D19FC5A71A04DB001488E55B45DDC7F -s Disallowed
::  Wandou Technology Ltd
%CertMgr% -del -c -sha1 AB09D1AFE555CFC580575F5BC78B16B9F1C4E432 -s Disallowed
::  Xiamen Yitianxia Network Technology Co., Ltd
%CertMgr% -del -c -sha1 F49A648C69C2F01A0FDEB3992C5AE0A14D5AD9FC -s Disallowed
::  Xiami.Com
%CertMgr% -del -c -sha1 EEC507F719D5BA0CB913F034E045A24A509D8A5F -s Disallowed
::  Ylmf.Com
%CertMgr% -del -c -sha1 93A77CA50F165A5873DD3995874867B616AB3644 -s Disallowed
::  YY Inc
%CertMgr% -del -c -sha1 B3B89CD7940DC67E4291A3EE767AC17A3BC9E620 -s Disallowed

:: Print to screen.
@echo.
@echo RevokeChinaCerts CodeSigning Restore version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
