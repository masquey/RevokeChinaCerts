RevokeChinaCerts
==============

### Usage
* Download all project files.
* Run batch as **Administrator permission** and follow README(Windows):
  * Different batches to revoke different certificates.
* Visit other system folders to revoke certificate(s) in other platforms.
* **Clear all browser(s) data/DNS cache of system** and restart network interface(s).

### Version
* **Base** is base version of RevokeChinaCerts, revoke some root/intermediate/fake certificates.
* **Extended** is extended version of RevokeChinaCerts, revoke all root/intermediate/fake certificates.
  * **This is the suggestion.**
* **All** is all version of RevokeChinaCerts, revoke all certificates from greater China.
  * **This is the experiment version.**
* **Restore** is restore batch, restore all revoked certificates.

### Special
* **Some security software will "protect" HTTPS transport with MITM/Man-in-the-middle attack, you must shutdown/uninstall these modules/softwares!**

### Attention(Windows)
* Delete certificates cannot revoke them. You must add the certificates to CRL to prohibit all their uses.
* Most of programs, Chrome and Opera are using system built-in certificate list.
* **Firefox** will revoke certificates if block all usages, no need to delete the certificates.
* `Error: Can not find a certificate matching the hash value`: Don't worry about it, please make sure there are `CertMgr Succeeded` in console window and pass the website test.
* `Failed to save to the destination store`: Please make sure run as administrators.
* `Error: Failed to add or delete certificates`: May be cause by the certificate list or CertMgr.

### Update(Windows)
* **1**: Update **CRL**/Certificate Revocation List
* **2**: Update **CTL**/Certificate Trust List(**Windows Update**)
* **3**: Update **CTL**/Certificate Trust List(RootSUPD, Windows XP/2003 and older)
* **4**: Reset **CRL**/Certificate Revocation List
* To reset all CTL/Certificate Trust List, do not select any options. Exit batch and use Microsoft Fixit tools:
  * **Microsoft_Fixit_20135.diagcab** - Windows Vista and later
  * **Microsoft_Fixit_51014.msi** - Windows XP/2003 and older

### Usage(without Automation tools)
* **Linux**(Debian, other Linux distributions should need to see its official description)
  * Run `sudo dpkg-reconfigure ca-certificates` in terminal.
  * Using the space bar to revoke the certificates.
  * Using tab and enter key to save changes.
  * Clear all browser(s) data and DNS cache of system, and restart network interface(s).
* **macOS**
  * Open `Utilities` - `Keychain Access` - `Keychains` - `System Roots`
  * Open the certificate and select all `Not trusted`.
  * Clear all browser(s) data and DNS cache of system, and restart network interface(s).
* **Firefox**
  * Open `Tools` - `Options` - `Advanced` - `Certificates` - `View Certificates`
  * Open the certificate and select to disable.
  * Clear all browser(s) data and DNS cache of system, and restart network interface(s).
* **Android**
  * `Setting` - `Security` - `Trusted credentials`
  * Open the certificate and select `Disable`.
  * Clear all browser(s) data and DNS cache of system, and restart network interface(s).
* **iOS**: There are not any documented or public ways to revoke certificates in iOS.

