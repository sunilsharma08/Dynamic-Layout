//
//  HorizontalScrollTableViewCell.swift
//  DynamicLayout
//
//  Created by Sunil on 06/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class HorizontalScrollTableViewCell: UITableViewCell {

    @IBOutlet weak var hScrollCollectionView: UICollectionView!
    
    var homePresenter: HomePresenterInterface?
    var hScrollAdapter: HorizontalScrollAdapter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureViews(forIndexPath indexPath: IndexPath, presenter: HomePresenterInterface) {
        homePresenter = presenter
        hScrollCollectionView.register(ofType: ImageFeedCollectionViewCell.self)
        hScrollAdapter = HorizontalScrollAdapter(indexPath: indexPath, presenter: presenter)
        hScrollCollectionView.dataSource = hScrollAdapter
        hScrollCollectionView.delegate = hScrollAdapter
        
    }
    
}
