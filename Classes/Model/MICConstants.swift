//
//  Constants.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit


public let micScreenWidth = UIScreen.main.bounds.size.width
public let micScreenHeight = UIScreen.main.bounds.size.height
public func micStatusBar_Height() -> CGFloat {
    return (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) <= 0 ? UIApplication.shared.statusBarFrame.size.height : (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
}
public func micHomeIndicator_Height() -> CGFloat {
    return (micStatusBar_Height() > 20.0 ? 34.0 : 0.0)
}
public let micNavigationBarHeight = micStatusBar_Height() + 44.0
