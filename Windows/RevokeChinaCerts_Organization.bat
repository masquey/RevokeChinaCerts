:: RevokeChinaCerts Organization batch
:: Revoke China Certificates.
:: 
:: Author: Chengr28
:: 

@echo off


:: Locate folder, architecture check and choice
cd /d %~dp0
set CertMgr="%cd%\Tools\CertMgr"
if %PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432% EQU x86 set CertMgr="%cd%\Tools\CertMgr_x86"
set Folder=%cd%\Certs\Organization
set /a SetForce = 0
set SetForceAppender="%cd%\Tools\SoftCertPolicyAppender\Binary\SoftCertPolicyAppender"
@echo RevokeChinaCerts Organization batch
@echo.
@echo Do you want to set force cetificates policy? [Y/N]
@echo Setting force need Administrator permissions and Microsoft .NET Framework 4.0!
set /p UserChoice="Choose: "
if /i %UserChoice% EQU Y (set /a SetForce=1)
@echo.
@echo 1: Revoke Organization cetificates
@echo 2: Revoke Organization cetificates(Choice version)
@echo 3: Restore all Organization revoking
@echo.
set /p UserChoice="Choose: "
set UserChoice=CASE_%UserChoice%
cls
goto %UserChoice%


:: All version
:CASE_1
if %SetForce% EQU 0 (
::  ABC
%CertMgr% -add -c "%Folder%\ABC.crt" -s Disallowed
::  ABC TEST CA
%CertMgr% -add -c "%Folder%\ABC_TEST_CA.crt" -s Disallowed
::  ABC2048
%CertMgr% -add -c "%Folder%\ABC2048.crt" -s Disallowed
::  Alibaba.com Corporation Root CA
%CertMgr% -add -c "%Folder%\AlibabaCom_Corporation_Root_CA.crt" -s Disallowed
::  ALIPAY_ROOT
%CertMgr% -add -c "%Folder%\ALIPAY_ROOT.crt" -s Disallowed
::  Alipay Trust NetWork
%CertMgr% -add -c "%Folder%\Alipay_Trust_NetWork.crt" -s Disallowed
::  BOCOMCA
%CertMgr% -add -c "%Folder%\BOCOMCA.crt" -s Disallowed
::  CCB CA ROOT(1999-06-29)
%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_199906.crt" -s Disallowed
::  CCB CA ROOT(2009-06-01)
%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_200906.crt" -s Disallowed
::  CFCA
%CertMgr% -add -c "%Folder%\CFCA.crt" -s Disallowed
::  CFCA CS CA
%CertMgr% -add -c "%Folder%\CFCA_CS_CA.crt" -s Disallowed
::  CFCA CS TEST CA
%CertMgr% -add -c "%Folder%\CFCA_CS_TEST_CA.crt" -s Disallowed
::  CFCA Operation CA3
%CertMgr% -add -c "%Folder%\CFCA_Operation_CA3.crt" -s Disallowed
::  CFCA RCA
%CertMgr% -add -c "%Folder%\CFCA_RCA.crt" -s Disallowed
::  CFCA Root CA
%CertMgr% -add -c "%Folder%\CFCA_Root_CA.crt" -s Disallowed
::  CFCA RSA RCA
%CertMgr% -add -c "%Folder%\CFCA_RSA_RCA.crt" -s Disallowed
::  China Trust Network(1)
%CertMgr% -add -c "%Folder%\China_Trust_Network_1.crt" -s Disallowed
::  China Trust Network(2)
%CertMgr% -add -c "%Folder%\China_Trust_Network_2.crt" -s Disallowed
::  China Trust Network(3)
%CertMgr% -add -c "%Folder%\China_Trust_Network_3.crt" -s Disallowed
::  ICBC
%CertMgr% -add -c "%Folder%\ICBC.crt" -s Disallowed
::  ICBC Root CA
%CertMgr% -add -c "%Folder%\ICBC_Root_CA.crt" -s Disallowed
::  IcbcCA
%CertMgr% -add -c "%Folder%\IcbcCA.crt" -s Disallowed
::  iTruschina CN Root CA(1)
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_1.crt" -s Disallowed
::  iTruschina CN Root CA(2)
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_2.crt" -s Disallowed
::  iTruschina CN Root CA(3)
%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_3.crt" -s Disallowed
::  Personal ICBC CA
%CertMgr% -add -c "%Folder%\Personal_ICBC_CA.crt" -s Disallowed
::  ROOTCA OSCCA
%CertMgr% -add -c "%Folder%\ROOTCA_OSCCA.crt" -s Disallowed
::  SZCA
%CertMgr% -add -c "%Folder%\SZCA.crt" -s Disallowed
::  SZCA(20030722)
%CertMgr% -add -c "%Folder%\SZCA_200307.crt" -s Disallowed
::  TenpayCom Root CA
%CertMgr% -add -c "%Folder%\TenpayCom_Root_CA.crt" -s Disallowed
) else (
:: Set force
%SetForceAppender% --set-force "%Folder%\ABC.crt" "%Folder%\ABC_TEST_CA.crt" "%Folder%\ABC2048.crt" "%Folder%\AlibabaCom_Corporation_Root_CA.crt" "%Folder%\ALIPAY_ROOT.crt" "%Folder%\Alipay_Trust_NetWork.crt" "%Folder%\BOCOMCA.crt" "%Folder%\CCB_CA_ROOT_199906.crt" "%Folder%\CCB_CA_ROOT_200906.crt" "%Folder%\CFCA.crt" "%Folder%\CFCA_CS_CA.crt" "%Folder%\CFCA_CS_TEST_CA.crt" "%Folder%\CFCA_Operation_CA3.crt" "%Folder%\CFCA_RCA.crt" "%Folder%\CFCA_Root_CA.crt" "%Folder%\CFCA_RSA_RCA.crt" "%Folder%\China_Trust_Network_1.crt" "%Folder%\China_Trust_Network_2.crt" "%Folder%\China_Trust_Network_3.crt" "%Folder%\ICBC.crt" "%Folder%\ICBC_Root_CA.crt" "%Folder%\IcbcCA.crt" "%Folder%\iTruschina_CN_Root_CA_1.crt" "%Folder%\iTruschina_CN_Root_CA_2.crt" "%Folder%\iTruschina_CN_Root_CA_3.crt" "%Folder%\Personal_ICBC_CA.crt" "%Folder%\ROOTCA_OSCCA.crt" "%Folder%\SZCA.crt" "%Folder%\SZCA_200307.crt" "%Folder%\TenpayCom_Root_CA.crt")
goto EXIT


