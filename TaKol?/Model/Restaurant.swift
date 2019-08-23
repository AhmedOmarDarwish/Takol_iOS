//
//  Restaurant.swift
//  TaKol?
//
//  Created by 3Mr on 8/1/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    var id: Int
    var name: String
    var r_description: String
    var r_image: URL
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name = "r_name"
        case r_description
        case r_image
    }
    
}

