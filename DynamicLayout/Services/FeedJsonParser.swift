//
//  FeedJsonParser.swift
//  DynamicLayout
//
//  Created by Sunil on 06/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation
import UIKit

class FeedJsonParser {
    
    func getFeedsFromJson(_ json: [String: Any]?) -> [FeedScrollModel] {
        guard let feedsJson = json?[JSONKeys.data] as? [[String: Any]]
            else { return [] }
        var feedsArray:[FeedScrollModel] = []
        for data in feedsJson {
            if let contentType = data[JSONKeys.scrollType] as? String {
                switch contentType {
                    
                case FeedScrollType.horizontal.rawValue:
                    let hScrollFeed = HorizontalScrollFeed(json: data)
                    feedsArray.append(hScrollFeed)
                    
                case FeedScrollType.vertical.rawValue:
                    let vScrollFeed = VerticalScrollFeed(json: data)
                    feedsArray.append(vScrollFeed)
                    
                default:
                    break
                }
            }
        }
        return feedsArray
    }
    
    func getItemsFrom(jsonArray: [[String: Any]], forScrollType scrollType: FeedScrollType) -> [FeedItemModel] {
        var feedItems:[FeedItemModel] = []
        for data in jsonArray {
            if let contentType = getContentType(fromString: data[JSONKeys.contentType] as? String ?? ""),
                isValidate(contentType: contentType, for: scrollType){
                switch contentType {
                case .image:
                    let imageFeed = ImageFeed(json: data)
                    feedItems.append(imageFeed)
                case .text:
                    let textFeed = TextFeed(json: data)
                    feedItems.append(textFeed)
                }
            }
        }
        return feedItems
    }
    
    func getContentType(fromString string: String) -> FeedItemType? {
        switch string {
        case FeedItemType.image.rawValue:
            return .image
        case FeedItemType.text.rawValue:
            return .text
        default:
            return nil
        }
    }
    
    func isValidate(contentType:FeedItemType, for scrollType: FeedScrollType ) -> Bool {
        switch scrollType {
        case .horizontal:
            return contentType == .image
        case .vertical:
            return (contentType == .image || contentType == .text)
        }
    }
    
    func getImageViewContentMode(type: String?) -> UIViewContentMode {
        if let viewMode = type {
            switch viewMode {
            case "scaleToFill":
                return .scaleToFill
            case "aspectFit":
                return .scaleAspectFit
            case "aspectFill":
                return .scaleAspectFill
            default:
                return .scaleToFill
            }
        } else {
            return .scaleToFill
        }
    }
    
    func getFontTypeFrom(string: String?) -> FontType {
        if let fontName = string {
            switch fontName {
            case "GreatVibes-Regular":
                return .greatVibes
            case "BeyondWonderland":
                return .beyondWonderland
            default:
                return .defaultFont
            }
        }
        return .defaultFont
    }
    
}