:: Choice version
:CASE_2
set /p UserChoice="Revoke ABC? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ABC.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\ABC.crt"))
@echo.
set /p UserChoice="Revoke ABC TEST CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ABC_TEST_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force %Folder%\ABC_TEST_CA.crt""))
@echo.
set /p UserChoice="Revoke ABC2048? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ABC2048.crt" -s Disallowed) else (%SetForceAppender% --set-force %Folder%\ABC2048.crt""))
@echo.
set /p UserChoice="Revoke Alibaba.com Corporation Root CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\AlibabaCom_Corporation_Root_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\AlibabaCom_Corporation_Root_CA.crt"))
@echo.
set /p UserChoice="Revoke ALIPAY_ROOT? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ALIPAY_ROOT.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\ALIPAY_ROOT.crt"))
@echo.
set /p UserChoice="Revoke Alipay Trust NetWork? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\Alipay_Trust_NetWork.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\Alipay_Trust_NetWork.crt"))
@echo.
set /p UserChoice="Revoke BOCOMCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\BOCOMCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\BOCOMCA.crt"))
@echo.
set /p UserChoice="Revoke CCB CA ROOT(1999-06-29)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_199906.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CCB_CA_ROOT_199906.crt"))
@echo.
set /p UserChoice="Revoke CCB CA ROOT(2009-06-01)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CCB_CA_ROOT_200906.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CCB_CA_ROOT_200906.crt"))
@echo.
set /p UserChoice="Revoke CFCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA.crt"))
@echo.
set /p UserChoice="Revoke CFCA CS CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA_CS_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA_CS_CA.crt"))
@echo.
set /p UserChoice="Revoke CFCA CS TEST CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA_CS_TEST_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA_CS_TEST_CA.crt"))
@echo.
set /p UserChoice="Revoke CFCA Operation CA3? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA_Operation_CA3.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA_Operation_CA3.crt"))
@echo.
set /p UserChoice="Revoke CFCA RCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA_RCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA_RCA.crt"))
@echo.
set /p UserChoice="Revoke CFCA Root CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA_Root_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA_Root_CA.crt"))
@echo.
set /p UserChoice="Revoke CFCA RSA RCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\CFCA_RSA_RCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\CFCA_RSA_RCA.crt"))
@echo.
set /p UserChoice="Revoke China Trust Network(1)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\China_Trust_Network_1.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\China_Trust_Network_1.crt"))
@echo.
set /p UserChoice="Revoke China Trust Network(2)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\China_Trust_Network_2.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\China_Trust_Network_2.crt"))
@echo.
set /p UserChoice="Revoke China Trust Network(3)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\China_Trust_Network_3.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\China_Trust_Network_3.crt"))
@echo.
set /p UserChoice="Revoke ICBC? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ICBC.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\ICBC.crt"))
@echo.
set /p UserChoice="Revoke ICBC Root CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ICBC_Root_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\ICBC_Root_CA.crt"))
@echo.
set /p UserChoice="Revoke IcbcCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\IcbcCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\IcbcCA.crt"))
@echo.
set /p UserChoice="Revoke iTruschina CN Root CA(1)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_1.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\iTruschina_CN_Root_CA_1.crt"))
@echo.
set /p UserChoice="Revoke iTruschina CN Root CA(2)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_2.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\iTruschina_CN_Root_CA_2.crt"))
@echo.
set /p UserChoice="Revoke iTruschina CN Root CA(3)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\iTruschina_CN_Root_CA_3.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\iTruschina_CN_Root_CA_3.crt"))
@echo.
set /p UserChoice="Revoke Personal ICBC CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\Personal_ICBC_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\Personal_ICBC_CA.crt"))
@echo.
set /p UserChoice="Revoke ROOTCA OSCCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\ROOTCA_OSCCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\ROOTCA_OSCCA.crt"))
@echo.
set /p UserChoice="Revoke SZCA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\SZCA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\SZCA.crt"))
@echo.
set /p UserChoice="Revoke SZCA(20030722)? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\SZCA_200307.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\SZCA_200307.crt"))
@echo.
set /p UserChoice="Revoke TenpayCom Root CA? [Y/N]"
if /i %UserChoice% EQU Y (if %SetForce% EQU 0 (%CertMgr% -add -c "%Folder%\TenpayCom_Root_CA.crt" -s Disallowed) else (%SetForceAppender% --set-force "%Folder%\TenpayCom_Root_CA.crt"))
goto EXIT


