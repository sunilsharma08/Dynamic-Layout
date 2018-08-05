//
//  TextFeed.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

struct TextFeed: HomeFeedModel {
    
    var type: HomeFeedType {
        return .text
    }
    
    var sectionTitle: String?
    var title:String?
    var message: String?
    var fontName: String = "System"
    var fontSize: Int = 15
    var fontColor: String = "#fff"
    
    enum CodingKeys: String, CodingKey {
        case sectionTitle = "title"
        case message
        case fontName = "font"
        case fontSize
        case fontColor
    }
}
