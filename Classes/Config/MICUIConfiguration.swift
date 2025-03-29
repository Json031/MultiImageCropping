//
//  MICUIConfiguration.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

open class MICUIConfiguration {
    
    /// 重置按钮颜色reset btn color
    public var resetColor: UIColor
    public var resetBgColor: UIColor
    public var resetBorderWidth: CGFloat = 0.5
    public var resetFont: UIFont
    public var resetTitle: String
    public var resetTitleColor: UIColor
        
    /// 提交按钮背景颜色donebtn bg color
    public var commitBgColor: UIColor
    public var commitFontColor: UIColor
    public var commitTitle: String
    public var commitTitleFont: UIFont
    
    /// 上一张按钮last btn
    public var nextPageBtnFont: UIFont
    public var nextPageBtnImage: UIImage?
    public var nextPageBtnFontColor: UIColor
    
    /// 下一张按钮next btn
    public var lastPageBtnFont: UIFont
    public var lastPageBtnImage: UIImage?
    public var lastPageBtnFontColor: UIColor
    
    /// 页数page lab
    public var pageFontSize: CGFloat
    public var pageTitleColor: UIColor
    
    /// 顶部和底部视图top & bottom view
    public var toolViewBgColor: UIColor
    public var topViewBgColor: UIColor
    public var backBtnImage: UIImage?
    public var backBtnFrame: CGRect
    
    /// 裁剪框颜色Crop frame color
    public var corpBorderColor: UIColor
    
    /// 是否隐藏重置按钮Is the reset button hidden
    public var hideResetButton: Bool
    
    public init() {
        hideResetButton = false
        corpBorderColor = .white
        resetColor = UIColor.white
        resetColor = .white
        resetBgColor = .clear
        commitBgColor = .systemBlue
        commitFontColor = .white

        commitTitle = "Mic_Done".localizableFromBundle()
        commitTitleFont = .systemFont(ofSize: 16)
        resetFont = .systemFont(ofSize: 15)
        resetTitle = "Mic_Reset".localizableFromBundle()
        resetTitleColor = .white
        nextPageBtnFont = .systemFont(ofSize: 15)
        nextPageBtnImage = UIImage.imageFromBundle(imgName: "nextone")
        lastPageBtnFont = .systemFont(ofSize: 15)
        lastPageBtnImage = UIImage.imageFromBundle(imgName: "lastone")
        
        nextPageBtnFontColor = .white
        lastPageBtnFontColor = .white
        pageFontSize = 18
        pageTitleColor = .white
        backBtnFrame = CGRect(x: 16, y: micStatusBar_Height(), width: 35, height: 35)
        backBtnImage = UIImage.imageFromBundle(imgName: "turnback")
        toolViewBgColor = .init(hex: "#22222A")
        topViewBgColor = .clear
    }
}
