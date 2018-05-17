Android 证书屏蔽
=====================================================

本工具为 Android 4.1 或以上之设备安装用于屏蔽某些数字证书的配置。

## 简介
本工具安装的配置文件将屏蔽某些 CA 和 EE 证书。使用前请确保所有脚本具有执行权限。

## 用法 -- 使用预先生成的配置文件（推荐）
### 有 root 权限
若您持有待配置之 Android 设备 root 访问，请在 `cd` 进入对应名称的文件夹中 (RESTORE, ALL, EXTENDED or BASE，推荐 EXTENDED) 并调用 root.sh 文件安装入对应的配置文件。

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        ./rooted.sh

若您使用 Windows 平台且未有 BASH，请在命令行中运行：

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push pubkey_blacklist.txt /sdcard/pubkey_blacklist.txt
        adb push serial_blacklist.txt /sdcard/serial_blacklist.txt

        adb shell su -c "cp /sdcard/pubkey_blacklist.txt /data/misc/keychain/pubkey_blacklist.txt"
        adb shell su -c "cp /sdcard/serial_blacklist.txt /data/misc/keychain/serial_blacklist.txt"

### 若无 root 权限

        git clone [REPO_ADDRESS]
        cd Android/prebuilt/[type]
        adb push flashable.zip /sdcard/update.zip
        # 下面命令将重启您的 Android 设备至 recovery 状态
        adb reboot recovery
        # 请使用 recovery 刷入 zip 包

## 用法 -- 通过源代码生成配置文件
首先使用 `git` 克隆整个项目并 `cd` 到这个目录。使用 `generate.sh` 来生成您需要的配置文件。

        git clone [REPO_ADDRESS]
        cd RevokeChinaCerts/Android
        ./generate.sh extended

通过用 `restore` 或 `base` 或 `all` 来代替 `extended` 以得到相应的配置文件。

### 有 root 权限
如果您的 Android 设备有 root 权限和适当的 ADB 驱动程序，请使用 `rooted.sh` 将配置文件传输到您的设备。

        ./rooted.sh

然后重新启动设备，以便应用新配置。如果上述方法失败，请使用下面提到的恢复方法。

### 恢复方法
运行 `generate.sh` 之后，您会在当前文件夹中获得一个 `flashable.zip` 它可以通过第三方的 recovery 程序刷入 Android 上。

## 注意
程序更改 Android 设备的 `/data` 分区下的配置，每当您进行数据重置或刷入工厂映像时都会擦除该设备。

此实用程序不会删除 `/system` 下的任何证书，所以在执行 OTA 时不会造成任何麻烦。不过这种配置会覆盖您的系统上安装的证书（也就是说，如果您使用此工具删除 *Wosign* 的信任，请从 *Wosign* 手动安装 CA 证书，此操作 *不会* 导致系统将 Wosign 颁发的证书视为有效）。

在 Android 上，每个应用程序都可以定义自己的证书验证策略。应用程序可以定义自定义方法来仅接受某些特定的证书（称为锚定，也可以在系统范围内使用），或者接受任何证书而不管其颁发者（例如 Twidere）。使用此工具删除证书 *不保证* 特定的应用拒绝与这些证书关联的证书。

Android 中的黑名单工作如下。CA 证书通过公钥的 SHA-1 校验和列入黑名单并 EE 证明序列号。由于序列号对于相应的证书颁发机构只需要是唯一的，所以列入黑名单的序列号可能会意外地将其它 *无辜* 列入黑名单，特别是当序列号很小时。

Android 中的证书黑名单可能通过 Play Services 进行更新，安装此工具可能会干扰未来的 Google 黑名单，这可能是在设备上设置第一个 Google 帐户时完成的，也可能是在稍后的某个时间。虽然 Google 没有通过这个渠道推送更多的证书撤销信息。截至目前（2015年2月），黑名单仅分别由两部分组成：

        CA Public Key: 5f3ab33d55007054bc5e3e5553cd8d8465d77c61,
                        783333c9687df63377efceddd82efa9101913e8e
        Serial Number: 827,864 [这是 16 进制数值]

如果发生下一个类似 Diginotar 的事件，安装此工具可能会阻止您获取更新的黑名单。

有关 Android 上证书黑名单的更多详细说明，请参阅 [这里](https://nelenkov.blogspot.com/2012/07/certificate-blacklisting-in-jelly-bean.html)。关于证书锚定功能，请参阅 [这里](https://nelenkov.blogspot.com/2012/12/certificate-pinning-in-android-42.html)。

## 授权
本工具在 Apache License 下授权。
