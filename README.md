AntiChinaCerts
==============
Anti China Certifications.
全自动可疑证书吊销工具

### 更新日期
**2014-10-18**

### Windows 批处理类型
* **Base** 为基础版本，删除信任并吊销了几个可疑的根证书、中级证书或假证书，直接运行 `AntiChinaCerts_Base.bat` 即可
* **Extended** 为扩展版本，删除信任并吊销了所有可疑的根证书、中级证书或假证书，直接运行 `AntiChinaCerts_Extended.bat` 即可，**建议使用此版本**
* **All** 为完全版本，删除信任并吊销了所有可疑的来自大中华地区的证书，直接运行 `AntiChinaCerts_All.bat` 即可，**此版本用于测试不建议使用**
* **Restore** 为恢复批处理，直接运行 `AntiChinaCerts_Restore.bat` 可恢复所有在上面几个版本中所有被加入吊销列表的证书的使用
* 具体的根证书、中级证书或假证书列表参见下文涉及的证书的介绍

### 特别说明
**Extended** 版和 **All** 版会自动吊销 GoAgent 自带的 `GoAgent CA` 证书，为免使用 GoAgent 时出现错误同时也为了系统加密连接的安全强烈建议更换其自带的 CA 根证书。**关闭所有 GoAgent 程序，进入其 `local` 目录删除 `CA.crt` 以及整个 `certs` 目录，然后清空所有浏览器数据重启 GoAgent 和浏览器即可。**

### 方法
* Windows
    * 选择好不同的版本，直接运行位于 Windows 目录里的批处理
    * 操作完毕建议清空所有浏览器数据和系统缓存，并重启网络连接
* Linux
    * 以 Debian 系列为例子，其它 Linux 发行版操作方法参见其官方说明
    * 打开终端并执行 `sudo dpkg-reconfigure ca-certificates`
    * 在列表中找到并选择需要禁用的证书，按空格键取消对该证书的信任
    * 对所有需要禁用的证书执行完上步操作后回车确定
    * 操作完毕建议清空所有浏览器数据和系统缓存，并重启网络连接
* Mac
    * 使用自动脚本
        * 使用 `sudo` 以 ROOT 权限运行位于 Mac 目录里的 `AntiChinaCerts.sh` 即可
    * 手动操作
        * `实用工具` - `钥匙串访问` - 在 `钥匙串` 中选择 `系统根证书`
        * 点击进入需要禁用的证书，展开 `信任` 标签并在 `使用此证书时` 下拉菜单选择 `永不信任` 并关闭即可
    * 操作完毕建议清空所有浏览器数据和系统缓存，并重启网络连接
* Firefox
    * `工具` - `选项` - `高级` - `证书` - `查看证书`
    * 点击进入需要禁用的证书，直接点击 `删除或不信任` 按钮即可
    * 操作完毕建议清空所有浏览器数据和系统缓存，并重启网络连接
* Android
    * `设置` - `安全` - `受信任的凭据(显示受信任的CA证书)`
    * 点击进入需要禁用的证书并下拉到最下面，点击 `禁用` 按钮即可
    * 操作完毕建议清空所有浏览器数据和系统缓存，并重启网络连接

### 说明
* Windows
    * 本工具作用是先将列表中的证书删掉，然后再将这些证书添加到CRL证书吊销列表中，CRL证书吊销列表中的证书才能被彻底禁用
    * 大部分 Windows 的程序和浏览器 Chrome 以及 Opera 亦使用 Windows 系统提供的证书列表
* Linux
    * 不同发行版系统本身的CA根证书列表可能有所不同，具体需要按实际情况操作
* Mac
    * OS X 10.9 版本时自带有 CNNIC ROOT 和 China Internet Network Information Center EV Certificates Root 和 UCA Global Root 以及 UCA Root
* Firefox
    * 32 版本时自带有 CNNIC ROOT 以及 China Internet Network Information Center EV Certificates Root
* Android
    * 4.4.4 版本时自带有 CNNIC ROOT 以及 China Internet Network Information Center EV Certificates Root
    * 4.4.4 版本之前的版本可能自带有 CNNIC ROOT

