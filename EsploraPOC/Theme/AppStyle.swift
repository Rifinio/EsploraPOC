//
//  AppStyle.swift
//  EsploraPOC
//
//  Created by Adil Bougamza on 27/08/2020.
//  Copyright © 2020 Adil Bougamza. All rights reserved.
//

import UIKit

struct AppStyle {
    struct Color {
        static let primary: UIColor = UIColor(red: 18/255.0, green: 20/255.0, blue: 22/255.0, alpha: 1.0) // could use an extension for Hex colors.
        static let accent: UIColor = UIColor(red: 0/255.0, green: 193/255.0, blue: 250/255.0, alpha: 1.0)
        static let white: UIColor = .white // could be a variation of white.
    }
    
    struct Font {
        static let largeTitle: UIFont = UIFont.systemFont(ofSize: 23)
        static let defaultTitle: UIFont = UIFont.systemFont(ofSize: 18)
    }
}
