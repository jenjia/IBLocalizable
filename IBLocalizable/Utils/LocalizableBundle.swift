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
    
    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            if let appLang = UserDefaults.standard.string(forKey: "app_lang"),
                let path = Bundle.main.path(forResource: appLang, ofType: "lproj") {
                bundle = Bundle(path: path)
            }else {
                bundle = Bundle.main
            }
        }
        
        return bundle
    }
    
    public static func setLanguage(lang: String) {
        UserDefaults.standard.set(lang, forKey: "app_lang")
        UserDefaults.standard.synchronize()
        bundle = localizedBundle()
    }
}
