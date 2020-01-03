//
//  UIImage+Data.swift
//
//  Created by Pushpank on 13/10/19.
//  Copyright © 2018 Pushpank. All rights reserved.
//

import Foundation

class ImageData {
    
    static func imageUrlToData(urlString: String) -> Data {
        
        guard let url = URL(string: urlString) else {return Data()}
        var imageData = Data()
        if let data = try? Data(contentsOf: url) {
            imageData = data
        }
        
        return imageData
    }
    
    static func createLocalURL(urlString: String) -> URL? {
        
        let data = ImageData.imageUrlToData(urlString: urlString)
        let localUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("copy.png")
        do {
            try data.write(to: localUrl)
        } catch let error {
            print("Failed to write to URL")
            print(error)
        }
        return localUrl
    }
}
