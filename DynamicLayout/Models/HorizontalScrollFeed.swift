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
    
    var title: String?
    var height: CGFloat
    var width: CGFloat
    var padding: Int
    var items: [FeedItemModel] = []
    
    init(json: [String: Any]) {
        self.title = json[JSONKeys.title] as? String
        
        self.padding = json[JSONKeys.padding] as? Int ?? 0
        let height = json[JSONKeys.height] as? CGFloat ?? 0
        self.height = height * ScreenSize.height
        let width = json[JSONKeys.width] as? CGFloat ?? 0
        self.width = width * ScreenSize.width
        if let items = json[JSONKeys.items] as? [[String: Any]] {
            self.items = FeedJsonParser().getItemsFrom(jsonArray: items, forScrollType: .horizontal)
        }
//        updateItemsSize(CGSize(width: self.width, height: self.height))
    }
    
//    private mutating func updateItemsSize(_ size: CGSize) {
//
//        items = items.map { (feed: FeedItemModel) -> FeedItemModel in
//            if var imageFeed = feed as? ImageFeed {
//                imageFeed.width = size.width
//                imageFeed.height = size.height
//                return imageFeed
//            }
//            return feed
//        }
//    }
}
