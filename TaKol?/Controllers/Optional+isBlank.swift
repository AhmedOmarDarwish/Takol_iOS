//
//  Optional+isBlank.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self == nil || self!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
