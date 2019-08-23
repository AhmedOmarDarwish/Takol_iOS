//
//  String+Trimm.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

extension String {
    var trimm: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
