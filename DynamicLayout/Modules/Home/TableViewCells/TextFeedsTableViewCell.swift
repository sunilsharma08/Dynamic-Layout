//
//  TextFeedsTableViewCell.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class TextFeedsTableViewCell: UITableViewCell {

    @IBOutlet weak var textFeedLabel: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        self.textFeedLabel.preferredMaxLayoutWidth = self.textFeedLabel.frame.width - (textFeedLabel.insets.left + textFeedLabel.insets.right)
    }
    
    func updateViewsWith(data: FeedItemModel) {
        if let textFeed = data as? TextFeed {
            let padding: CGFloat = CGFloat(textFeed.padding)
            textFeedLabel.insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            textFeedLabel.text = textFeed.message
            textFeedLabel.textColor = UIColor(hexCode: textFeed.fontColor)
            textLabel?.backgroundColor = .clear
            contentView.backgroundColor = UIColor(hexCode: textFeed.backGroundColor)
            textFeedLabel.font = UIFont(name: textFeed.fontName.rawValue,
                                        size: CGFloat(textFeed.fontSize))
        } else {
            textFeedLabel.text = nil
        }
        
    }
    
}
