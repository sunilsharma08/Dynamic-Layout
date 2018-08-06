//
//  ImageFeedTableViewCell.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit
import SDWebImage

class ImageFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageHHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateViewWith(data: FeedItemModel) {
        if let imageFeed = data as? ImageFeed {
            feedImageView.frame.origin = .zero
            feedImageView.frame.size.width = CGFloat(imageFeed.width)
            feedImageView.frame.size.height = CGFloat(imageFeed.height)
            feedImageView.center = self.contentView.center
            feedImageView.contentMode = imageFeed.contentMode
            print("image height = \(imageFeed.height)  width = \(imageFeed.width)")
            feedImageView.sd_setImage(with: URL(string: imageFeed.url),
                                      placeholderImage: nil, options: [.retryFailed],
                                      completed: nil)
        } else {
            feedImageView.image = nil
            feedImageView.frame.size = .zero
        }
    }
    
}
