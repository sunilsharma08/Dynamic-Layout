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
    
    private var feedsArray: [TextFeed] = [] {
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
    
    func getFeedsData() -> [TextFeed] {
        return []
    }
    
    func viewDidLoad() {
        
        self.viewController?.setLoadingVisible(true)
        interactor.getFeedsData {[weak self] (status, homeFeeds, error) in
            self?.viewController?.setLoadingVisible(false)
            if status == .success, let feeds = homeFeeds {
                
            } else {
                self?.wireframe.showAlert(with: error?.title ?? "Error", message: error?.message)
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return feedsArray.count
    }
    
    func data(forIndexPath indexPath: IndexPath) -> TextFeed {
        return feedsArray[indexPath.row]
    }
    
}
