//
//  JsonData.swift
//
//  Created by Pushpank on 12/10/19.
//  Copyright © 2018 Pushpank. All rights reserved.
//

import Foundation
import SwiftyJSON

open class JSONData {
    
    /// load a json file
    /// - Parameter fileName: json file name
    open class func load(from fileName: String) -> JSON? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"), let data = NSData(contentsOf: url) {
            do {
                return try JSON(data: data as Data)
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        
        return nil
    }
}
