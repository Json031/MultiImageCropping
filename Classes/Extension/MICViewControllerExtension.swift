//
//  MICViewControllerExtension.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

extension UIViewController {
    
    // MARK: - 层级
    /// A helper function to add child view controller.
    func add(childViewController: UIViewController) {
       childViewController.willMove(toParent: self)
       self.addChild(childViewController)
       self.view.addSubview(childViewController.view)
       childViewController.didMove(toParent: self)
    }
    
    /// A helper function to move child view controller to front.
    func moveChildToFront(childViewController: UIViewController) {
       self.view.bringSubviewToFront(childViewController.view)
    }
}
