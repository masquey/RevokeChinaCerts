:: RevokeChinaCerts All batch
:: Revoke China Certificates.
:: 
:: Author: JayXon, Chengr28
:: 

@echo off

:: Update certificates list of system.
cd /d %~dp0
"%~dp0\Tools\RootSUPD_201403_x86"

:: Architecture check
set CertMgr="%~dp0\Tools\CertMgr"
if "%PROCESSOR_ARCHITECTURE%%PROCESSOR_ARCHITEW6432%" == "x86" set CertMgr="%~dp0\Tools\CertMgr_x86"

:: Delete certificates(Base part)
::  Fake github.com(2013-01-25)
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine Root
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser Root
%CertMgr% -del -c -sha1 27A29C3A8B3261770E8B59448557DC9E9339E68C -s -r CurrentUser AuthRoot
::  Fake google.com(2014-07-24)
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine Root
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F6BEADB9BC02E0A152D71C318739CDECFC1C085D -s -r CurrentUser AuthRoot
::  Fake google.com(2014-09-18) [YFdyh000]
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine Root
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 316076F2866588DBB233C7F9EB68B58125150C21 -s -r CurrentUser AuthRoot
::  Fake yahoo.com(2014-09-30)
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine Root
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 2290C311EA0F3F57E06DF45B698E18E828E59BC3 -s -r CurrentUser AuthRoot
::  Fake hotmai.com(2014-10-02)
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine Root
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 30F3B3ADC6E570BDA606B9F96DE24190CE262C67 -s -r CurrentUser AuthRoot
::  Fake www.facebook.com(2014-10-08) [Yiwen Zhang]
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine Root
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318 -s -r CurrentUser AuthRoot
::  Fake www.icound.com(2014-10-04) [YFdyh000]
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r localMachine Root
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F468B5F3FED807974476A22B32EA3137D924F7BA -s -r CurrentUser AuthRoot
::  Fake *.hotmail.com(2015-01-17) [YFdyh000]
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r localMachine Root
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 75F411595FE9A21A17A4967C7B666E5152791A32 -s -r CurrentUser AuthRoot
::  CNNIC ROOT
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine Root
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser Root
%CertMgr% -del -c -sha1 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F -s -r CurrentUser AuthRoot
::  China Internet Network Information Center EV Certificates Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser Root
%CertMgr% -del -c -sha1 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E -s -r CurrentUser AuthRoot
::  CNNIC SSL(Entrust)
%CertMgr% -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r localMachine CA
%CertMgr% -del -c -sha1 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D -s -r CurrentUser CA
::  Baidu WACC service [SCFWSE]
%CertMgr% -del -c -sha1 561422647B89BE22F203EBCAEF52B5007227510A -s -r localMachine CA
%CertMgr% -del -c -sha1 561422647B89BE22F203EBCAEF52B5007227510A -s -r CurrentUser CA
::  GiantRootCA
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r localMachine Root
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r CurrentUser Root
%CertMgr% -del -c -sha1 7514436E903C901069980499CA70DE74FC06C83C -s -r CurrentUser AuthRoot
::  JGZXCA
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r localMachine Root
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 7A4AA61E2A88704115E47748D8647DAEE6837559 -s -r CurrentUser AuthRoot
::  Superfish, Inc. [Septembers/v998]
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r localMachine Root
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r CurrentUser Root
%CertMgr% -del -c -sha1 C864484869D41D2B0D32319C5A62F9315AAF2CBD -s -r CurrentUser AuthRoot

