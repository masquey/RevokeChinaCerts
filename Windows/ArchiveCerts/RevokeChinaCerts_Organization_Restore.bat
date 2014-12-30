:: RevokeChinaCerts Organization Restore batch
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

:: Print to screen.
@echo.
@echo RevokeChinaCerts Organization Restore version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
