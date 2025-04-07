//
//  MICCropConfiguration.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

open class MICCropConfiguration {
    
    /// 是否自动退出裁剪页面Whether to automatically exit the cropped page
    public var autoBack: Bool
    ///是否自动设置分页按钮可用状态Whether to automatically set the available status of the paging button
    public var autoEnablePagingBtn: Bool
    
    /// 裁剪比例Crop Ratio
    public var aspectRatioType: EditorCropSizeConfiguration.AspectRatioType {
        didSet {
            fixedRatio = aspectRatioType != .original
            isRoundCrop = false
        }
    }
    /// 默认固定比例Default fixed ratio
    public var fixedRatio: Bool
    /// 圆形裁剪框Circular cutting frame
    public var isRoundCrop: Bool
    
    /// 裁剪时遮罩类型Mask type during cropping
    public var maskType: EditorImageResizerMaskView.MaskType
    
    
    public init() {
        autoEnablePagingBtn = true
        autoBack = true
        isRoundCrop = false
        aspectRatioType = .original
        fixedRatio = false
        maskType = .darkBlurEffect
    }
}
