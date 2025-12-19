# MultiImageCropping
[![CocoaPods](https://img.shields.io/cocoapods/v/MultiImageCropping.svg)](https://cocoapods.org/pods/MultiImageCropping)
![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/Json031/MultiImageCropping/blob/main/LICENSE)
<br>
MultiImageCropping是一个通过分页处理来实现多图裁剪的开源项目，适用于发布多图帖子或博文或多图短视频的场景，实现引导用户将其选取的多张图片裁剪为规定比例的尺寸，默认裁剪图片中央区域，可移动调整中央区域，使多图短视频更加规范和美观。
<br>MultiImageCrop is an open-source project that uses pagination to achieve multi image cropping. It is suitable for scenarios where users publish multi image posts, blog posts, or short videos. It guides users to crop multiple selected images to a specified size ratio. By default, the central area of the image is cropped and can be adjusted by moving it, making multi image short videos more standardized and beautiful.

# Installation 安装:
* 最新版本 Latest Version: 

## CocoaPods
The [MultiImageCropping SDK for iOS](https://github.com/Json031/MultiImageCropping) is available through [CocoaPods](http://cocoapods.org). If CocoaPods is not installed, install it using the following command. Note that Ruby will also be installed, as it is a dependency of Cocoapods.
   ```bash
   brew install cocoapods
   pod setup
   ```
 ```bash
   $iOSVersion = '11.0'
   
   platform :ios, $iOSVersion
   use_frameworks!
   
   target 'YourProjectName' do
      pod 'MultiImageCropping' # Full version with all features
   end
   ```

## 手动安装 manual install
将Classes文件夹拽入项目中，OC项目还需要桥接
<br>Drag the Classes folder into the project, OC project still needs bridging

## 演示效果 Demonstrate
<img width="220" height="440" alt="screenshot-1" src="https://github.com/user-attachments/assets/93262aa4-1023-485d-af08-37a76338b0c0" style="border: 2px solid blue;" />

https://github.com/user-attachments/assets/a9a8d441-4c50-4d03-89d8-063535480ee1

# 代码结构

### 1. 主要属性
- `originalImgs: [UIImage]`：原始图片数组。
- `cropImgs: [UIImage]`：裁剪后的图片数组。
- `micConfiguration: MICUIConfiguration`：UI 配置。
- `micCropConfiguration: MICCropConfiguration`：裁剪配置。
- `photoEditorVCs: [PhotoEditorViewController]`：用于管理多个裁剪页面。
- `cpage: Int`：当前裁剪的图片索引。
- `delegate: MicMultiImageCroppingControllerDelegate?`：代理回调。

### 2. 主要方法
- `cropImages()`：对所有原始图片进行裁剪。
- `configView()`：初始化 UI 组件。
- `editImageAtPage()`：加载当前页的裁剪视图。
- `nextPageAction()` / `lastPageAction()`：切换到下一张或上一张图片。
- `commitAction()`：提交裁剪结果。
- `resetAction()`：重置当前图片裁剪状态。

### 3. 代理方法
`MicMultiImageCroppingControllerDelegate` 提供以下回调：
- `micController(_:didFinishSelection:)`：裁剪完成后返回裁剪后的图片数组。
- `micController(_:nextPage:)` / `micController(_:lastPage:)`：翻页回调。
- `micController(didCancel:)`：用户取消裁剪时的回调。

# 使用示例
```swift
let images: [UIImage] = [...]
let cropConfig = MICCropConfiguration()
cropConfig.aspectRatioType = .ratio_1x1

let cropVC = MicMultiImageCroppingViewController(originalImgs: images, micCropConfiguration: cropConfig) { croppedImages in
    print("裁剪完成: \(croppedImages.count) 张图片")
}
navigationController?.pushViewController(cropVC, animated: true)
```

- `MicTopMaskView` / `MicBottomToolView`：顶部遮罩和底部工具栏。
- `MICUIConfiguration` / `MICCropConfiguration`：裁剪 UI 和行为配置。

# License
This library is licensed under the [MIT License](https://github.com/Json031/MultiImageCropping/blob/main/LICENSE).
