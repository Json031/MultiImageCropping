//
//  MicMultiImageCroppingViewController+Delegate.swift
//
//  Created by MorganChen on 2025/3/28.
//

extension MicMultiImageCroppingViewController: MicTopMaskViewDelegate {
    public func topMaskView(didCancel topMaskView: MicTopMaskView) {
        back()
    }
}

extension MicMultiImageCroppingViewController: MicBottomToolViewDelegate {
    public func micBottomToolView(didTapNext micBottomToolView: MicBottomToolView) {
        nextPageAction()
    }
    public func micBottomToolView(didTapLast micBottomToolView: MicBottomToolView) {
        lastPageAction()
    }
    public func micBottomToolView(didTapDone micBottomToolView: MicBottomToolView) {
        commitAction()
    }
    public func micBottomToolView(didTapReset micBottomToolView: MicBottomToolView) {
        resetAction()
    }
}
