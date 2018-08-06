//
//  ImageFeed.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

struct ImageFeed: FeedItemModel {
    
    var type: FeedItemType {
        return .image
    }
    var url:String
    var contentMode:UIViewContentMode
    var width: CGFloat
    var height: CGFloat
    
    init(json: [String: Any]) {
        self.url = json[JSONKeys.imageUrl] as? String ?? ""
        let contentMode = json[JSONKeys.contentMode] as? String
        self.contentMode = FeedJsonParser().getImageViewContentMode(type:  contentMode)
        
        self.height = json[JSONKeys.height] as? CGFloat ?? 0
        self.width = json[JSONKeys.width] as? CGFloat ?? 0
        
        if let widthPercent = json[JSONKeys.widthPercent] as? CGFloat {
            let width = widthPercent * ScreenSize.width
            
            self.height = scaleSize(oldWidth: CGFloat(self.width), oldHeight: CGFloat(self.height), toWidth: width)
            self.width = width
        } else {
            self.height = scaleSize(oldWidth: CGFloat(self.width), oldHeight: CGFloat(self.height), toWidth: ScreenSize.width)
            self.width = ScreenSize.width
        }
    }
}
