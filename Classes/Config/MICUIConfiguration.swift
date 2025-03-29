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
    public var nextPageBtnImage: UIImage
    public var nextPageBtnFontColor: UIColor
    
    /// 下一张按钮next btn
    public var lastPageBtnFont: UIFont
    public var lastPageBtnImage: UIImage
    public var lastPageBtnFontColor: UIColor
    
    /// 页数page lab
    public var pageFontSize: CGFloat
    public var pageTitleColor: UIColor
    
    /// 顶部和底部视图top & bottom view
    public var toolViewBgColor: UIColor
    public var topViewBgColor: UIColor
    public var backBtnImage: UIImage
    public var backBtnFrame: CGRect
        
    public init() {
        resetColor = UIColor.white
        resetColor = .white
        resetBgColor = .clear
        commitBgColor = .systemBlue
        commitFontColor = .white
        commitTitle = NSLocalizedString("Mic_Done", comment: "")
        commitTitleFont = .systemFont(ofSize: 16)
        resetFont = .systemFont(ofSize: 15)
        resetTitle = NSLocalizedString("Mic_Reset", comment: "")
        resetTitleColor = .white
        nextPageBtnFont = .systemFont(ofSize: 15)
        nextPageBtnImage = UIImage(named: "nextone")!
        lastPageBtnFont = .systemFont(ofSize: 15)
        lastPageBtnImage = UIImage(named: "lastone")!
        
        nextPageBtnFontColor = .white
        lastPageBtnFontColor = .white
        pageFontSize = 18
        pageTitleColor = .white
        backBtnFrame = CGRect(x: 16, y: micStatusBar_Height(), width: 35, height: 35)
        backBtnImage = UIImage.init(named: "turnback")!
        toolViewBgColor = .init(hex: "#22222A")
        topViewBgColor = .clear
    }
}
