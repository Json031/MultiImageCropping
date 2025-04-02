//
//  MicBottomToolViewDelegate.swift
//
//  Created by MorganChen on 2025/3/29.
//

import UIKit

public protocol MicBottomToolViewDelegate: AnyObject {
    
    func micBottomToolView(
        didTapLast micBottomToolView: MicBottomToolView
    )
    func micBottomToolView(
        didTapNext micBottomToolView: MicBottomToolView
    )
    func micBottomToolView(
        didTapDone micBottomToolView: MicBottomToolView
    )
    func micBottomToolView(
        didTapReset micBottomToolView: MicBottomToolView
    )
}
