//
//  CustomLabel.swift
//  DynamicLayout
//
//  Created by Sunil on 06/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    open var insets : UIEdgeInsets = .zero {
        didSet {
            super.invalidateIntrinsicContentSize()
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
    
}
