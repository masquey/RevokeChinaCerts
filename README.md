AntiChinaCerts
==============
Anti China Certifications.

### 版本
Last updated on **2014-09-07**

### 使用方法
* Base 版本**以管理员身份运行** AntiChinaCerts(Base).bat
* Extended 版本**以管理员身份运行** AntiChinaCerts(Extended).bat

### 说明
* Extended 版本为 Base 版本扩展，添加另外几个CA根证书
* 使用前可使用 Microsoft_Fixit_20135.diagcab(Win7以及之后) 或者 Microsoft_Fixit_51014.msi(Vista以及之前) 重置证书列表，不过大多数情况下并不需要
* 使用前 **强烈建议以管理员身份运行自带的RootSUPD** 更新系统的证书列表

### 注意
* **将CA根证书直接删掉是没有任何作用的，下次访问使用该证书的网站时系统又会重新自动联网添加回去！**
* 本工具作用是先将列表中的CA根证书删掉，然后再将这些证书添加到CRL证书吊销列表中，这样证书才会被彻底禁用
* **因为每个用户使用的证书列表都是独立的，所以需要所有用户都运行一次才能彻底禁用这些证书！**
* 运行时如果遇到 Error: Can not find a certificate matching the hash value 不需要在意，只要后面 CertMgr Succeeded 运行成功就行，如果提示错误请检查是否是以管理员权限运行

### 涉及的CA根证书
* Base 版本
    * CNNIC ROOT
        * SHA-1 指纹 8BAF4C9B1DF02A92F7DA128EB91BACF498604B6F
        * 所属机构为 [China Internet Network Information Center/CNNIC/中国互联网络信息中心](http://www.cnnic.net.cn)
        * [测试网址](https://www.cnnic.net.cn)
    * China Internet Network Information Center EV Certificates Root
        * SHA-1 指纹 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E
        * 所属机构为 [China Internet Network Information Center/CNNIC/中国互联网络信息中心](http://www.cnnic.net.cn)
        * [测试网址](https://evdemo.cnnic.cn)
* Extended 版本
    * ROOTCA
        * SHA-1 指纹 4F99AA93FB2BD13726A1994ACE7FF005F2935D1E
        * 所属机构为 [Office of the State Commercial Cryptography Administration/OSCCA/国家商用密码管理办公室](http://www.oscca.gov.cn)
        * 测试：打开 Certs 目录中 CFCA_CS_SM2_OCA11 证书，该证书由 ROOTCA 交叉签署认证
    * CFCA GT CA
        * SHA-1 指纹 EABDA240440ABBD694930A01D09764C6C2D77966
        * 所属机构为 [China Financial Certification Authority/CFCA/中国金融认证中心](http://www.cfca.com.cn)
        * [测试网址](https://cstest.cfca.com.cn)
    * CFCA EV ROOT
        * SHA-1 指纹 E2B8294B5584AB6B58C290466CAC3FB8398F8483
        * 所属机构为 [China Financial Certification Authority/CFCA/中国金融认证中心](http://www.cfca.com.cn)
        * [测试网址](https://cs.cfca.com.cn)
    * UCA Global Root
        * SHA-1 指纹 0B972C9EA6E7CC58D93B20BF71EC412E7209FABF
        * 所属机构为 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
        * [测试网址](https://cs.cfca.com.cn)
    * UCA Root
        * SHA-1 指纹 8250BED5A214433A66377CBC10EF83F669DA3A67
        * 所属机构为 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
    * UCA EV Root
        * SHA-1 指纹 B9C9F58B3BBEF575E2B58328770E7B0076C40B5E
        * 所属机构为 [Shanghai Electronic Certificate Authority Center/SHECA/上海市数字证书认证中心](http://www.sheca.com)
* 观察中的CA根证书（**这些证书没有被工具禁用**）
    * SRCA
        * 本证书由其自行颁发，没有经过任何符合国际标准的国际事务所进行审计
        * 所属机构为 [Sinorail Certification Authority/SRCA/中铁数字证书认证中心](http://www.12306.cn)
        * [测试网址](https://kyfw.12306.cn)
    * Certification Authority of WoSign
        * 没有安装最新CA根证书列表时则由 StartCom Certification Authority 交叉签署认证
        * 所属机构为 [沃通CA](http://www.wosign.com)
        * [测试网址](https://www.wosign.com)
    * CA 沃通根证书
        * SHA-1 指纹 ?1632478D89F9213A92008563F5A4A7D312408AD6
        * 所属机构为 [沃通CA](http://www.wosign.com)
    * Class 1 Primary CA/WoSign 1999
        * 沃通CA收购美国 WoSign 的旧证书，于1999年发布
        * SHA-1 指纹 ?1632478D89F9213A92008563F5A4A7D312408AD6
        * 所属机构为 [沃通CA](http://www.wosign.com)
