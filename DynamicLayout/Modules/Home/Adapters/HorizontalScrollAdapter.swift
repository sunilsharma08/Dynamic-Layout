//
//  HorizontalScrollAdapter.swift
//  DynamicLayout
//
//  Created by Sunil on 06/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class HorizontalScrollAdapter: NSObject {

    fileprivate var presenter: HomePresenterInterface
    fileprivate var parentIndexPath:IndexPath
    let cellEdgeInsets:UIEdgeInsets
    let minimumLineSpacingForSection:CGFloat
    
    init(indexPath: IndexPath, presenter: HomePresenterInterface) {
        self.presenter = presenter
        self.parentIndexPath = indexPath
        let contentPadding = CGFloat(presenter.getContentPadding(forType: .horizontal, indexPath: indexPath))
        cellEdgeInsets = UIEdgeInsets(top: contentPadding, left: contentPadding, bottom: contentPadding, right: contentPadding)
        minimumLineSpacingForSection = contentPadding
    }
    
}

extension HorizontalScrollAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = presenter.horizontalScrollCellSize(forIndexPath: parentIndexPath)
        cellSize.height -= (cellEdgeInsets.top + cellEdgeInsets.bottom)
        cellSize.width -= (cellEdgeInsets.left + cellEdgeInsets.right)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacingForSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return cellEdgeInsets
    }
    
}

extension HorizontalScrollAdapter: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedScroll = presenter.data(forIndexPath: parentIndexPath)
        switch feedScroll.type {
        case .horizontal:
            let feed = feedScroll.items[indexPath.row]
            switch feed.type {
            case .image:
                let cell: ImageFeedCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.updateViewWith(data: feed)
                return cell
            default:
                return UICollectionViewCell()
            }
        default:
            return UICollectionViewCell()
        }
    }
    
}
