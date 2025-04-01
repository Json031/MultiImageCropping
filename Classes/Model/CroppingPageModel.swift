//
//  CroppingPageModel.swift
//
//  Created by MorganChen on 2025/4/1.
//

public class CroppingPageModel: NSObject {
    //cropping image page
    var photoEditorVC: PhotoEditorViewController
    //page number
    var page: Int
    
    /// init a CroppingPageModel
    /// - Parameters:
    ///   - photoEditorVC: cropping image page
    ///   - page: page number
    init(photoEditorVC: PhotoEditorViewController, page: Int) {
        self.photoEditorVC = photoEditorVC
        self.page = page
    }
    
    
    /// Reset cropping state
    func resetCroppingState() {
        photoEditorVC.cropConfirmView.resetButton.isEnabled = false
        photoEditorVC.imageView.reset(true)
        photoEditorVC.cropToolView.reset(animated: true)
    }
}
