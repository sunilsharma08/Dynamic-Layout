//
//  HomeFeedModel.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation

protocol HomeFeedModel: Codable {
    
    var type: HomeFeedType { get }
    var rowCount: Int { get }
    var sectionTitle:String? { get set}
    
}

extension HomeFeedModel {
    
    var rowCount: Int {
        return 1
    }
    
}
