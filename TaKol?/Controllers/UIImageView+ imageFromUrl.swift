//
//  UIImageView+ imageFromUrl.swift
//  TaKol?
//
//  Created by 3Mr on 7/25/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(url: url as URL)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.mainQueue()) {
                (response: URLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
