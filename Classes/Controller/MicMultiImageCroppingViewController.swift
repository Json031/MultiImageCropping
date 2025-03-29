//
//  MicMultiImageCroppingViewController.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

public class MicMultiImageCroppingViewController: UIViewController {
    private var topView: MicTopMaskView?
    private var toolView: MicBottomToolView?
    
    private var photoEditorVCs: [PhotoEditorViewController] = [PhotoEditorViewController]()
    // Calculate the x and y coordinates of the view to center it
    private let capRectWidth = micScreenWidth - 32
    private let capRectHeight = (micScreenWidth - 32) * 3 / 4
    private var capRectX: CGFloat {
        get {
            return (micScreenWidth - self.capRectWidth) / 2
        }
    }
    private var capRectY: CGFloat {
        get {
            return (self.collectionViewItemH - self.capRectHeight) / 2 + self.collectionViewY
        }
    }
    private var collectionViewItemH: CGFloat {
        get {
            return micScreenHeight - micNavigationBarHeight - micHomeIndicator_Height() - self.toolView_h
        }
    }
    private let collectionViewY: CGFloat = micNavigationBarHeight
    
    
    //页控制器（小圆点）Page controller (small dots)
    private var cpage: Int = 1 {
        didSet {
            self.toolView?.setPageTitle(title: "\(self.cpage)/\(self.originalImgs.count)")
        }
    }
    
    private var originalImgs: [UIImage] = [UIImage]()
    private var cropImgs: [UIImage] = [UIImage]()
    private var doneBlock: ((_ imgs: [UIImage]) -> Void)? = nil
    private let toolView_h: CGFloat = 109
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var micConfiguration: MICUIConfiguration = MICUIConfiguration()
    private var micCropConfiguration: MICCropConfiguration = MICCropConfiguration()
    
    public weak var delegate: MicMultiImageCroppingControllerDelegate?
    
