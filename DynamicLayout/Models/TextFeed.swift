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
    var fontColor: String = "#000"
    var backGroundColor: String = "#fff"
    var padding: Int
    
    init(json: [String: Any]) {
        self.message = json[JSONKeys.message] as? String ?? ""
        self.padding = json[JSONKeys.padding] as? Int ?? 8
        self.fontSize = json[JSONKeys.fontSize] as? Int ?? 16
        let fontName = json[JSONKeys.fontName] as? String
        self.fontName = FeedJsonParser().getFontTypeFrom(string: fontName)
        self.fontColor = json[JSONKeys.fontColor] as? String ?? "#000"
        self.backGroundColor = json[JSONKeys.backGroundColor] as? String ?? "#fff"
    }
}
