//
//  ErrorData.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

struct ErrorData {
    
    var title: String?
    var message: String?
    
    init(title:String? = "Error", message:String?) {
        self.title = title
        self.message = message
    }
    
}