:: Delete certificates(Extended part)
::  CFCA GT CA(2011-06-13)
%CertMgr% -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine Root
%CertMgr% -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 EABDA240440ABBD694930A01D09764C6C2D77966 -s -r CurrentUser AuthRoot
::  CFCA GT CA(2012-08-21) [YFdyh000]
%CertMgr% -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r localMachine Root
%CertMgr% -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r CurrentUser Root
%CertMgr% -del -c -sha1 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A -s -r CurrentUser AuthRoot
::  CFCA EV ROOT
%CertMgr% -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine Root
%CertMgr% -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 E2B8294B5584AB6B58C290466CAC3FB8398F8483 -s -r CurrentUser AuthRoot
::  UCA Global Root
%CertMgr% -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine Root
%CertMgr% -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r CurrentUser Root
%CertMgr% -del -c -sha1 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF -s -r CurrentUser AuthRoot
::  UCA Root(2004-01-01)
%CertMgr% -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine Root
%CertMgr% -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 8250BED5A214433A66377CBC10EF83F669DA3A67 -s -r CurrentUser AuthRoot
::  UCA Extended Validation Root
%CertMgr% -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine Root
%CertMgr% -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r CurrentUser Root
%CertMgr% -del -c -sha1 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E -s -r CurrentUser AuthRoot
::  UCA ROOT(2001-01-01)
%CertMgr% -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r localMachine Root
%CertMgr% -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 3120F295417730075F8CD42D0CAE008EB5726EF8 -s -r CurrentUser AuthRoot
::  GoAgent CA [lenovo-me]
%CertMgr% -del -c -sha1 AB702CDF18EBE8B438C52869CD4A5DEF48B40E33 -s -r localMachine Root
%CertMgr% -del -c -sha1 AB702CDF18EBE8B438C52869CD4A5DEF48B40E33 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 AB702CDF18EBE8B438C52869CD4A5DEF48B40E33 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 AB702CDF18EBE8B438C52869CD4A5DEF48B40E33 -s -r CurrentUser AuthRoot
::  SZCA [yfdyh000]
::%CertMgr% -del -c -sha1 B0049D436F27237EE59C746A1EF3C96A8E1B54AC -s -r localMachine Root
::%CertMgr% -del -c -sha1 B0049D436F27237EE59C746A1EF3C96A8E1B54AC -s -r localMachine AuthRoot
::%CertMgr% -del -c -sha1 B0049D436F27237EE59C746A1EF3C96A8E1B54AC -s -r CurrentUser Root
::%CertMgr% -del -c -sha1 B0049D436F27237EE59C746A1EF3C96A8E1B54AC -s -r CurrentUser AuthRoot
::  SZCA(2003-07-22) [yfdyh000]
::%CertMgr% -del -c -sha1 90D7A97592F0A3E2165DE5DA23B57701D74A298D -s -r localMachine Root
::%CertMgr% -del -c -sha1 90D7A97592F0A3E2165DE5DA23B57701D74A298D -s -r localMachine AuthRoot
::%CertMgr% -del -c -sha1 90D7A97592F0A3E2165DE5DA23B57701D74A298D -s -r CurrentUser Root
::%CertMgr% -del -c -sha1 90D7A97592F0A3E2165DE5DA23B57701D74A298D -s -r CurrentUser AuthRoot

