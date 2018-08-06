//
//  VerticalScrollFeed.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

struct VerticalScrollFeed: FeedScrollModel {
    
    var type: FeedScrollType {
        return .vertical
    }
    
    var items: [FeedItemModel] = []
    var rowCount: Int {
        return items.count
    }
    
    init(json: [String: Any]) {
        if let items = json[JSONKeys.items] as? [[String: Any]] {
            self.items = FeedJsonParser().getItemsFrom(jsonArray: items, forScrollType: .vertical)
        }
    }
}