:: Restore certificates
:CASE_3
::  ABC
%CertMgr% -del -c -sha1 78D0CDF5752D1E5B58A674644CFE3499BF02F9EF -s Disallowed
::  ABC TEST CA
%CertMgr% -del -c -sha1 F18C39F8B5A3E9BADC811BBA7690E8D0143BD851 -s Disallowed
::  ABC2048
%CertMgr% -del -c -sha1 6FAE9AD81467C5FCB93574670F52C8EF538F8B6D -s Disallowed
::  Alibaba.com Corporation Root CA
%CertMgr% -del -c -sha1 A7217F919843199C958C128449DD52D2723B0A8A -s Disallowed
::  ALIPAY_ROOT
%CertMgr% -del -c -sha1 59864294A96B3E5C37C058E9D1FBDE5FF0C2E4EE -s Disallowed
::  Alipay Trust NetWork
%CertMgr% -del -c -sha1 89A2FB0E332BA7275FE712FEC669D746125B1F32 -s Disallowed
::  BOCOMCA
%CertMgr% -del -c -sha1 4571466B830EAC5FCDC22103B9733C1A15CE78AC -s Disallowed
::  CCB CA ROOT(1999-06-29)
%CertMgr% -del -c -sha1 3018E5D74DF29E3590F5BB8DF01AA7FC116BB4DE -s Disallowed
::  CCB CA ROOT(2009-06-01)
%CertMgr% -del -c -sha1 8582B4AF7491B3D16636EEB32D44993D7DEE6C40 -s Disallowed
::  CFCA
%CertMgr% -del -c -sha1 A9743B713E4109381622D3689AB5D9E1DC51B164 -s Disallowed
::  CFCA CS CA
%CertMgr% -del -c -sha1 D3FBFAA8A67FC9A2EADBF86AEB5D07A9D6AF322E -s Disallowed
::  CFCA CS TEST CA
%CertMgr% -del -c -sha1 B5DCF1C58E86DBED2EA2D217A5C28D11FD9254F0 -s Disallowed
::  CFCA Operation CA3
%CertMgr% -del -c -sha1 5A3A3EA74AE5D29F25A670024949869D1222E42A -s Disallowed
::  CFCA RCA
%CertMgr% -del -c -sha1 AE73DFF81CF24E50DD52CA1496E7EF94876061CB -s Disallowed
::  CFCA Root CA
%CertMgr% -del -c -sha1 31BD6AEF73031C5A49338E7A06040DD815EF7512 -s Disallowed
::  CFCA RSA RCA
%CertMgr% -del -c -sha1 57C5CEBB53FBF181E0B13977AF864F1C13F11AA9 -s Disallowed
::  China Trust Network(1)
%CertMgr% -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s Disallowed
::  China Trust Network(2)
%CertMgr% -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s Disallowed
::  China Trust Network(3)
%CertMgr% -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s Disallowed
::  ICBC
%CertMgr% -del -c -sha1 E3F9043072BABF5E9C631960B34CCCF9FFC8BA41 -s Disallowed
::  ICBC Root CA
%CertMgr% -del -c -sha1 5A960203C10CFA8D42DD115B61154F98E2F617F7 -s Disallowed
::  IcbcCA
%CertMgr% -del -c -sha1 A02A23D13576ECA35498DC69166A20651E203E31 -s Disallowed
::  iTruschina CN Root CA(1)
%CertMgr% -del -c -sha1 240A61A2577970625B9F0B81283C4AA4037217B1 -s Disallowed
::  iTruschina CN Root CA(2)
%CertMgr% -del -c -sha1 46F168AF009C28C18F452EB85F5E8747892B3C8B -s Disallowed
::  iTruschina CN Root CA(3)
%CertMgr% -del -c -sha1 654E9FADD2032AE1B87D6263AF04FD7FEE38D57C -s Disallowed
::  Personal ICBC CA
%CertMgr% -del -c -sha1 2ABC81B0D7D052F887965562BB10AA66A80F7674 -s Disallowed
::  ROOTCA OSCCA
%CertMgr% -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s Disallowed
::  SZCA
%CertMgr% -del -c -sha1 B0049D436F27237EE59C746A1EF3C96A8E1B54AC -s Disallowed
::  SZCA(20030722)
%CertMgr% -del -c -sha1 90D7A97592F0A3E2165DE5DA23B57701D74A298D -s Disallowed
::  TenpayCom Root CA
%CertMgr% -del -c -sha1 56502166C0DE2488950491C90C7560E0E7AA7378 -s Disallowed
:: Unset force
@echo.
if %SetForce% EQU 1 (%SetForceAppender% -r --unset-force "%Folder%\ABC.crt" "%Folder%\ABC_TEST_CA.crt" "%Folder%\ABC2048.crt" "%Folder%\AlibabaCom_Corporation_Root_CA.crt" "%Folder%\ALIPAY_ROOT.crt" "%Folder%\Alipay_Trust_NetWork.crt" "%Folder%\BOCOMCA.crt" "%Folder%\CCB_CA_ROOT_199906.crt" "%Folder%\CCB_CA_ROOT_200906.crt" "%Folder%\CFCA.crt" "%Folder%\CFCA_CS_CA.crt" "%Folder%\CFCA_CS_TEST_CA.crt" "%Folder%\CFCA_Operation_CA3.crt" "%Folder%\CFCA_RCA.crt" "%Folder%\CFCA_Root_CA.crt" "%Folder%\CFCA_RSA_RCA.crt" "%Folder%\China_Trust_Network_1.crt" "%Folder%\China_Trust_Network_2.crt" "%Folder%\China_Trust_Network_3.crt" "%Folder%\ICBC.crt" "%Folder%\ICBC_Root_CA.crt" "%Folder%\IcbcCA.crt" "%Folder%\iTruschina_CN_Root_CA_1.crt" "%Folder%\iTruschina_CN_Root_CA_2.crt" "%Folder%\iTruschina_CN_Root_CA_3.crt" "%Folder%\Personal_ICBC_CA.crt" "%Folder%\ROOTCA_OSCCA.crt" "%Folder%\SZCA.crt" "%Folder%\SZCA_200307.crt" "%Folder%\TenpayCom_Root_CA.crt")


:: Print to screen.
:EXIT
@echo.
@echo RevokeChinaCerts Organization batch
@echo Done, please confirm the messages on screen.
@echo.
@pause
