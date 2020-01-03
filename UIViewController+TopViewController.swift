//
//
//  Created by Pushpank on 12/10/19.
//  Copyright © 2019 Pushpank. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func topMostViewController() -> UIViewController {
        if let navigation = self as? UINavigationController {
            return (navigation.visibleViewController ?? UIViewController()).topMostViewController()
        }
        
        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        
        return self
    }
}

extension UIApplication {
    func topMostViewController() -> UIViewController {
        return keyWindow?.rootViewController?.topMostViewController() ?? UIViewController()
    }
}
