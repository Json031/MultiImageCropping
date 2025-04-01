//
//  MICStringExtension.swift
//
//  Created by MorganChen on 2025/3/28.
//

import UIKit

public extension String {
    
    func localizableFromBundle() -> String {
        let bundle = Bundle(for: MicMultiImageCroppingViewController.self)
        let bundleUrl = bundle.url(forResource: "MultiImageCroppingResources", withExtension: "bundle")!
        let resourceBundle = Bundle(url: bundleUrl)
        guard let jaUrl = resourceBundle?.url(forResource: String.resourceLanguageType(), withExtension: "lproj") else {
            return self
        }
        guard let langBundle = Bundle(url: jaUrl) else {
            return self
        }
        return NSLocalizedString(self, tableName: nil, bundle: langBundle, value: "", comment: "")
    }
    
    static func resourceLanguageType() -> String {
        var key = "en"
        let preferredLanguage: String = Locale.preferredLanguages.first ?? "en"
        
        if preferredLanguage.hasPrefix("zh") {
            key = "zh-Hans"
        } else if preferredLanguage.hasPrefix("ja") {
            key = "ja"
        } else if preferredLanguage.hasPrefix("fr") {
            key = "fr"
        } else if preferredLanguage.hasPrefix("de") {
            key = "de"
        } else if preferredLanguage.hasPrefix("ru") {
            key = "ru"
        } else if preferredLanguage.hasPrefix("pt") {
            key = "pt-BR"
        } else if preferredLanguage.hasPrefix("pl") {
            key = "pl-PL"
        } else if preferredLanguage.hasPrefix("tr") {
            key = "tr"
        } else {
            key = "en"
        }
        return key
    }
}
