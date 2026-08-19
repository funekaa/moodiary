<picture>
  <source media="(prefers-color-scheme: dark)" srcset="res/banner/dark_zh.svg">
  <source media="(prefers-color-scheme: light)" srcset="res/banner/light_zh.svg">
  <img alt="The preview for moodiary." src="res/banner/light_zh.svg">
</picture>
<p align="center">简体中文</p>

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-3.41.0-blue?style=for-the-badge">
  <img src="https://img.shields.io/github/repo-size/northeast18/moodiary?style=for-the-badge&color=ff7070">
  <img src="https://img.shields.io/github/stars/northeast18/moodiary?style=for-the-badge&color=965f8a">
  <img src="https://img.shields.io/github/v/release/northeast18/moodiary?style=for-the-badge&color=4f5e7f">
  <img src="https://img.shields.io/github/license/northeast18/moodiary?style=for-the-badge&color=4ac6b7">
</div>

> 本项目基于 [ZhuJHua/moodiary](https://github.com/ZhuJHua/moodiary) 进行维护和修复。原作者项目已停止更新很长时间，本 fork 版本主要修复了使用中发现的 bug，并实现了一些新功能。

## 🛠️ 本版本 (v3.0.0) 修复与优化内容

### ⚡ 性能与包体积优化

- **彻底移除 TFLite 离线模块（应用瘦身）**：移除了冗余的 `tflite_flutter` 运行时与遗留阅读理解推理代码，**安装包体积立减 15MB~25MB+**。
- **Jieba 中文分词改造为精简词典**：在 Rust 侧关闭静态全量词典（`default-dict`），改为轻量化精简词典，大幅降低 Rust 二进制产物体积，同时保留高效的日记全文搜索与 TF-IDF 关键词提取能力。

### 🐛 Bug 修复与稳定性增强

- **修复数据库版本号字典序比对缺陷**：在 `PackageUtil` 中实现了数值化语义版本比较，彻底解决版本号跨位数（如 `2.4.10`）时导致历史数据库迁移脚本被错误重新执行的问题。
- **修复数据备份并发竞争（Race Condition）**：在 `FileUtil.zipFileUseRust` 中改为严格时序执行数据库导出与校验，杜绝备份包损坏或读取失败，并统一规范化跨平台压缩路径分隔符。
- **修复时间窗口加密跨午夜失效 Bug**：`AesUtil` 将 Salt 派生改为绑定时间槽，解决跨午夜 0 点时（如 23:59:59 至 00:00:01）Salt 突变导致解密必然失败的问题。
- **修复 WebDAV 同步响应类型转换崩溃**：修复 `jsonDecode` 返回 Map 强制向下转换 `Map<String, String>` 抛出的运行时 `TypeError`。
- **修复 WebDAV 同步服务未初始化异常**：初始化 `_syncStatus`，避免触发 `LateInitializationError`。
- **修复编辑页历史音频文件缺失导致的崩溃**：增加音频文件存在性检查与异常容错保护。
- **增强系统配置（PrefUtil）安全默认值回退**：避免冷启动时由于缺少配置项触发非空断言空指针异常。

### 历史版本内容

- **修复 WebDAV 同步加密上传功能**：修复 WebDAV 加密同步中只加密文字不加密照片/视频富文本的问题。
- **修复日记数据兼容性**：修复旧版日记数据缺少 `show` 字段导致的加载失败问题。
- **增强智能助手和多 AI 提供商支持**：智能助手支持各大主流大模型厂商（DeepSeek / OpenAI / Moonshot 等），并支持自定义 OpenAI 兼容格式。
- **分析统计功能完善**：支持调用大模型进行日记分析与词云统计。

### 依赖更新

- **flutter_rust_bridge**: 2.9.0 → 2.11.1
- **Flutter SDK**: >= 3.32.0 (推荐 3.41.0+)

## 🔧 主要技术栈

- [Flutter](https://github.com/flutter/flutter)（跨平台 UI 框架）
- [Isar](https://github.com/isar/isar)（高性能本地数据库）
- [GetX](https://github.com/jonataslaw/getx)（状态管理框架）
- [flutter_rust_bridge](https://github.com/Deskhun/flutter_rust_bridge)（Rust FFI 桥接）
- [Rust](https://www.rust-lang.org/)（加密等高性能本地处理）

## 📸 应用截图

> 应用持续更新中，新版本界面可能稍有变化

### 移动端

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="res/screenshot/mobile_dark_zh.webp">
  <source media="(prefers-color-scheme: light)" srcset="res/screenshot/mobile_light_zh.webp">
  <img alt="The mobile screenshot for moodiary." src="res/screenshot/mobile_light_zh.webp">
</picture>

### 桌面端

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="res/screenshot/desktop_dark_zh.webp">
  <source media="(prefers-color-scheme: light)" srcset="res/screenshot/desktop_light_zh.webp">
  <img alt="The desktop screenshot for moodiary." src="res/screenshot/desktop_light_zh.webp">
</picture>

## 🚀 安装指南

### 直接安装

通过下载 Release 中已编译好的安装包来使用，如果没有你所需要的平台，请使用手动编译。

### 手动编译

#### 环境要求

- Flutter SDK (>= 3.41.0 Stable)
- Dart (>= 3.7.0)
- Rust 工具链（Nightly）
- Clang/LLVM
- 兼容的 IDE（如 Android Studio、Visual Studio Code）

#### 安装步骤

1. **克隆仓库**：

```bash
git clone https://github.com/northeast18/moodiary.git
cd moodiary
```

2. **安装依赖**：

```bash
flutter pub get
```

3. **运行应用**：

```bash
flutter run
```

4. **打包发布**：

- Android: `flutter build apk --split-per-abi`
- iOS: `flutter build ipa`
- Windows: `flutter build windows`
- MacOS: `flutter build macos`

## 📝 更多说明

### 智能助手与自然语言处理（NLP）

Moodiary 结合了本地高性能分词与现代大语言模型（LLM）能力：

#### 1. 本地中文分词与高精度检索（Jieba Rust）
采用轻量化精简词典的 `jieba-rs` 进行本地分词索引构建与 TF-IDF 关键词抽取，确保日记搜索与词云统计毫秒级离线响应，同时极大程度控制了原生二进制体积。

#### 2. 多大模型在线智能助手
集成了云端与本地大模型支持，包括 DeepSeek、OpenAI、Moonshot 等，支持自由配置 Base URL、API Key 与模型型号，提供日记回顾问答、润色与周报分析功能。

## 🤝 贡献指南

欢迎贡献！请按照以下步骤进行贡献：

1. Fork 本仓库。
2. 创建一个新分支（`git checkout -b feature-branch-name`）。
3. 提交你的修改（`git commit -am 'Add some feature'`）。
4. 推送到分支（`git push origin feature-branch-name`）。
5. 创建一个 Pull Request。

请确保你的代码遵循 [Flutter 风格指南](https://flutter.dev/docs/development/tools/formatting) 并包含适当的测试。

## 📄 许可证

此项目基于 AGPL-3.0 许可证进行许可，详情请参阅 [LICENSE](LICENSE) 文件。

## 💖 鸣谢

- 感谢原作者 [ZhuJHua](https://github.com/ZhuJHua/moodiary) 提供的优秀项目基础
- 感谢 Flutter 团队提供出色的框架
- 感谢开源社区的宝贵贡献
