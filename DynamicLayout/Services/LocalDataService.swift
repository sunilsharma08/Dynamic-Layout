//
//  LocalDataService.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

class LocalDataService {
    
    func getFeedsData(completion: ((_ status:ResponseStatus, _ feeds:[HomeFeedModel]?, _ error: ErrorData?) -> Void)?) {
        DispatchQueue.global(qos: .background).async {[weak self] in
            if let url = Bundle.main.url(forResource: "HomeFeeds", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let feedsArray = self?.getFeedsFromJson(jsonResult)
                    DispatchQueue.main.async {
                        completion?(.success, feedsArray, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Error: \(error.localizedDescription)")
                        completion?(.fail, nil, ErrorData(message: error.localizedDescription))
                    }
                }
            }
        }
    }
    
    func getFeedsFromJson(_ json: [String: Any]?) -> [HomeFeedModel] {
        guard let feedsJson = json?["data"] as? [[String: Any]]
            else { return [] }
        var feedsArray:[HomeFeedModel] = []
        for data in feedsJson {
            if let contentType = data["contentType"] as? String {
                switch contentType {
                    
                case HomeFeedType.image.rawValue:
                    if let feed = parseFeed(type: ImageFeed.self, fromJson: data) {
                        feedsArray.append(feed)
                    }
                    
                case HomeFeedType.text.rawValue:
                    if let feed = parseFeed(type: TextFeed.self, fromJson: data) {
                        feedsArray.append(feed)
                    }
                default:
                    break
                }
            }
        }
        return feedsArray
    }
    
    func parseFeed<T: HomeFeedModel>(type: T.Type, fromJson json: [String: Any]) -> HomeFeedModel? {
        let jsonDecoder = JSONDecoder()
        if let jsonData = try?  JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            do {
                return try jsonDecoder.decode(T.self, from: jsonData)
            } catch let error as NSError {
                print("Error while decoding json for \(T.self): \(error.debugDescription)")
                return nil
            }
        }
        return nil
    }
}
