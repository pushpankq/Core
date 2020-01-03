//
//  Authentication.swift
//  Spare
//
//  Created by Pushpank on 12/09/19.
//  Copyright © 2019 pushpank. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

extension UIViewController {
    
    func touchIdIntegration() {
        let context = LAContext()
        var error: NSError?
        let reason = " "
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self](success, error) in
                guard let `self` = self, error == nil else { return }
                
                DispatchQueue.main.async {
                    if success {
                        
                        // success

                    } else {
                        // error
                    }
                }
            }
        } else {
            // error message
        }
    }
}
