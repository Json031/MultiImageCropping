# MultiImageCropping
<a name="top"></a>

[![CocoaPods](https://img.shields.io/cocoapods/v/MultiImageCropping.svg)](https://cocoapods.org/pods/MultiImageCropping)
![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/Json031/MultiImageCropping/blob/main/LICENSE)

---

## 🌍 Language / 语言选择

**[English](#english)** | **[中文](#中文)**

---

## 📖 English
<a name="english"></a>

### Overview

MultiImageCropping is an open-source project that uses pagination to achieve multi-image cropping. It is suitable for scenarios where users publish multi-image posts, blog posts, or short videos. It guides users to crop multiple selected images to a specified aspect ratio. By default, the central area of the image is cropped and can be adjusted by moving it, making multi-image short videos more standardized and beautiful.

### Installation

#### CocoaPods

The [MultiImageCropping SDK for iOS](https://github.com/Json031/MultiImageCropping) is available through [CocoaPods](http://cocoapods.org). 

**First, install CocoaPods if you haven't already:**

```bash
brew install cocoapods
pod setup
```

**Add to your Podfile:**

```ruby
$iOSVersion = '11.0'

platform :ios, $iOSVersion
use_frameworks!

target 'YourProjectName' do
   pod 'MultiImageCropping' # Full version with all features
end
```

#### Manual Installation

Drag the `Classes` folder into your project. For Objective-C projects, bridging is required.

### Demo

<img width="220" height="440" alt="screenshot-1" src="https://github.com/user-attachments/assets/93262aa4-1023-485d-af08-37a76338b0c0" style="border: 2px solid blue;" />

https://github.com/user-attachments/assets/a9a8d441-4c50-4d03-89d8-063535480ee1

### Code Structure

#### 1. Main Properties

- `originalImgs: [UIImage]` - Array of original images
- `cropImgs: [UIImage]` - Array of cropped images
- `micConfiguration: MICUIConfiguration` - UI configuration
- `micCropConfiguration: MICCropConfiguration` - Crop configuration
- `photoEditorVCs: [PhotoEditorViewController]` - Manages multiple cropping pages
- `cpage: Int` - Current image index
- `delegate: MicMultiImageCroppingControllerDelegate?` - Delegate callbacks

#### 2. Main Methods

- `cropImages()` - Crop all original images
- `configView()` - Initialize UI components
- `editImageAtPage()` - Load cropping view for current page
- `nextPageAction()` / `lastPageAction()` - Switch to next or previous image
- `commitAction()` - Submit cropping results
- `resetAction()` - Reset current image cropping state

#### 3. Delegate Methods

`MicMultiImageCroppingControllerDelegate` provides the following callbacks:

- `micController(_:didFinishSelection:)` - Returns cropped images array after completion
- `micController(_:nextPage:)` / `micController(_:lastPage:)` - Page navigation callbacks
- `micController(didCancel:)` - Callback when user cancels cropping

### Usage Example

```swift
let images: [UIImage] = [...]
let cropConfig = MICCropConfiguration()
cropConfig.aspectRatioType = .ratio_1x1

let cropVC = MicMultiImageCroppingViewController(originalImgs: images, micCropConfiguration: cropConfig) { croppedImages in
    print("Cropping completed: \(croppedImages.count) images")
}

navigationController?.pushViewController(cropVC, animated: true)
```

### Components

- `MicTopMaskView` / `MicBottomToolView` - Top mask and bottom toolbar
- `MICUIConfiguration` / `MICCropConfiguration` - Cropping UI and behavior configuration

### License

This library is licensed under the [MIT License](https://github.com/Json031/MultiImageCropping/blob/main/LICENSE).

---

## 📖 中文
<a name="中文"></a>

### 项目简介

MultiImageCropping 是一个通过分页处理来实现多图裁剪的开源项目，适用于发布多图帖子或博文或多图短视频的场景，实现引导用户将其选取的多张图片裁剪为规定比例的尺寸，默认裁剪图片中央区域，可移动调整中央区域，使多图短视频更加规范和美观。

### 安装

#### CocoaPods

[MultiImageCropping SDK for iOS](https://github.com/Json031/MultiImageCropping) 可通过 [CocoaPods](http://cocoapods.org) 安装。

**首先，如果您还没有安装 CocoaPods，请先安装：**

```bash
brew install cocoapods
pod setup
```

**在 Podfile 中添加：**

```ruby
$iOSVersion = '11.0'

platform :ios, $iOSVersion
use_frameworks!

target 'YourProjectName' do
   pod 'MultiImageCropping' # 包含所有功能的完整版本
end
```

#### 手动安装

将 `Classes` 文件夹拽入项目中，OC 项目还需要桥接。

### 演示效果

<img width="220" height="440" alt="截图-1" src="https://github.com/user-attachments/assets/93262aa4-1023-485d-af08-37a76338b0c0" style="border: 2px solid blue;" />

https://github.com/user-attachments/assets/a9a8d441-4c50-4d03-89d8-063535480ee1

### 代码结构

#### 1. 主要属性

- `originalImgs: [UIImage]` - 原始图片数组
- `cropImgs: [UIImage]` - 裁剪后的图片数组
- `micConfiguration: MICUIConfiguration` - UI 配置
- `micCropConfiguration: MICCropConfiguration` - 裁剪配置
- `photoEditorVCs: [PhotoEditorViewController]` - 用于管理多个裁剪页面
- `cpage: Int` - 当前裁剪的图片索引
- `delegate: MicMultiImageCroppingControllerDelegate?` - 代理回调

#### 2. 主要方法

- `cropImages()` - 对所有原始图片进行裁剪
- `configView()` - 初始化 UI 组件
- `editImageAtPage()` - 加载当前页的裁剪视图
- `nextPageAction()` / `lastPageAction()` - 切换到下一张或上一张图片
- `commitAction()` - 提交裁剪结果
- `resetAction()` - 重置当前图片裁剪状态

#### 3. 代理方法

`MicMultiImageCroppingControllerDelegate` 提供以下回调：

- `micController(_:didFinishSelection:)` - 裁剪完成后返回裁剪后的图片数组
- `micController(_:nextPage:)` / `micController(_:lastPage:)` - 翻页回调
- `micController(didCancel:)` - 用户取消裁剪时的回调

### 使用示例

```swift
let images: [UIImage] = [...]
let cropConfig = MICCropConfiguration()
cropConfig.aspectRatioType = .ratio_1x1

let cropVC = MicMultiImageCroppingViewController(originalImgs: images, micCropConfiguration: cropConfig) { croppedImages in
    print("裁剪完成: \(croppedImages.count) 张图片")
}

navigationController?.pushViewController(cropVC, animated: true)
```

### 组件说明

- `MicTopMaskView` / `MicBottomToolView` - 顶部遮罩和底部工具栏
- `MICUIConfiguration` / `MICCropConfiguration` - 裁剪 UI 和行为配置

### 许可证

本项目基于 [MIT License](https://github.com/Json031/MultiImageCropping/blob/main/LICENSE) 开源协议。

---

**[⬆ Back to Top / 返回顶部](#top)**
