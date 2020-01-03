//
//  UIImage+Color.swift
//
//  Created by Pushpank on 12/09/19.
//  Copyright © 2018 Pushpank. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func imageWithColor(color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        
        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