    public convenience init(originalImgs: [UIImage], micConfiguration: MICUIConfiguration? = nil, micCropConfiguration: MICCropConfiguration? = nil, doneBlock: ((_ imgs: [UIImage]) -> Void)? = nil) {
        self.init()
        self.originalImgs = originalImgs
        if micConfiguration != nil {
            self.micConfiguration = micConfiguration!
        }
        if micCropConfiguration != nil {
            self.micCropConfiguration = micCropConfiguration!
        }
        self.doneBlock = doneBlock
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        cropImages()
        configView()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
     
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - private method
    private func cropImages() {
        for originalImg in self.originalImgs {
            if let croppedImage = originalImg.croppedToAspectRatio(aspectRatioType: self.micCropConfiguration.aspectRatioType) {
                self.cropImgs.append(croppedImage)
            } else {
                self.cropImgs.append(originalImg)
            }
        }
    }
    private func configView() {
        let topView: MicTopMaskView = MicTopMaskView(frame: CGRect(x: 0, y: 0, width: micScreenWidth, height: micNavigationBarHeight), micConfiguration: self.micConfiguration)
        topView.delegate = self
        self.view.addSubview(topView)
        self.topView = topView
        
        let toolView_H: CGFloat = micHomeIndicator_Height() + self.toolView_h
        let toolView: MicBottomToolView = MicBottomToolView(frame: CGRect(x: 0, y: micScreenHeight - toolView_H, width: micScreenWidth, height: toolView_H), micConfiguration: self.micConfiguration)
        toolView.delegate = self
        self.view.addSubview(toolView)
        self.toolView = toolView
        self.cpage = 1
        
        if self.originalImgs.count > 0 {
            editImageAtPage()
        }
    }
    
    private func editImageAtPage() {
        //Prevent index overflow防止索引溢出
        if self.cpage < 1 {
            self.cpage = 1
        }
        if self.cpage > self.originalImgs.count {
            self.cpage = self.originalImgs.count
        }
        //Find if there is already a cropped page寻找是否已有裁剪页
        for vc in self.photoEditorVCs where vc.view.tag == self.cpage {
            self.moveChildToFront(childViewController: vc)
            if self.toolView != nil {
                self.view.bringSubviewToFront(self.toolView!)
            }
            if self.topView != nil {
                self.view.bringSubviewToFront(self.topView!)
            }
            return
        }
        
        //Initialize a new next page crop page初始化新的下一页裁剪页
        let photoEditor: PhotoEditorConfiguration = .init()
        photoEditor.state = .cropping
        
        var cropping: EditorCropSizeConfiguration = .init()
        cropping.aspectRatioType = self.micCropConfiguration.aspectRatioType
        cropping.fixedRatio = self.micCropConfiguration.fixedRatio
        cropping.isRoundCrop = self.micCropConfiguration.isRoundCrop
        cropping.maskType = self.micCropConfiguration.maskType
        cropping.corpBorderColor = self.micConfiguration.corpBorderColor
        photoEditor.fixedCropState = true
        
        photoEditor.cropping = cropping
                    
        let photoEditorVC: PhotoEditorViewController = PhotoEditorViewController(image: self.originalImgs[self.cpage - 1], config: photoEditor)
        photoEditorVC.view.tag = self.cpage
        self.add(childViewController: photoEditorVC)
        self.photoEditorVCs.append(photoEditorVC)
        if self.toolView != nil {
            self.view.bringSubviewToFront(self.toolView!)
        }
        if self.topView != nil {
            self.view.bringSubviewToFront(self.topView!)
        }
    }
    
    // MARK: - button action
    public func nextPageAction() {
        //判断是否已是最后一页
        if self.cpage == self.originalImgs.count {
            return
        }
        //寻找是否已有裁剪页
        for vc in self.photoEditorVCs where vc.view.tag == self.cpage {
            vc.imageView.cropping { result in
                if result != nil {
                    if let image = UIImage(contentsOfFile: result!.editedImageURL.path) {
                        if self.cropImgs.count > self.cpage - 1 {
                            self.cropImgs.remove(at: self.cpage - 1)
                            self.cropImgs.insert(image, at: self.cpage - 1)
                        }
                    }
                }
                self.switchToNextPage()
            }
        }
    }
    public func lastPageAction() {
        //寻找是否已有裁剪页
        for vc in self.photoEditorVCs where vc.view.tag == self.cpage {
            vc.imageView.cropping { result in
                if result != nil {
                    if let image = UIImage(contentsOfFile: result!.editedImageURL.path) {
                        if self.cropImgs.count > self.cpage - 1 {
                            self.cropImgs.remove(at: self.cpage - 1)
                            self.cropImgs.insert(image, at: self.cpage - 1)
                        }
                    }
                }
                self.switchToLastPage()
            }
        }
    }
    public func commitAction() {
        //可能当前裁剪页有拖动缩放，点击完成按钮回调到上一页之前需要再裁剪一下
        //Perhaps the current cropped page has dragging and scaling, and clicking the finish button will bring it back to the previous page before it needs to be cropped again
        for vc in self.photoEditorVCs where vc.view.tag == self.cpage {
            vc.imageView.cropping { result in
                if result != nil {
                    if let image = UIImage(contentsOfFile: result!.editedImageURL.path) {
                        if self.cropImgs.count > self.cpage - 1 {
                            self.cropImgs.remove(at: self.cpage - 1)
                            self.cropImgs.insert(image, at: self.cpage - 1)
                        }
                    }
                }
                self.doneBlock?(self.cropImgs)
                self.delegate?.micController(self, didFinishSelection: self.cropImgs)
                if self.micCropConfiguration.autoBack {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    public func resetAction() {
        for vc in self.photoEditorVCs where vc.view.tag == self.cpage {
            vc.cropConfirmView.resetButton.isEnabled = false
            vc.imageView.reset(true)
            vc.cropToolView.reset(animated: true)
            break
        }
    }
    
    // 滚动到下一个 cell 的方法
    // Method to scroll to the next cell
    @objc private func switchToNextPage() {
        //判断是否已是最后一页
        if self.cpage == self.originalImgs.count {
            return
        }
        delegate?.micController(self, nextPage: self.cpage)
        self.cpage += 1
        editImageAtPage()
    }
    
    // 滚动到上一个 cell 的方法
    // Method to scroll to the previous cell
    @objc private func switchToLastPage() {
        //判断是否已是最前一页
        if self.cpage == 1 {
            return
        }
        delegate?.micController(self, lastPage: self.cpage)
        self.cpage -= 1
        editImageAtPage()
    }
    
    @objc func back() {
        delegate?.micController(didCancel: self)
        if self.micCropConfiguration.autoBack {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
