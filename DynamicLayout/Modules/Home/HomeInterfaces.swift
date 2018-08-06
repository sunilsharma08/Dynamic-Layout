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
    
    func numberOfSectionsInTableView() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func numberOfItems(inSection section: Int) -> Int
    func data(forIndexPath indexPath: IndexPath) -> FeedScrollModel
    func horizontalScrollCellSize(forIndexPath indexPath: IndexPath) -> CGSize
    func getContentPadding(forType type: FeedScrollType, indexPath: IndexPath) -> Int
    
}

protocol HomeInteractorInterface: InteractorInterface {
    func getFeedsData(completion: ((_ status:ResponseStatus, _ feeds:[FeedScrollModel]?, _ error: ErrorData?) -> Void)?)
}
