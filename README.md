# 花灰 ![Language](https://img.shields.io/badge/language-Swift%203-orange.svg)

<img src="https://raw.githubusercontent.com/lexrus/Huahui/master/Huahui/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60%403x.png" width="90" height="90" alt="icon"/>

这个小 App 用 UITableView 陈列了一些中国程序员经常读错的单词，用 AVFoundation 实现美音和英音的朗读，用 curl 和 awk 同步词库。功能异常简陋，实现非常粗暴，仅供 iOS 程序员自行编译，纠正发音使用，懒得提交 App Store。

使用效果见: https://twitter.com/lexrus/status/836928202912063491

### 鸣谢

单词列表引自 [中国程序员容易发音错误的单词](https://github.com/shimohq/chinese-programmer-wrong-pronunciation)，非常感谢这个仓库的创建者。

感谢 @liyu 实现了 Android 版： https://github.com/li-yu/Huahui-Android

### 如何更新词库

`make fetch` 下载 README.md 到 /tmp 目录；

`make export_swift` 从更新后的 README 生成 Swift 并放入粘贴板；

`make export_java` 生成对应的 Java 语句。

注：由于源库没有使用标准的数据格式，此 awk 程序可能在 README 更新后失败。
