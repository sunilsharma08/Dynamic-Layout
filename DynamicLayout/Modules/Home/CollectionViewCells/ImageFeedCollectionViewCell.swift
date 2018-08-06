//
//  ImageFeedCollectionViewCell.swift
//  DynamicLayout
//
//  Created by Sunil on 06/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class ImageFeedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var feedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateViewWith(data: FeedItemModel) {
        if let imageFeed = data as? ImageFeed {
            feedImageView.contentMode = imageFeed.contentMode
            print("collection image height = \(imageFeed.height)  width = \(imageFeed.width)")
            feedImageView.sd_setImage(with: URL(string: imageFeed.url),
                                      placeholderImage: nil, options: [.retryFailed],
                                      completed: nil)
        } else {
            feedImageView.image = nil
        }
    }
    
}
