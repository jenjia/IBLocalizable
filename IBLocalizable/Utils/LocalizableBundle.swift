//
//  LocalizableBundle.swift
//  IBLocalizable
//
//  Created by Tiago Pereira on 14/02/2019.
//  Copyright © 2019 Chris Jimenez. All rights reserved.
//

import Foundation

extension Bundle {
    private static var bundle: Bundle!
    private static let APP_LANG_KEY = "app_lang"
    
    public static func localizedBundle() -> Bundle! {
        if let appLang = UserDefaults.standard.string(forKey: APP_LANG_KEY),
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj") {
            bundle = Bundle(path: path)
        } else {
            bundle = Bundle.main
        }
        
        return bundle
    }
    
    public static func setLanguage(lang: String) {
        UserDefaults.standard.set(lang, forKey: APP_LANG_KEY)
        UserDefaults.standard.synchronize()
        bundle = localizedBundle()
    }
}
