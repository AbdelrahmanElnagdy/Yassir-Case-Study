//
//  LocalizationManager.swift
//  Yassir Case Study
//
//  Created by Abdelrahman Elnagdy on 23/06/2022.
//

import Foundation
import UIKit

enum Languages: String {
    case ar = "ar"
    case en = "en"

}

final class LocalizationManager {
    private static var privateShared : LocalizationManager?
    let languageKey = "languageKey"
    
    class func shared() -> LocalizationManager {
        guard let uwShared = privateShared else {
            privateShared = LocalizationManager()
            return privateShared!
        }
        return uwShared
    }
    
    
    private init() {}
    
    func changeLangauge(to language: Languages) {
        UserDefaults.standard.set(language.rawValue, forKey: languageKey)

        let semanticAttribue: UISemanticContentAttribute
        if LocalizationManager.shared().currentLanguage() == .en {
            semanticAttribue = .forceLeftToRight
        } else {
            semanticAttribue = .forceRightToLeft
        }
        
        UIView.appearance().semanticContentAttribute = semanticAttribue
        UIPageControl.appearance().semanticContentAttribute = semanticAttribue
        UILabel.appearance().semanticContentAttribute = semanticAttribue
        UIButton.appearance().semanticContentAttribute = semanticAttribue
        UIImageView.appearance().semanticContentAttribute = semanticAttribue
        UITableView.appearance().semanticContentAttribute = semanticAttribue
        UICollectionView.appearance().semanticContentAttribute = semanticAttribue
        UINavigationBar.appearance().semanticContentAttribute = semanticAttribue
        UITabBar.appearance().semanticContentAttribute = semanticAttribue
        UISearchBar.appearance().semanticContentAttribute = semanticAttribue
        UINavigationBar.appearance().semanticContentAttribute = semanticAttribue
    }
    
    func currentLanguage() -> Languages {
        return Languages(rawValue: UserDefaults.standard.string(forKey: languageKey) ?? "en")!
    }
    
    class func destroy() {
        privateShared = nil
    }
}

extension String {
    var localized: String {
        if LocalizationManager.shared().currentLanguage() == .ar {
            return Localize.ar_bundle.localizedString(forKey: self , value: nil, table: nil)
        } else {
            return Localize.en_bundle.localizedString(forKey: self , value: nil, table: nil)}}
}

class Localize {
    static let en_Path = Bundle.main.path(forResource: "en", ofType: "lproj")
    static let ar_Path = Bundle.main.path(forResource: "ar", ofType: "lproj")
    static let en_bundle = Bundle.init(path:en_Path!)! as Bundle
    static let ar_bundle = Bundle.init(path:ar_Path!)! as Bundle
}

public extension UILabel {

    @IBInspectable var localizedText: String? {
        get {
            return text
        }
        set {
            text = NSLocalizedString(newValue ?? "", comment: "")
        }
    }
}

public extension UIButton {

    @IBInspectable var localizedTitle: String? {
        get {
            return titleLabel?.text
        }
        set {
            setTitle(NSLocalizedString(newValue ?? "", comment: ""), for: .normal)
        }
    }
}
