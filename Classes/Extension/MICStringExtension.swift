//
//  MICStringExtension.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

extension String {
    
    func localizableFromBundle() -> String {
        if let bundleURL = Bundle.main.url(forResource: "MultiImageCroppingResources", withExtension: "bundle"),
           let resourceBundle = Bundle(url: bundleURL) {
            return NSLocalizedString(self, tableName: nil, bundle: resourceBundle, value: "", comment: "")
        }
        return self
    }
}
