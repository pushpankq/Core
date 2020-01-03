// Set maximum length of textfield

import UIKit

private var maxLengths = [UITextField: Int]()

extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}

extension String {
    func safelyLimitedTo(length len: Int) -> String {
        if self.count <= len {
            return self
        }
        return String( Array(self).prefix(upTo: len) )
    }
}
