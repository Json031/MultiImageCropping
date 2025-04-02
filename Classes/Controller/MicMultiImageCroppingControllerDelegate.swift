//
//  MicMultiImageCroppingControllerDelegate.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

public protocol MicMultiImageCroppingControllerDelegate: AnyObject {
    
    /// 选择完成之后调用Call after selection
    /// - Parameters:
    ///   - multiImageCroppingController: Controller控制器
    ///   - result: 裁剪结果Crop result
    func micController(
        _ micMultiImageCroppingController: MicMultiImageCroppingViewController,
        didFinishSelection result: [UIImage]
    )
    
    /// 点击取消时调用Call when clicking cancel
    ///   - multiImageCroppingController: Controller控制器
    func micController(
        didCancel micMultiImageCroppingController: MicMultiImageCroppingViewController
    )
    
    /// 点击下一页调用Call when click next page
    /// - Parameters:
    ///   - multiImageCroppingController: Controller控制器
    ///   - pageIndex: 当前页码
    func micController(
        _ micMultiImageCroppingController: MicMultiImageCroppingViewController,
        nextPage pageIndex: Int
    )
    
    /// 点击上一页调用Call when click next page
    /// - Parameters:
    ///   - multiImageCroppingController: Controller控制器
    ///   - pageIndex: 当前页码
    func micController(
        _ micMultiImageCroppingController: MicMultiImageCroppingViewController,
        lastPage pageIndex: Int
    )
}
