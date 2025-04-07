//
//  MicBottomToolView.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

public class MicBottomToolView: UIView {
    private var micConfiguration: MICUIConfiguration
    
    public weak var delegate: MicBottomToolViewDelegate?
    
    private var pageLab: UILabel = UILabel()
    private var lastPageBtn: UIButton = UIButton()
    private var nextPageBtn: UIButton = UIButton()
    private var commitBtn: UIButton = UIButton()
    
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
        self.backgroundColor = self.micConfiguration.toolViewBgColor
        
        let resetBtn_w: CGFloat = 82
        let resetBtn_h: CGFloat = 33
        let resetBtn_x: CGFloat = micScreenWidth - resetBtn_w - 16.0
        let resetBtn: UIButton = UIButton(frame: CGRect(x: resetBtn_x, y: 16, width: resetBtn_w, height: resetBtn_h))
        resetBtn.setTitle(self.micConfiguration.resetTitle, for: .normal)
        resetBtn.setTitleColor(self.micConfiguration.resetColor, for: .normal)
        resetBtn.titleLabel?.font = self.micConfiguration.resetFont
        resetBtn.layer.borderWidth = self.micConfiguration.resetBorderWidth
        resetBtn.layer.borderColor = self.micConfiguration.resetColor.cgColor
        resetBtn.layer.cornerRadius = resetBtn_h / 2
        resetBtn.backgroundColor = self.micConfiguration.resetBgColor
        resetBtn.setTitleColor(self.micConfiguration.resetTitleColor, for: .normal)
        resetBtn.addTarget(self, action: #selector(resetBtnAction(sender:)), for: .touchUpInside)
        resetBtn.isHidden = self.micConfiguration.hideResetButton
        self.addSubview(resetBtn)
        
        let lastPageBtn_y: CGFloat = 40
        let lastPageBtn_x: CGFloat = 16
        let lastPageBtn_w: CGFloat = 45
        self.lastPageBtn = UIButton(frame: CGRect(x: lastPageBtn_x, y: lastPageBtn_y, width: lastPageBtn_w, height: lastPageBtn_w))
        self.lastPageBtn.setImage(self.micConfiguration.lastPageBtnImage, for: .normal)
        self.lastPageBtn.imageView?.contentMode = .scaleAspectFit
        self.lastPageBtn.titleLabel?.font = self.micConfiguration.lastPageBtnFont
        self.lastPageBtn.setTitleColor(self.micConfiguration.lastPageBtnFontColor, for: .normal)
        self.lastPageBtn.addTarget(self, action: #selector(lastPageBtnAction(sender:)), for: .touchUpInside)
        self.addSubview(self.lastPageBtn)
        
        let pageLab_x: CGFloat = lastPageBtn_x + lastPageBtn_w + 32
        let pageLab: UILabel = UILabel(frame: CGRect(x: pageLab_x, y: lastPageBtn_y, width: lastPageBtn_w, height: lastPageBtn_w))
        pageLab.textColor = self.micConfiguration.pageTitleColor
        pageLab.textAlignment = .center
        pageLab.font = .init(name: "Helvetica Neue", size: self.micConfiguration.pageFontSize)
        self.addSubview(pageLab)
        self.pageLab = pageLab
        pageLab.makeAttriText(string: pageLab.text ?? "", shadowBlurRadius: 2, shadowOffset: CGSize(width: 0, height: 1), shadowColor: UIColor.init(white: 0.0, alpha: 0.3))
        
        self.nextPageBtn = UIButton(frame: CGRect(x: pageLab_x + lastPageBtn_w + 32.0, y: lastPageBtn_y, width: lastPageBtn_w, height: lastPageBtn_w))
        self.nextPageBtn.setImage(self.micConfiguration.nextPageBtnImage, for: .normal)
        self.nextPageBtn.imageView?.contentMode = .scaleAspectFit
        self.nextPageBtn.titleLabel?.font = self.micConfiguration.nextPageBtnFont
        self.nextPageBtn.setTitleColor(self.micConfiguration.nextPageBtnFontColor, for: .normal)
        self.nextPageBtn.addTarget(self, action: #selector(nextPageBtnAction(sender:)), for: .touchUpInside)
        self.addSubview(self.nextPageBtn)
        
        var commitBtn_y: CGFloat = 16 + resetBtn_h + 16
        if self.micConfiguration.hideResetButton {
            commitBtn_y = lastPageBtn_y + lastPageBtn_w / 2 - resetBtn_h / 2
        }
        self.commitBtn = UIButton(frame: CGRect(x: resetBtn_x, y: commitBtn_y, width: resetBtn_w, height: resetBtn_h))
        self.commitBtn.setTitle(self.micConfiguration.commitTitle, for: .normal)
        self.commitBtn.setTitleColor(self.micConfiguration.commitFontColor, for: .normal)
        self.commitBtn.setBackgroundImage(UIImage.colorImage(color: self.micConfiguration.commitBgColor, width: resetBtn_w, height: resetBtn_h), for: .normal)
        self.commitBtn.setTitleColor(.white, for: .normal)
        self.commitBtn.titleLabel?.font = self.micConfiguration.commitTitleFont
        self.commitBtn.addTarget(self, action: #selector(commitBtnAction(sender:)), for: .touchUpInside)
        self.commitBtn.layer.cornerRadius = resetBtn_h / 2
        self.commitBtn.clipsToBounds = true
        self.addSubview(self.commitBtn)
    }
    
    public func setPageTitle(title: String) {
        pageLab.text = title
    }
    
    /// Set lastbtn unavailable when on the first page
    /// - Parameter isEnabled: isEnabled
    public func isLastEnable(isEnabled: Bool = true) {
        self.lastPageBtn.isEnabled = isEnabled
    }
    
    /// Set nextbtn unavailable when on the first page
    /// - Parameter isEnabled: isEnabled
    public func isNextEnable(isEnabled: Bool = true) {
        self.nextPageBtn.isEnabled = isEnabled
    }
    
    public func setLastButtonImage(image: UIImage?) {
        self.lastPageBtn.setImage(image, for: .normal)
    }
    
    public func setNextButtonImage(image: UIImage?) {
        self.nextPageBtn.setImage(image, for: .normal)
    }
    
    public func isCommitEnable(isEnabled: Bool = true) {
        self.commitBtn.isEnabled = isEnabled
    }
    
    // MARK: - button action
    @objc private func nextPageBtnAction(sender: UIButton) {
        self.delegate?.micBottomToolView(didTapNext: self)
    }
    @objc private func lastPageBtnAction(sender: UIButton) {
        self.delegate?.micBottomToolView(didTapLast: self)
    }
    @objc private func commitBtnAction(sender: UIButton) {
        self.delegate?.micBottomToolView(didTapDone: self)
    }
    @objc private func resetBtnAction(sender: UIButton) {
        self.delegate?.micBottomToolView(didTapReset: self)
    }
}
