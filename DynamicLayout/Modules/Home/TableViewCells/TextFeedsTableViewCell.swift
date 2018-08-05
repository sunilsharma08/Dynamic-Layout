//
//  TextFeedsTableViewCell.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class TextFeedsTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var textFeedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateViewsWith(data: TextFeed) {
        textFeedLabel.text = data.message
        textFeedLabel.sizeToFit()
    }
    
}
