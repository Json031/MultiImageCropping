//
//  MICUIImageExtension.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

public extension UIImage {
    //UIImage正中间裁剪4:3比例的图片，其中裁剪宽度与原图一样，高度根据比例计算
    //Crop the image at a 4:3 ratio in the center of UIImage, with the cropped width being the same as the original image and the height calculated based on the ratio
    func croppedToAspectRatio(size: CGSize) -> UIImage? {
        //原始宽高比直接返回原图
        if size.width <= 0 || size.height <= 0 {
            return self
        }
        var width: CGFloat = size.width
        var height: CGFloat = size.height
        
        // 获取图片的原始尺寸
        // Obtain the original size of the image
        let originalSize = self.size
        
        // 根据宽度计算 4:3 比例下的高度
        // Calculate the height at a 4:3 ratio based on the width
        var targetHeight = originalSize.width * height / width
        if targetHeight > originalSize.height {
            targetHeight = originalSize.height
        }
        // 计算裁剪区域，使其位于图片正中间
        // Calculate the cropping area to be located in the center of the image
        let cropRect = CGRect(
            x: 0,
            y: (originalSize.height - targetHeight) / 2,
            width: originalSize.width,
            height: targetHeight
        )
        
        // 确保裁剪区域在图片范围内
        // Ensure that the cropping area is within the range of the image
        guard cropRect.origin.y >= 0, cropRect.size.height > 0 else {
            return nil
        }
        
        // 进行裁剪操作
        // Perform cutting operation
        if let cgImage = self.cgImage?.cropping(to: cropRect) {
            return UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation)
        }
        return nil
    }
    
    /// 将颜色值转化为图片
    ///
    /// - Parameter color: 颜色值
    /// - Returns: 图片对象
    class func dotImageFromColor(color: UIColor) -> UIImage {
        UIImage.colorImage(color: color, width: 1.0, height: 1.0)
    }
    class func colorImage(color: UIColor, width: CGFloat, height: CGFloat) -> UIImage {
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    class func imageFromBundle(bundle: Bundle, imgName: String) -> UIImage? {
        let bundleUrl = bundle.url(forResource: "MultiImageCroppingResources", withExtension: "bundle")!
        let resourceBundle = Bundle(url: bundleUrl)
        return UIImage(named: imgName, in: resourceBundle, compatibleWith: nil)
    }
}
