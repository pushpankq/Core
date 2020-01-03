//
//  UILabelExtension.swift
//
//  Created by Pushpank on 12/10/19.
//  Copyright © 2019 Pushpank. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    static func heightForView(text: String, font: UIFont, width: CGFloat) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
}
