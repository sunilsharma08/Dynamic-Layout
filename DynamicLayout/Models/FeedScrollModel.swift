//
//  FeedScrollModel.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

protocol FeedScrollModel {
    
    var type: FeedScrollType { get }
    var rowCount: Int { get }
    var items: [FeedItemModel] { get set }
    
}

extension FeedScrollModel {
    var rowCount: Int {
        return 1
    }
}