### 注意
* Windows
    * **直接将证书直接删除并没有任何作用，下次访问使用该证书的网站时又会重新自动联网添加。而由于每个用户使用独立的证书列表，需要所有用户都运行一次本工具才能彻底禁用证书的使用！**
    * 运行时如果遇到 `Error: Can not find a certificate matching the hash value` 等不需要在意，只要后面吊销证书时 `CertMgr Succeeded` 运行成功就行
* Linux
    * 在 /usr/share/ca-certificates 里也有一份各程序自己的CA根证书列表，大多数情况下直接删除可能并不能禁用证书
    * Linux 发行版系统虽然提供了CA根证书调用的统一接口，但程序实际使用的CA根证书列表可能是程序本身另外保存的一份，所以实际程序使用的CA根证书列表可能与系统统一接口不相同，**强烈建议在系统统一接口禁用证书后再通过程序本身提供的证书管理器进行禁用**
* Firefox
    * 在 Firefox 里对自带根证书执行 `删除或不信任` 操作就相当于是禁用其所有目的，并不会将根证书本身删除
* Android
    * Android 上由于没有提供比较方便的方法编辑CRL列表，故证书并不能被完全禁用，Apps 可以通过忽略证书错误继续使用
    * Android 系统没有自带的CA根证书默认为不信任状态，不需要手动添加到系统中
* iOS
    * iOS 没有任何官方提供的方法禁用自带的根证书，请放弃在 iOS 下禁用根证书的想法

