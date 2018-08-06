//
//  TextFeed.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

struct TextFeed: FeedItemModel {
    
    var type: FeedItemType {
        return .text
    }
    
    var message: String?
    var fontName: FontType = .defaultFont
    var fontSize: Int = 16
    var fontColor: String = "#fff"
    
    init(json: [String: Any]) {
        self.message = json[JSONKeys.message] as? String ?? ""
        self.fontSize = json[JSONKeys.fontSize] as? Int ?? 16
        let fontName = json[JSONKeys.fontName] as? String
        self.fontName = FeedJsonParser().getFontTypeFrom(string: fontName)
        self.fontColor = json[JSONKeys.fontColor] as? String ?? "#fff"
    }
}
