//
//  HomePresenter.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//
import UIKit

class HomePresenter {

    fileprivate weak var viewController: HomeViewInterface?
    fileprivate var interactor: HomeInteractorInterface
    fileprivate var wireframe: HomeWireframeInterface
    
    fileprivate var feedsLayoutArray: [FeedScrollModel] = [] {
        didSet {
            viewController?.reloadTableViewData()
        }
    }
    
    init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface) {
        self.viewController = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension HomePresenter: HomePresenterInterface {
    
    func viewDidLoad() {
        
        self.viewController?.setLoadingVisible(true)
        interactor.getFeedsData {[weak self] (status, homeFeeds, error) in
            self?.viewController?.setLoadingVisible(false)
            if status == .success, let feeds = homeFeeds {
                self?.feedsLayoutArray = feeds
            } else {
                self?.wireframe.showAlert(with: error?.title ?? "Error", message: error?.message)
            }
        }
    }
    
    func numberOfSectionsInTableView() -> Int {
        return feedsLayoutArray.count
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return feedsLayoutArray[section].rowCount
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return feedsLayoutArray[section].items.count
    }
    
    func data(forIndexPath indexPath: IndexPath) -> FeedScrollModel {
        return feedsLayoutArray[indexPath.section]
    }
    
    func horizontalScrollCellSize(forIndexPath indexPath: IndexPath) -> CGSize {
        if let feed = feedsLayoutArray[indexPath.section] as? HorizontalScrollFeed {
            return CGSize(width: feed.width, height: feed.height)
        }
        return .zero
    }
    
    func getContentPadding(forType type: FeedScrollType, indexPath: IndexPath) -> Int {
        if type == .horizontal {
            if let horizontalScroll = feedsLayoutArray[indexPath.section] as? HorizontalScrollFeed {
                return horizontalScroll.padding
            }
        }
        return 0
    }
    
}
