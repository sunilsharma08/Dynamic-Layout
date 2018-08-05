//
//  ImageFeedTableViewCell.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class ImageFeedTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var feedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateViewWith(data: HomeFeedModel) {
        
    }
    
}
