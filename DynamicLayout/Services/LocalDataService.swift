//
//  LocalDataService.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

class LocalDataService {
    
    func getFeedsData(completion: ((_ status:ResponseStatus, _ feeds:[FeedScrollModel]?, _ error: ErrorData?) -> Void)?) {
        DispatchQueue.global(qos: .background).async { 
            if let url = Bundle.main.url(forResource: Constants.FeedsFileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let feedsArray = FeedJsonParser().getFeedsFromJson(jsonResult)
                    DispatchQueue.main.async {
                        completion?(.success, feedsArray, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Error: \(error.localizedDescription)")
                        completion?(.fail, nil, ErrorData(message: error.localizedDescription))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion?(.fail, nil, ErrorData(message: "Data file does not exist!"))
                }
            }
        }
    }
}
