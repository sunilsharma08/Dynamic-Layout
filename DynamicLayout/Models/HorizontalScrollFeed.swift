//
//  HorizontalScrollFeed.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation
import UIKit

struct HorizontalScrollFeed: FeedScrollModel {
    
    var type: FeedScrollType {
        return .horizontal
    }
    
    var height: CGFloat
    var width: CGFloat
    var padding: Int
    var items: [FeedItemModel] = []
    var backgroundColor:String = "#fff"
    
    init(json: [String: Any]) {
        
        self.backgroundColor = json[JSONKeys.backGroundColor] as? String ?? "#fff"
        self.padding = json[JSONKeys.padding] as? Int ?? 0
        let height = json[JSONKeys.height] as? CGFloat ?? 0
        self.height = height * ScreenSize.height
        let width = json[JSONKeys.width] as? CGFloat ?? 0
        self.width = width * ScreenSize.width
        if let items = json[JSONKeys.items] as? [[String: Any]] {
            self.items = FeedJsonParser().getItemsFrom(jsonArray: items, forScrollType: .horizontal)
        }
    }
    
}