:: Delete certificates(All part)
::  ROOTCA OSCCA
::%CertMgr% -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine Root
::%CertMgr% -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r localMachine AuthRoot
::%CertMgr% -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r CurrentUser Root
::%CertMgr% -del -c -sha1 DBB84423C928ABE889D0E368FC3191D151DDB1AB -s -r CurrentUser AuthRoot
::  SRCA
%CertMgr% -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r localMachine Root
%CertMgr% -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 AE3F2E66D48FC6BD1DF131E89D768D505DF14302 -s -r CurrentUser AuthRoot
::  Certification Authority of WoSign
%CertMgr% -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r localMachine Root
%CertMgr% -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r CurrentUser Root
%CertMgr% -del -c -sha1 B94294BF91EA8FB64BE61097C7FB001359B676CB -s -r CurrentUser AuthRoot
::  Certification Authority of WoSign(Chinese)
%CertMgr% -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r localMachine Root
%CertMgr% -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 1632478D89F9213A92008563F5A4A7D312408AD6 -s -r CurrentUser AuthRoot
::  Class 1 Primary CA
%CertMgr% -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r localMachine Root
%CertMgr% -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 6A174570A916FBE84453EED3D070A1D8DA442829 -s -r CurrentUser AuthRoot
::  Certification Authority of WoSign(2009-08-08)
%CertMgr% -del -c -sha1 33A4D8BC38608EF52EF0E28A35091E9250907FB9 -s -r localMachine Root
%CertMgr% -del -c -sha1 33A4D8BC38608EF52EF0E28A35091E9250907FB9 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 33A4D8BC38608EF52EF0E28A35091E9250907FB9 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 33A4D8BC38608EF52EF0E28A35091E9250907FB9 -s -r CurrentUser AuthRoot
::  Certification Authority of WoSign 1(StartCom/2011-03-01)
%CertMgr% -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s -r localMachine CA
%CertMgr% -del -c -sha1 868241C8B85AF79E2DAC79EDADB723E82A36AFC3 -s -r CurrentUser CA
::  Certification Authority of WoSign 2(StartCom/2011-03-01)
%CertMgr% -del -c -sha1 692790DA5189529CC5CE1E16E984277A03023E99 -s -r localMachine CA
%CertMgr% -del -c -sha1 692790DA5189529CC5CE1E16E984277A03023E99 -s -r CurrentUser CA
::  Certification Authority of WoSign(StartCom/2006-09-18)
%CertMgr% -del -c -sha1 804E5FB7DE84F5F5B28347233EAF07846B6070D3 -s -r localMachine CA
%CertMgr% -del -c -sha1 804E5FB7DE84F5F5B28347233EAF07846B6070D3 -s -r CurrentUser CA
::  Certification Authority of WoSign(Chinese/StartCom) [v998]
%CertMgr% -del -c -sha1 D8EFF6C28BB508E4702565F42748454A872BD412 -s -r localMachine CA
%CertMgr% -del -c -sha1 D8EFF6C28BB508E4702565F42748454A872BD412 -s -r CurrentUser CA
::  Certification Authority of WoSign(USERTrust) [v998]
%CertMgr% -del -c -sha1 56FAADDC596DCF78D585D83A35BC04B690D12736 -s -r localMachine CA
%CertMgr% -del -c -sha1 56FAADDC596DCF78D585D83A35BC04B690D12736 -s -r CurrentUser CA
::  WoSign Premium Server Authority(USERTrust)
%CertMgr% -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s -r localMachine CA
%CertMgr% -del -c -sha1 E3D569137E603E7BACB6BCC66AE943850C8ADF38 -s -r CurrentUser CA
::  WoSign Server Authority(USERTrust)
%CertMgr% -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s -r localMachine CA
%CertMgr% -del -c -sha1 3E14B8BD6C568657D852D95D387249AE857B4A39 -s -r CurrentUser CA
::  WoSign SGC Server Authority(USERTrust)
%CertMgr% -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s -r localMachine CA
%CertMgr% -del -c -sha1 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9 -s -r CurrentUser CA
::  WoSign Client Authority(USERTrust)
%CertMgr% -del -c -sha1 FAD4319D4E173FF3853E51C98D21919BF3DA1A1E -s -r localMachine CA
%CertMgr% -del -c -sha1 FAD4319D4E173FF3853E51C98D21919BF3DA1A1E -s -r CurrentUser CA
::  WoTrust Premium Server Authority(USERTrust)
%CertMgr% -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s -r localMachine CA
%CertMgr% -del -c -sha1 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72 -s -r CurrentUser CA
::  WoTrust Server Authority(USERTrust)
%CertMgr% -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s -r localMachine CA
%CertMgr% -del -c -sha1 337DF96418F08A9355870513AFCEBDC68BCED767 -s -r CurrentUser CA
::  WoTrust SGC Server Authority(USERTrust)
%CertMgr% -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s -r localMachine CA
%CertMgr% -del -c -sha1 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C -s -r CurrentUser CA
::  WoTrust Client Authority(USERTrust)
%CertMgr% -del -c -sha1 38CFE78D9F1F0B0637AFCAAA3D5549D87C0AA1D0 -s -r localMachine CA
%CertMgr% -del -c -sha1 38CFE78D9F1F0B0637AFCAAA3D5549D87C0AA1D0 -s -r CurrentUser CA
::  China Trust Network(1) [QuantumGhost]
::%CertMgr% -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r localMachine Root
::%CertMgr% -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r localMachine AuthRoot
::%CertMgr% -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r CurrentUser Root
::%CertMgr% -del -c -sha1 C2CAEB0DC296FD50596BCA0F53C5364521167039 -s -r CurrentUser AuthRoot
::  China Trust Network(2) [QuantumGhost]
::%CertMgr% -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r localMachine Root
::%CertMgr% -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r localMachine AuthRoot
::%CertMgr% -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r CurrentUser Root
::%CertMgr% -del -c -sha1 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA -s -r CurrentUser AuthRoot
::  China Trust Network(3) [QuantumGhost]
::%CertMgr% -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r localMachine Root
::%CertMgr% -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r localMachine AuthRoot
::%CertMgr% -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r CurrentUser Root
::%CertMgr% -del -c -sha1 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3 -s -r CurrentUser AuthRoot
::  Hongkong Post Root CA
%CertMgr% -del -c -sha1 E0925E18C7765E22DABD9427529DA6AF4E066428 -s -r localMachine Root
%CertMgr% -del -c -sha1 E0925E18C7765E22DABD9427529DA6AF4E066428 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 E0925E18C7765E22DABD9427529DA6AF4E066428 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 E0925E18C7765E22DABD9427529DA6AF4E066428 -s -r CurrentUser AuthRoot
::  Hongkong Post Root CA 1 [v998]
%CertMgr% -del -c -sha1 D6DAA8208D09D2154D24B52FCB346EB258B28A58 -s -r localMachine Root
%CertMgr% -del -c -sha1 D6DAA8208D09D2154D24B52FCB346EB258B28A58 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 D6DAA8208D09D2154D24B52FCB346EB258B28A58 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 D6DAA8208D09D2154D24B52FCB346EB258B28A58 -s -r CurrentUser AuthRoot
::  Macao Post eSignTrust Root Certification Authority
%CertMgr% -del -c -sha1 89C32E6B524E4D65388B9ECEDC637134ED4193A3 -s -r localMachine Root
%CertMgr% -del -c -sha1 89C32E6B524E4D65388B9ECEDC637134ED4193A3 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 89C32E6B524E4D65388B9ECEDC637134ED4193A3 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 89C32E6B524E4D65388B9ECEDC637134ED4193A3 -s -r CurrentUser AuthRoot
::  Macao Post eSignTrust Root Certification Authority(G02)
%CertMgr% -del -c -sha1 06143151E02B45DDBADD5D8E56530DAAE328CF90 -s -r localMachine Root
%CertMgr% -del -c -sha1 06143151E02B45DDBADD5D8E56530DAAE328CF90 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 06143151E02B45DDBADD5D8E56530DAAE328CF90 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 06143151E02B45DDBADD5D8E56530DAAE328CF90 -s -r CurrentUser AuthRoot
::  ePKI Root Certification Authority
%CertMgr% -del -c -sha1 67650DF17E8E7E5B8240A4F4564BCFE23D69C6F0 -s -r localMachine Root
%CertMgr% -del -c -sha1 67650DF17E8E7E5B8240A4F4564BCFE23D69C6F0 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 67650DF17E8E7E5B8240A4F4564BCFE23D69C6F0 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 67650DF17E8E7E5B8240A4F4564BCFE23D69C6F0 -s -r CurrentUser AuthRoot
::  Government Root Certification Authority
%CertMgr% -del -c -sha1 F48B11BFDEABBE94542071E641DE6BBE882B40B9 -s -r localMachine Root
%CertMgr% -del -c -sha1 F48B11BFDEABBE94542071E641DE6BBE882B40B9 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 F48B11BFDEABBE94542071E641DE6BBE882B40B9 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 F48B11BFDEABBE94542071E641DE6BBE882B40B9 -s -r CurrentUser AuthRoot
::  TWCA Global Root CA
%CertMgr% -del -c -sha1 9CBB4853F6A4F6D352A4E83252556013F5ADAF65 -s -r localMachine Root
%CertMgr% -del -c -sha1 9CBB4853F6A4F6D352A4E83252556013F5ADAF65 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 9CBB4853F6A4F6D352A4E83252556013F5ADAF65 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 9CBB4853F6A4F6D352A4E83252556013F5ADAF65 -s -r CurrentUser AuthRoot
::  TWCA Root Certification Authority(1)
%CertMgr% -del -c -sha1 CF9E876DD3EBFC422697A3B5A37AA076A9062348 -s -r localMachine Root
%CertMgr% -del -c -sha1 CF9E876DD3EBFC422697A3B5A37AA076A9062348 -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 CF9E876DD3EBFC422697A3B5A37AA076A9062348 -s -r CurrentUser Root
%CertMgr% -del -c -sha1 CF9E876DD3EBFC422697A3B5A37AA076A9062348 -s -r CurrentUser AuthRoot
::  TWCA Root Certification Authority(2)
%CertMgr% -del -c -sha1 DF646DCB7B0FD3A96AEE88C64E2D676711FF9D5F -s -r localMachine Root
%CertMgr% -del -c -sha1 DF646DCB7B0FD3A96AEE88C64E2D676711FF9D5F -s -r localMachine AuthRoot
%CertMgr% -del -c -sha1 DF646DCB7B0FD3A96AEE88C64E2D676711FF9D5F -s -r CurrentUser Root
%CertMgr% -del -c -sha1 DF646DCB7B0FD3A96AEE88C64E2D676711FF9D5F -s -r CurrentUser AuthRoot
::  TaiCA Secure CA
%CertMgr% -del -c -sha1 5B404B6DB43E1F71557F75552E7668289B1B6309 -s -r localMachine CA
%CertMgr% -del -c -sha1 5B404B6DB43E1F71557F75552E7668289B1B6309 -s -r CurrentUser CA
::  TWCA Secure CA
%CertMgr% -del -c -sha1 3F3E6C4B33802A2FEA46C5CACA14770A40018899 -s -r localMachine CA
%CertMgr% -del -c -sha1 3F3E6C4B33802A2FEA46C5CACA14770A40018899 -s -r CurrentUser CA
::  TWCA Secure Certification Authority
%CertMgr% -del -c -sha1 339D811FEC673E7F731307A34C7C7523ABBE7DFE -s -r localMachine CA
%CertMgr% -del -c -sha1 339D811FEC673E7F731307A34C7C7523ABBE7DFE -s -r CurrentUser CA