### About Certificates
* See [this link](https://github.com/chengr28/RevokeChinaCerts/tree/master/Shared/Certificates#human-readable-certificates-details) for more details.
* **Base** list

Name | Authority | Fingerprint
:---:|:---:|---
github.com | Fake | 27A29C3A8B3261770E8B59448557DC9E9339E68C
google.com | Fake | F6BEADB9BC02E0A152D71C318739CDECFC1C085D
google.com | Fake | 316076F2866588DBB233C7F9EB68B58125150C21
hotmai.com | Fake | 30F3B3ADC6E570BDA606B9F96DE24190CE262C67
www.facebook.com | Fake | DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318
www.icloud.com | Fake | F468B5F3FED807974476A22B32EA3137D924F7BA
yahoo.com | Fake | 2290C311EA0F3F57E06DF45B698E18E828E59BC3
*.hotmail.com | Fake | 75F411595FE9A21A17A4967C7B666E5152791A32
[*.wacc.baidu.com](https://wacc.n.shifen.com) | [Baidu, inc.](https://www.baidu.com) | 561422647B89BE22F203EBCAEF52B5007227510A
Blue Coat Public Services Intermediate CA | [VeriSign Class 3 Public Primary Certification Authority - G5](https://www.verisign.com) | 8EDCEE98F5788D38B8D8AD0E0C6137A6FBD1666D
China Internet Network Information Center EV Certificates Root | [China Internet Network Information Center](https://www.cnnic.net.cn) | 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E
CNNIC SSL | [Entrust.net Secure Server Certification Authority](https://www.entrust.net) | 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D
CNNIC ROOT | [China Internet Network Information Center](https://www.cnnic.net.cn) | 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F
GiantRootCA | [Giant Interactive Group Inc.](https://www.ztgame.com) | 7514436E903C901069980499CA70DE74FC06C83C
GoAgent CA | [GoAgent project](https://github.com/GoAgent/GoAgent) | AB702CDF18EBE8B438C52869CD4A5DEF48B40E33
[JGZXCA](https://211.146.10.133) | [National Radio and Television Administration](http://www.nrta.gov.cn) | 7A4AA61E2A88704115E47748D8647DAEE6837559
Superfish, Inc. | Superfish, Inc. | C864484869D41D2B0D32319C5A62F9315AAF2CBD
Thailand National Root Certification Authority - G1 | [Thailand National Root Certification Authority](https://www.nrca.go.th) | 66F2DCFB3F814DDEE9B3206F11DEFE1BFBDFE132
TÜRKTRUST Elektronik Sertifika Hizmet Sağlayıcısı | [TÜRKTRUST](https://www.turktrust.com.tr) | 7998A308E14D6585E6C21E153A719FBA5AD34AD9
TÜRKTRUST Elektronik Sertifika Hizmet Sağlayıcısı | [TÜRKTRUST](https://www.turktrust.com.tr) | B435D4E1119D1C6690A749EBB394BD637BA782B7
TÜRKTRUST Elektronik Sertifika Hizmet Sağlayıcısı | [TÜRKTRUST](https://www.turktrust.com.tr) | F17F6FB631DC99E3A3C87FFE1CF1811088D96033
TÜRKTRUST Elektronik Sertifika Hizmet Sağlayıcısı H5 | [TÜRKTRUST](https://www.turktrust.com.tr) | C418F64D46D1DF003D2730137243A91211C675FB
TÜRKTRUST Elektronik Sertifika Hizmet Sağlayıcısı H6 | [TÜRKTRUST](https://www.turktrust.com.tr) | 8A5C8CEEA503E60556BAD81BD4F6C9B0EDE52FE0

* **Extended** list

Name | Authority | Fingerprint
:---:|:---:|---
CA WoSign ECC Root | [WoSign CA Limited](https://www.wosign.com) | D27AD2BEED94C0A13CC72521EA5D71BE8119F32B
[CA 沃通根证书](https://root2evtest.wosign.com) | [WoSign CA Limited](https://www.wosign.com) | 1632478D89F9213A92008563F5A4A7D312408AD6
CA 沃通根证书 | [StartCom Certification Authority](https://www.startcomca.com) | B2FBDA222493A93C38F77C90D4BE6DA17F15F0B0
CA 沃通根证书 | [StartCom Certification Authority](https://www.startcomca.com) | CE335662F0EA6764B95C7F50A995A514ACE8C815
CA 沃通根证书 | [StartCom Certification Authority](https://www.startcomca.com) | D8EFF6C28BB508E4702565F42748454A872BD412
GDCA ROOT CA1 | [GUANG DONG CERTIFICATE AUTHORITY](https://www.gdca.com.cn) | 0A8F0029EA3CD051A30133BD7AA6ECCFF8FFEDC6
GDCA TrustAUTH E5 ROOT | [GUANG DONG CERTIFICATE AUTHORITY](https://www.gdca.com.cn) | EB466CD37565F93CDE1062CD8D9826ED23730F12
GDCA TrustAUTH R2 ROOT | [GUANG DONG CERTIFICATE AUTHORITY](https://www.gdca.com.cn) | 742CA08594ABA62CE76E94386EA75A98712F02EA
GDCA TrustAUTH R4 DV SSL CA G2 | [Certum CA](https://www.certum.eu) | 1E3159DAE31F0ED21050075C64E110807E9DA277
[GDCA TrustAUTH R4 EV SSL CA G2](https://www.gdca.com.cn) | [Certum CA](https://www.certum.eu) | 87DFE0056D01EB9635395D44A856218484F492F0
GDCA TrustAUTH R4 OV SSL CA G2 | [Certum CA](https://www.certum.eu) | B1B3162F7CC867F6D47536DF3232E706E031357C
GDCA TrustAUTH R5 ROOT | [GUANG DONG CERTIFICATE AUTHORITY](https://www.gdca.com.cn) | 0F36385B811A25C39B314E83CAE9346670CC74B4
CERNET CA | [The China Education and Research Network](https://www.cernet.edu.cn) | 8EF134D4BAD5498E348A7C6D9B66F67A09D56D9B
Certification Authority of WoSign | [Sectigo (UTN Object)](https://sectigo.com) | 1C1ECDCCF764E6168177C5711F33EC9229A29F88
Certification Authority of WoSign | [StartCom Certification Authority](https://www.startcomca.com) | 27D5BBE04301E1604839708D172CF09296ED9033
Certification Authority of WoSign | [WoSign CA Limited](https://www.wosign.com) | 33A4D8BC38608EF52EF0E28A35091E9250907FB9
Certification Authority of WoSign | [UTN – DATACorp SGC](https://sectigo.com) | 56FAADDC596DCF78D585D83A35BC04B690D12736
Certification Authority of WoSign | [StartCom Certification Authority](https://www.startcomca.com) | 692790DA5189529CC5CE1E16E984277A03023E99
Certification Authority of WoSign | [StartCom Certification Authority](https://www.startcomca.com) | 804E5FB7DE84F5F5B28347233EAF07846B6070D3
Certification Authority of WoSign | [Sectigo (UTN Object)](https://sectigo.com) | 7C1913D189C46577D7513F980A2CFD7EDCBA0EC9
Certification Authority of WoSign | [StartCom Certification Authority](https://www.startcomca.com) | 868241C8B85AF79E2DAC79EDADB723E82A36AFC3
Certification Authority of WoSign | [StartCom Certification Authority](https://www.startcomca.com) | B0B68AE97CFE2AFACD0DC2010B9D70ACE593E8A6
[Certification Authority of WoSign](https://root1evtest.wosign.com) | [WoSign CA Limited](https://www.wosign.com) | B94294BF91EA8FB64BE61097C7FB001359B676CB
Certification Authority of WoSign G2 | [Certum CA](https://www.certum.eu) | 73FFCA3F815B7A77717FE91912A4DC7B6BFB79CA
Certification Authority of WoSign G2 | [Certum CA](https://www.certum.eu) | B39191CFF08EB6FD8B447C21CAAEF6FC33F1D5AE
Certification Authority of WoSign G2 | [WoSign CA Limited](https://www.wosign.com) | FBEDDC9065B7272037BC550C9C56DEBBF27894E1
[CFCA EV ROOT](https://cs.cfca.com.cn) | [China Financial Certification Authority](https://www.cfca.com.cn) | E2B8294B5584AB6B58C290466CAC3FB8398F8483
CFCA GT CA | [China Financial Certification Authority](https://www.cfca.com.cn) | A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A
CFCA GT CA | [China Financial Certification Authority](https://www.cfca.com.cn) | EABDA240440ABBD694930A01D09764C6C2D77966
CFCA Identity CA | [China Financial Certification Authority](https://www.cfca.com.cn) | F02B70BDE4EAE02B207377B9FD4785E4C9CC55DC
Class 1 Primary CA | [WoSign CA Limited](https://www.wosign.com) | 6A174570A916FBE84453EED3D070A1D8DA442829
SRCA | [Sinorail Certification Authority](https://www.12306.cn) | AE3F2E66D48FC6BD1DF131E89D768D505DF14302
StartCom BR SSL ICA | [Certinomis - Root CA](https://www.certinomis.fr) | FD17DA1458D3514592C4F9544A6EA960B373E877
StartCom Certification Authority | [StartCom Certification Authority](https://www.startcomca.com) | 3E2BF7F2031B96F38CE6C4D8A85D3E2D58476A0F
StartCom Certification Authority | [StartCom Certification Authority](https://www.startcomca.com) | A3F1333FE242BFCFC5D14E8F394298406810D1A0
StartCom Certification Authority CS | [StartCom Certification Authority](https://www.startcomca.com) | 8E207F5DC0A69AA337658D2367433EC27D8506D0
StartCom Certification Authority ECC | [StartCom Certification Authority](https://www.startcomca.com) | B51085D95B95DA912012D2C3B0019A2DC46D26E3
StartCom Certification Authority G2 | [StartCom Certification Authority](https://www.startcomca.com) | 31F1FD68226320EEC63B3F9DEA4A3E537C7C3917
StartCom Certification Authority G3 | [StartCom Certification Authority](https://www.startcomca.com) | 689A1229D698D172E99E1BF00B9C19854119C9FC
StartCom EV SSL ICA | [Certinomis - Root CA](https://www.certinomis.fr) | 15C1776480382DEEFC869C2DA7F5BA8626B8A029
UCA Extended Validation Root | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | A3A1B06F2461234AE336A5C237FCA6FFDDF0D73A
UCA Extended Validation Root | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | B9C9F58B3BBEF575E2B58328770E7B0076C40B5E
UCA Extended Validation Root | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | C59DD79CC42245AC7216FDC18524F7D1E4CF1E92
UCA Global G2 Root | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | 28F97816197AFF182518AA44FEC1A0CE5CB64C8A
UCA Global Root | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF
UCA ROOT | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | 3120F295417730075F8CD42D0CAE008EB5726EF8
UCA Root | [Shanghai Electronic Certificate Authority Center Co., Ltd.](https://www.sheca.com) | 8250BED5A214433A66377CBC10EF83F669DA3A67
WoSign Client Authority | [Sectigo (UTN Client)](https://sectigo.com) | FAD4319D4E173FF3853E51C98D21919BF3DA1A1E
WoTrus DV Server CA | [Sectigo (formerly Comodo CA)](https://sectigo.com) | 4334C8323E735ADFCB028B17F72913680C43DD15
WoSign DV SSL CA | [Certum Trusted Network CA](https://www.certum.eu) | 5B562E002F15E1617C416D1960218544C18F36B7
WoSign EV SSL CA | [Certum Trusted Network CA](https://www.certum.eu) | 87DD1B740366A877FD28BF7ED709F4ACE1FA43A5
WoSign EV SSL Pro CA | [DigiCert High Assurance EV Root CA](https://www.digicert.com) | C0CDBE86C539F0A8BEAD82D82DF01B4DDA6FA349
WoSign OV SSL CA | [Certum Trusted Network CA](https://www.certum.eu) | FAEE1F690EDD55373C35E491EF0514F3EE9445A5
WoSign OV SSL Pro CA | [DigiCert High Assurance EV Root CA](https://www.digicert.com) | CAF415BAC356D194DA6FE89ECCB49DF4A216EACE
WoSign Premium Server Authority | [Sectigo (UTN Hardware)](https://sectigo.com) | E3D569137E603E7BACB6BCC66AE943850C8ADF38
WoSign Server Authority | [Sectigo (UTN Hardware)](https://sectigo.com) | 3E14B8BD6C568657D852D95D387249AE857B4A39
WoSign SGC Server Authority | [UTN – DATACorp SGC](https://sectigo.com) | 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9
WoTrus DV SSL CA | [Certum Trusted Network CA](https://www.certum.eu) | 4245FAB05FAE296958760C3D10EF55E4F25C8681
WoTrus EV SSL CA | [Certum Trusted Network CA](https://www.certum.eu) | C5447EDC0FAD9C60CA43D4C40F2464F2DA9BED3D
[WoTrus EV SSL Pro CA](https://www.wosign.com) | [DigiCert High Assurance EV Root CA](https://www.digicert.com) | 0750D9E76816800CC02FD1F4E1C058B5E51AE32A
WoTrus OV SSL CA | [Certum Trusted Network CA](https://www.certum.eu) | 3423C2D0496D3CFBBB1A39159DD218559DC1CD48
WoTrus OV SSL Pro CA | [DigiCert High Assurance EV Root CA](https://www.digicert.com) | F519492BD08F146837D187160222BEA26D8F8AEF
WoTrust Client Authority | [Sectigo (UTN Client)](https://sectigo.com) | 38CFE78D9F1F0B0637AFCAAA3D5549D87C0AA1D0
WoTrust Premium Server Authority | [Sectigo (UTN Hardware)](https://sectigo.com) | 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72
WoTrust Premium Server Authority | [Sectigo (UTN Hardware)](https://sectigo.com) | CF37A5B5C9166BD6B57A56BF67165A584B057241
WoTrust Server Authority | [Sectigo (UTN Hardware)](https://sectigo.com) | 337DF96418F08A9355870513AFCEBDC68BCED767
WoTrust Server Authority | [Sectigo (UTN Hardware)](https://sectigo.com) | D1F58CDB9194A374AC91DAADD411FEB99C434CC9
WoTrust SGC Server Authority | [UTN – DATACorp SGC](https://sectigo.com) | 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C
WoTrust SGC Server Authority | [UTN – DATACorp SGC](https://sectigo.com) | BCF8FDFBD8A8501D603A90356566C93BC83372EE
数安时代 R5 根 CA | [GUANG DONG CERTIFICATE AUTHORITY](https://www.gdca.com.cn) | 23EB1BA46471A1E7E9F2DB5701FEF8F2F80CAAE9

* **All** list

Name | Authority | Fingerprint
:---:|:---:|---
ePKI Root Certification Authority | [Chunghwa Telecom ecommerce Public Key Infrastructure](https://epki.com.tw) | 67650DF17E8E7E5B8240A4F4564BCFE23D69C6F0
ePKI Root Certification Authority - G2 | [Chunghwa Telecom ecommerce Public Key Infrastructure](https://epki.com.tw) | 81AC5DE150D1B8DE5D3E0E266A136B737862D322
[ePKI Root Certification Authority - G2](https://epki.com.tw) | [Chunghwa Telecom ecommerce Public Key Infrastructure](https://epki.com.tw) | D99B104298594763F0B9A927B79269CB47DD158B
ePKI Root Certification Authority - G3 | [Chunghwa Telecom ecommerce Public Key Infrastructure](https://epki.com.tw) | B172B1A56D95F91FE50287E14D37EA6A4463768A
Government Root Certification Authority | [Government Root Certification Authority](https://grca.nat.gov.tw) | F48B11BFDEABBE94542071E641DE6BBE882B40B9
[Government Root Certification Authority 2](https://grca.nat.gov.tw) | [Government Root Certification Authority](https://grca.nat.gov.tw) | B091AA913847F313D727BCEFC8179F086F3A8C0F
Hongkong Post Root CA | [Hongkong Post](https://www.hongkongpost.hk) | E0925E18C7765E22DABD9427529DA6AF4E066428
[Hongkong Post Root CA 1](https://www.hongkongpost.hk) | [Hongkong Post](https://www.hongkongpost.hk) | D6DAA8208D09D2154D24B52FCB346EB258B28A58
Hongkong Post Root CA 2 | [Hongkong Post](https://www.hongkongpost.hk) | DE010808E41EC41930D44095F8FE596B582C8CA2
Hongkong Post Root CA 3 | [Hongkong Post](https://www.hongkongpost.hk) | 58A2D0EC2052815BC1F3F86402244EC28E024B02
Macao Post eSignTrust Root Certification Authority | [Macao Post eSignTrust Certification Services](https://www.esigntrust.com) | 89C32E6B524E4D65388B9ECEDC637134ED4193A3
Macao Post eSignTrust Root Certification Authority (G02) | [Macao Post eSignTrust Certification Services](https://www.esigntrust.com) | 06143151E02B45DDBADD5D8E56530DAAE328CF90
Macao Post eSignTrust Root Certification Authority (G03) | [Macao Post eSignTrust Certification Services](https://www.esigntrust.com) | 9D319381546EA6A12811E09CF90A20C840BE944D
TaiCA Secure CA | [GTE CyberTrust Global Root](https://www.digicert.com) | 5B404B6DB43E1F71557F75552E7668289B1B6309
TWCA Global Root CA | [TAIWAN-CA INC.](https://www.twca.com.tw) | 9CBB4853F6A4F6D352A4E83252556013F5ADAF65
[TWCA Root Certification Authority 1](https://www.twca.com.tw) | [TAIWAN-CA INC.](https://www.twca.com.tw) | CF9E876DD3EBFC422697A3B5A37AA076A9062348
TWCA Root Certification Authority 2 | [TAIWAN-CA INC.](https://www.twca.com.tw) | DF646DCB7B0FD3A96AEE88C64E2D676711FF9D5F
TWCA Secure CA | [Baltimore CyberTrust Root](https://www.digicert.com) | 3F3E6C4B33802A2FEA46C5CACA14770A40018899
TWCA Secure Certification Authority | [Sectigo (AddTrust)](https://sectigo.com) | 339D811FEC673E7F731307A34C7C7523ABBE7DFE
