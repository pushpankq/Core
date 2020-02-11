//
//  Extensions.swift
//  Instagram
//
//  Created by Pushpank Kumar on 18/05/19.
//  Copyright © 2019 Pushpank Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil, 
                bottom: NSLayoutYAxisAnchor? = nil, 
                right: NSLayoutXAxisAnchor? = nil, 
                paddingTop: CGFloat, 
                paddingLeft: CGFloat, 
                paddingBottom: CGFloat, 
                paddingRight: CGFloat, 
                width: CGFloat = 0, 
                height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