@echo.

:: Add certificates to CRL(Base part)
%CertMgr% -add -c "%~dp0\Certs\[Fake]GitHubCom_201301.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]GoogleCom_201407.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]GoogleCom_201409.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]YahooCom_201409.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]HotmaiCom_201410.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]WwwFacebookCom_201410.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]WwwIcloudCom_201410.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Fake]AnyHotmailCom_201501.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CNNIC_ROOT.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\China_Internet_Network_Information_Center_EV_Certificates_Root.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CNNIC_SSL_Entrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Suspicious]WaccBaiduCom.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\GiantRootCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\JGZXCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Superfish_Inc.crt" -s Disallowed

:: Add certificates to CRL(Extended part)
::%CertMgr% -add -c ROOTCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CFCA_GT_CA_201106.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CFCA_GT_CA_201208.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\CFCA_EV_ROOT.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\UCA_Global_Root.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\UCA_Root_200401.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\UCA_Extended_Validation_Root.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\UCA_ROOT_200101.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\[Suspicious]GoAgent_CA.crt" -s Disallowed
::%CertMgr% -add -c "%~dp0\Certs\SZCA.crt" -s Disallowed
::%CertMgr% -add -c "%~dp0\Certs\SZCA_200307.crt" -s Disallowed

:: Add certificates to CRL(All part)
::%CertMgr% -add -c "%~dp0\Certs\ROOTCA_OSCCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\SRCA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_Chinese.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Class_1_Primary_CA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_200908.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_StartCom_201103_1.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_StartCom_201103_2.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_StartCom_200609.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_Chinese_StartCom.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Certification_Authority_Of_WoSign_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoSign_Premium_Server_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoSign_Server_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoSign_SGC_Server_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoSign_Client_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoTrust_Premium_Server_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoTrust_Server_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoTrust_SGC_Server_Authority_USERTrust.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\WoTrust_Client_Authority_USERTrust.crt" -s Disallowed
::%CertMgr% -add -c "%~dp0\Certs\China_Trust_Network_1.crt" -s Disallowed
::%CertMgr% -add -c "%~dp0\Certs\China_Trust_Network_2.crt" -s Disallowed
::%CertMgr% -add -c "%~dp0\Certs\China_Trust_Network_3.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Hongkong_Post_Root_CA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Hongkong_Post_Root_CA_1.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Macao_Post_eSignTrust_Root_Certification_Authority.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Macao_Post_eSignTrust_Root_Certification_Authority_G02.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\ePKI_Root_Certification_Authority.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\Government_Root_Certification_Authority.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\TWCA_Global_Root_CA.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\TWCA_Root_Certification_Authority_1.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\TWCA_Root_Certification_Authority_2.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\TaiCA_Secure_CA_GTE.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\TWCA_Secure_CA_Baltimore.crt" -s Disallowed
%CertMgr% -add -c "%~dp0\Certs\TWCA_Secure_Certification_Authority_USERTrust.crt" -s Disallowed

:: Print to screen.
@echo.
@echo RevokeChinaCerts All version
@echo Done. Please confirm the messages on screen.
@echo.
@pause
