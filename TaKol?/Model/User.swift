//
//  User.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class User {
    private var _email: String!
    private var _password: String!
    private var _image: UIImage!
    private var _name: String!
    private var _address: String!
    
    var email: String{
        get{
            return _email
        }set{
            _email = newValue
        }
    }
    
    var password: String{
        get{
            return _password
        }set{
            _password = newValue
        }
    }
    
    var image: UIImage{
        get{
            return _image
        }set{
            _image = newValue
        }
    }
    
    var name: String{
        get{
            return _name
        }set{
            _name = newValue
        }
    }
    
    var address: String{
        get{
            return _address
        }set{
            _address = newValue
        }
    }
    
    init(email: String, password: String, image: UIImage, name: String, address: String) {
        self._email = email
        self.password = password
        self.image = image
        self.name = name
        self.address = address
    }
    
}

