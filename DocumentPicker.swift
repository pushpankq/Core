//
//  UIViewController+DocumentPicker.swift
//  BuildBoard
//
//  Created by Pushpank on 12/10/19.
//  Copyright © 2019 Pushpank. All rights reserved.
//

import Foundation
import UIKit

class DocumentPicker: NSObject {
    
    static var shared = DocumentPicker()
    var completion:((_ data: Data?) -> Void)?
    
    func showDocumet(_ controller: UIViewController, _ completion: @escaping(Data?) -> Void) {
        self.completion = completion
        if #available(iOS 11.0, *) {
            UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).tintColor = nil
        }
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.data"], in: .import)
        documentPicker.delegate = self
        controller.present(documentPicker, animated: true, completion: nil)
    }
}

extension DocumentPicker: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if controller.documentPickerMode == .import {
            let coordinator = NSFileCoordinator()
            coordinator.coordinate(readingItemAt: urls.first!, options: NSFileCoordinator.ReadingOptions(rawValue: 0), error: nil, byAccessor: { (url) in
                self.getData(url)
            })
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: {
            self.completion?(nil)
        })
    }
    
    func getData(_ url: URL) {
        do {
            let data = try Data(contentsOf: url)
            completion?(data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