### 涉及的证书
* **Base 版本**
    * Fake GitHub.Com(2013-01-25)
        * SHA-1 指纹 ‎27A29C3A8B3261770E8B59448557DC9E9339E68C
        * 此伪造证书被用于 2013-01-25 大规模中间人攻击 GitHub 网站
    * Fake Google.Com(2014-07-24)
        * SHA-1 指纹 ‎F6BEADB9BC02E0A152D71C318739CDECFC1C085D
        * 此伪造证书被用于 2014-09-01 大规模中间人攻击 Google 网站
    * Fake Google.Com(2014-09-18)
        * SHA-1 指纹 316076F2866588DBB233C7F9EB68B58125150C21
        * 此伪造证书被用于 2014-10 部分 IPv6 隧道服务器中间人攻击 Google 网站
    * Fake Yahoo.Com(2014-09-23)
        * SHA-1 指纹 ‎2290C311EA0F3F57E06DF45B698E18E828E59BC3
        * 此伪造证书被用于 2014-09-30 大规模中间人攻击 Yahoo 网站
    * Fake Hotmai.Com(2014-10-02)
        * SHA-1 指纹 ‎30F3B3ADC6E570BDA606B9F96DE24190CE262C67
        * 此伪造证书被用于 2014-10-02 大规模中间人攻击 Microsoft 网站
    * Fake Www.Facebook.Com(2014-10-08)
        * SHA-1 指纹 DC6EE6EDC4C078E1B2C12F6D1985000E27CFD318
        * 此伪造证书被用于 2014-10-08 部分教育网 IPv6 和隧道服务器中间人攻击 Facebook 网站
    * Fake Www.Icloud.Com(2014-10-04)
        * SHA-1 指纹 F468B5F3FED807974476A22B32EA3137D924F7BA
        * 此伪造证书被用于 2014-10-18 大规模中间人攻击 Apple iCloud 网站
    * CNNIC ROOT
        * SHA-1 指纹 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F
        * 所属 [China Internet Network Information Center/CNNIC/中国互联网络信息中心](http://www.cnnic.net.cn)
        * [测试网址](https://www.cnnic.net.cn)
    * China Internet Network Information Center EV Certificates Root
        * SHA-1 指纹 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E
        * 所属 [China Internet Network Information Center/CNNIC/中国互联网络信息中心](http://www.cnnic.net.cn)
        * [测试网址](https://evdemo.cnnic.cn)
    * CNNIC SSL
        * SHA-1 指纹 6856BB1A6C4F76DACA362187CC2CCD484EDDC25D
        * 由 Entrust.net Secure Server Certification Authority 签发的中级证书颁发机构
        * 在2007年5月11日颁发的 CNNIC ROOT 旧证书，已于2012年3月1日过期
        * 所属 [China Internet Network Information Center/CNNIC/中国互联网络信息中心](http://www.cnnic.net.cn)
* **Extended 版本**
    * CFCA GT CA
        * SHA-1 指纹 EABDA240440ABBD694930A01D09764C6C2D77966
        * 颁发日期为 2011-06-13
        * 所属 [China Financial Certification Authority/CFCA/中国金融认证中心](http://www.cfca.com.cn)
        * [测试网址](https://cstest.cfca.com.cn)
    * CFCA GT CA
        * SHA-1 指纹 A8F2DFE36AE0CC2DB9DD38347D30AED9551DD25A
        * 颁发日期为 2012-08-21
        * 所属 [China Financial Certification Authority/CFCA/中国金融认证中心](http://www.cfca.com.cn)
    * CFCA EV ROOT
        * SHA-1 指纹 E2B8294B5584AB6B58C290466CAC3FB8398F8483
        * 所属 [China Financial Certification Authority/CFCA/中国金融认证中心](http://www.cfca.com.cn)
        * [测试网址](https://cs.cfca.com.cn)
    * UCA Global Root
        * SHA-1 指纹 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF
        * 所属 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
        * [测试网址](https://www.sheca.com)
    * UCA Root
        * SHA-1 指纹 8250BED5A214433A66377CBC10EF83F669DA3A67
        * 所属 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
        * [测试网址](https://ibanks.bankofshanghai.com)
    * UCA Extended Validation Root
        * SHA-1 指纹 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E
        * 所属 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
    * UCA ROOT
        * SHA-1 指纹 3120F295417730075F8CD42D0CAE008EB5726EF8
        * 在2001年1月1日颁发的 UCA ROOT 旧证书，已于2013年1月1日过期
        * 所属 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
        * [测试网址](https://ibanks.bankofshanghai.com)
    * GoAgent CA
        * SHA-1 指纹 AB702CDF18EBE8B438C52869CD4A5DEF48B40E33
        * 所属 [GoAgent](https://github.com/goagent/goagent) 项目于初版使用至今的默认 CA 根证书
* **All 版本**
    * ROOTCA
        * SHA-1 指纹 ‎DBB84423C928ABE889D0E368FC3191D151DDB1AB
        * 所属 [Office of the State Commercial Cryptography Administration/OSCCA/国家商用密码管理办公室](http://www.oscca.gov.cn)
    * SRCA
        * SHA-1 指纹 ‎AE3F2E66D48FC6BD1DF131E89D768D505DF14302
        * 所属 [Sinorail Certification Authority/SRCA/中铁数字证书认证中心](http://www.12306.cn)
        * [测试网址](https://kyfw.12306.cn)
    * Certification Authority of WoSign
        * SHA-1 指纹 B94294BF91EA8FB64BE61097C7FB001359B676CB
        * 所属 [沃通CA](http://www.wosign.com)
        * [测试网址](https://www.wosign.com)
    * CA 沃通根证书
        * SHA-1 指纹 1632478D89F9213A92008563F5A4A7D312408AD6
        * 所属 [沃通CA](http://www.wosign.com)
    * Class 1 Primary CA
        * SHA-1 指纹 ‎6A174570A916FBE84453EED3D070A1D8DA442829
        * 在1999年7月8日颁发的美国 WoSign 公司的旧证书，于2013年5月17日被沃通CA收购，证书将于2020年7月7日过期
        * 所属 [沃通CA](http://www.wosign.com)
    * Certification Authority of WoSign
        * SHA-1 指纹 868241C8B85AF79E2DAC79EDADB723E82A36AFC3
        * 由 StartCom Certification Authority 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * WoSign Premium Server Authority
        * SHA-1 指纹 E3D569137E603E7BACB6BCC66AE943850C8ADF38
        * 由 AddTrust External CA Root/UTN-USERFirst-Hardware 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * WoSign Server Authority
        * SHA-1 指纹 3E14B8BD6C568657D852D95D387249AE857B4A39
        * 由 AddTrust External CA Root/UTN-USERFirst-Hardware 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * WoSign SGC Server Authority
        * SHA-1 指纹 6D5A18050D56BFDE525CBE89E8C45DD1B53D12E9
        * 由 UTN - DATACorp SGC 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * WoTrust Premium Server Authority
        * SHA-1 指纹 381CBC5048AFD9A02D3E5882D5F22D962B1A5F72
        * 由 AddTrust External CA Root/UTN-USERFirst-Hardware 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * WoTrust Server Authority
        * SHA-1 指纹 337DF96418F08A9355870513AFCEBDC68BCED767
        * 由 AddTrust External CA Root/UTN-USERFirst-Hardware 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * WoTrust SGC Server Authority
        * SHA-1 指纹 46A762F3C3CF3732DE22A8BA1EBBA3BC048F9B8C
        * 由 UTN - DATACorp SGC 签发的中级证书颁发机构
        * 所属 [沃通CA](http://www.wosign.com)
    * China Trust Network(1)
        * SHA-1 指纹 C2CAEB0DC296FD50596BCA0F53C5364521167039
        * 所属 [iTrusChina/天威诚信数字认证中心](http://www.itrus.com.cn)
    * China Trust Network(2)
        * SHA-1 指纹 B39B0B24B156D8B6123CAF7BA249DC81F27E39FA
        * 所属 [iTrusChina/天威诚信数字认证中心](http://www.itrus.com.cn)
    * China Trust Network(3)
        * SHA-1 指纹 7C88AE178AE6AB8E69C30AF586D84EF29B6E6AE3
        * 所属 [iTrusChina/天威诚信数字认证中心](http://www.itrus.com.cn)
    * Hongkong Post Root CA
        * SHA-1 指纹 E0925E18C7765E22DABD9427529DA6AF4E066428
        * 在2000年1月16日颁发的 Hongkong Post Root CA 1 旧证书，已于2010年1月17日过期
        * 所属 [Hongkong Post 香港郵政](http://www.hongkongpost.hk)
    * Hongkong Post Root CA 1
        * SHA-1 指纹 D6DAA8208D09D2154D24B52FCB346EB258B28A58
        * 所属 [Hongkong Post 香港郵政](http://www.hongkongpost.hk)
    * ePKI Root Certification Authority
        * SHA-1 指纹 67650DF17E8E7E5B8240A4F4564BCFE23D69C6F0
        * 所属 [中華電信公開金鑰基礎建設](http://epki.com.tw)
    * Government Root Certification Authority
        * SHA-1 指纹 F48B11BFDEABBE94542071E641DE6BBE882B40B9
        * 所属 [Government Root Certification Authority, GRCA](http://grca.nat.gov.tw/GRCAeng/htdocs/index.html)
    * TWCA Global Root CA
        * SHA-1 指纹 9CBB4853F6A4F6D352A4E83252556013F5ADAF65
        * 所属 [TWCA - 臺灣網路認證](www.twca.com.tw/Portal/Portal.aspx)
    * TWCA Root Certification Authority(1)
        * SHA-1 指纹 CF9E876DD3EBFC422697A3B5A37AA076A9062348
        * 所属 [TWCA - 臺灣網路認證](www.twca.com.tw/Portal/Portal.aspx)
    * TWCA Root Certification Authority(2)
        * SHA-1 指纹 DF646DCB7B0FD3A96AEE88C64E2D676711FF9D5F
        * 所属 [TWCA - 臺灣網路認證](www.twca.com.tw/Portal/Portal.aspx)
    * TaiCA Secure CA
        * SHA-1 指纹 5B404B6DB43E1F71557F75552E7668289B1B6309
        * 由 GTE CyberTrust Global Root 签发的中级证书颁发机构
        * 所属 [TWCA - 臺灣網路認證](www.twca.com.tw/Portal/Portal.aspx)
    * TWCA Secure CA
        * SHA-1 指纹 3F3E6C4B33802A2FEA46C5CACA14770A40018899
        * 由 Baltimore CyberTrust Root 签发的中级证书颁发机构
        * 所属 [TWCA - 臺灣網路認證](www.twca.com.tw/Portal/Portal.aspx)
    * TWCA Secure Certification Authority
        * SHA-1 指纹 339D811FEC673E7F731307A34C7C7523ABBE7DFE
        * 由 AddTrust External CA Root 签发的中级证书颁发机构
        * 所属 [TWCA - 臺灣網路認證](www.twca.com.tw/Portal/Portal.aspx)
