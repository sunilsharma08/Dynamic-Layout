//
//  ImageFeed.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

struct ImageFeed: HomeFeedModel {
    
    var type: HomeFeedType {
        return .image
    }
    
    var sectionTitle: String?
    var url:String?
    var contentMode:String?
    var width: Float
    var height: Float
    
    enum CodingKeys: String, CodingKey {
        case sectionTitle = "title"
        case url
        case contentMode
        case width
        case height
    }
    
}
