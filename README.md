# MultiImageCropping
MicMultiImageCropping是一个用于多张图片裁剪的工具。
MicMultiImageCrop is a tool used for cropping multiple images.

# Installation 安装:

## CocoaPods
The [MultiImageCropping SDK for iOS](https://github.com/Json031/MultiImageCropping) is available through [CocoaPods](http://cocoapods.org). If CocoaPods is not installed, install it using the following command. Note that Ruby will also be installed, as it is a dependency of Cocoapods.
   ```bash
   brew install cocoapods
   pod setup
   ```

pod 'MultiImageCropping' # Full version with all features

## 手动安装 manual install
将Classes文件夹拽入项目中，OC项目还需要桥接
Drag the Classes folder into the project, OC project still needs bridging

https://github.com/user-attachments/assets/a9a8d441-4c50-4d03-89d8-063535480ee1


## 代码结构

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

## 使用示例
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
