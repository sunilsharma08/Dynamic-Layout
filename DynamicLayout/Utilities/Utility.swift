//
//  Utility.swift
//  DynamicLayout
//
//  Created by Sunil on 05/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import Foundation
import UIKit

func scaleSize(oldWidth: CGFloat, oldHeight: CGFloat, toWidth newWidth: CGFloat) -> CGFloat {
    if oldWidth == 0 {
        return 0
    }
    let scaleFactor = newWidth / oldWidth
    return oldHeight * scaleFactor
}


