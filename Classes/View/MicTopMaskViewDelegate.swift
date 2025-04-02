//
//  MicTopMaskViewDelegate.swift
//
//  Created by MorganChen on 2025/3/29.
//

import UIKit

public protocol MicTopMaskViewDelegate: AnyObject {
    /// 点击取消时调用Call when clicking cancel
    ///   - multiImageCroppingController: Controller控制器
    func topMaskView(
        didCancel micTopMaskView: MicTopMaskView
    )
}
