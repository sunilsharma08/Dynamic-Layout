//
//  HomeInterfaces.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//
import UIKit

protocol HomeWireframeInterface: WireframeInterface {
    
}

protocol HomeViewInterface: ViewInterface {
    func reloadTableViewData()
    func setLoadingVisible(_ visible: Bool)
}

protocol HomePresenterInterface: PresenterInterface {
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func data(forIndexPath indexPath: IndexPath) -> TextFeed
    
    func getFeedsData() -> [TextFeed]
}

protocol HomeInteractorInterface: InteractorInterface {
    func getFeedsData(completion: ((_ status:ResponseStatus, _ feeds:[HomeFeedModel]?, _ error: ErrorData?) -> Void)?)
}
