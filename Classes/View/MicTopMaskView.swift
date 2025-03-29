//
//  MicTopMaskView.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

public class MicTopMaskView: UIView {
    private var micConfiguration: MICUIConfiguration
    
    public weak var delegate: MicTopMaskViewDelegate?
    
    ///adImage 广告图
    init(frame: CGRect = .zero, micConfiguration: MICUIConfiguration) {
        self.micConfiguration = micConfiguration
        super.init(frame: frame)
        
        configSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private method
    private func configSubViews() {
        self.backgroundColor = self.micConfiguration.topViewBgColor
        
        let backBtn: UIButton = UIButton(type: .custom)
        backBtn.frame = self.micConfiguration.backBtnFrame
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        backBtn.setImage(self.micConfiguration.backBtnImage, for: .normal)
        backBtn.imageView?.contentMode = .scaleAspectFit
        self.addSubview(backBtn)
    }
    
    // MARK: - button action
    @objc private func back() {
        self.delegate?.topMaskView(didCancel: self)
    }
}
