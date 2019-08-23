//
//  UIButtons.swift
//  TaKol?
//
//  Created by 3Mr on 7/16/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    var roundBorderGreen: UIButton{
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.greenColor.cgColor;
        return self
    }
    
    
}
