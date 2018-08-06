//
//  HomeFeedsAdapter.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class HomeFeedsAdapter:NSObject {
    
    fileprivate var presenter: HomePresenterInterface
    
    init(presenter: HomePresenterInterface) {
        self.presenter = presenter
    }
}

extension HomeFeedsAdapter: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSectionsInTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let feedScroll = presenter.data(forIndexPath: indexPath)
        if feedScroll.type == .vertical && feedScroll.items[indexPath.row].type == .image {
            if let imgFeed = feedScroll.items[indexPath.row] as? ImageFeed {
                return imgFeed.height
            }
            return 0
        }
        else if (feedScroll.type == .horizontal) {
            if let hFeedScroll = feedScroll as? HorizontalScrollFeed {
                return ceil(hFeedScroll.height) 
            }
            return 0
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedScroll = presenter.data(forIndexPath: indexPath)
        switch feedScroll.type {
        case .vertical:
            let feed = feedScroll.items[indexPath.row]
            switch feed.type {
            case .text:
                let cell:TextFeedsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
                cell.updateViewsWith(data: feed)
                return cell
            case .image:
                let cell:ImageFeedTableViewCell = tableView.dequeueReusableCell(for: indexPath)
                cell.updateViewWith(data: feed)
                return cell
            }
        case .horizontal:
            let cell: HorizontalScrollTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureViews(forIndexPath: indexPath, presenter: presenter)
            return cell
        }
    }
}

