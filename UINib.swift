import Foundation
import UIKit

extension UINib {

    static func instantiateWithOwner<T>(_ owner: AnyObject?) -> T {
        let mainBundle: Bundle = Bundle.main
        let nibName = String(describing: T.self).components(separatedBy: ".").last
        let viewArray: Array = mainBundle.loadNibNamed(nibName!,
                                                      owner: owner, options: nil)!
        guard let tInfo = viewArray.first as? T else {
            fatalError("Unable to instantiate view")
        }
        return tInfo
    }

    convenience init(nibName name: String) {
        self.init(nibName: name, bundle: nil)
    }
}
