//
//  Constants.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let FeedsFileName = "HomeFeeds"
    
}

struct JSONKeys {
    
    static let data = "data"
    static let scrollType = "scrollType"
    static let height = "height"
    static let width = "width"
    static let items = "items"
    static let imageUrl = "url"
    static let contentType = "contentType"
    static let contentMode = "contentMode"
    static let widthPercent = "widthPercent"
    static let message = "message"
    static let fontSize = "fontSize"
    static let fontName = "font"
    static let fontColor = "fontColor"
    static let padding = "padding"
    static let backGroundColor = "backGroundColor"
    
}

struct ScreenSize {
    static let height: CGFloat = UIScreen.main.bounds.height
    static let width: CGFloat = UIScreen.main.bounds.width
}

struct AppColors {
    static let primary = UIColor.white
    static let navTextColor = UIColor(hexCode: "#263238")
}
