//
//  User.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    private var _email: String!
    private var _password: String!
    private var _image: UIImage!
    private var _name: String!
    private var _address: [String]!
    
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
    
    var address: [String]{
        get{
            return _address
        }set{
            _address = newValue
        }
    }
    
    init(email: String, password: String, image: UIImage, name: String, address: [String]) {
        super.init()
        self.email = email
        self.password = password
        self.image = image
        self.name = name
        self.address = address
        
    }
    // Required NSCoding Protocol
    required convenience init?(coder aDecoder: NSCoder) {
        guard let email = aDecoder.decodeObject(forKey: UserDefaultsKeys.email) as? String,
              let password = aDecoder.decodeObject(forKey: UserDefaultsKeys.password) as? String,
              let image = aDecoder.decodeObject(forKey: UserDefaultsKeys.image) as? UIImage,
              let name = aDecoder.decodeObject(forKey: UserDefaultsKeys.name) as? String,
              let address = aDecoder.decodeObject(forKey: UserDefaultsKeys.address) as? [String] else {
            return nil
        }
        self.init(email: email, password: password, image: image, name: name, address: address)
    }
    
    
    // Required NSCoding Protocal
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.email, forKey: UserDefaultsKeys.email)
        aCoder.encode(self.password, forKey: UserDefaultsKeys.password)
        aCoder.encode(self.image, forKey: UserDefaultsKeys.image)
        aCoder.encode(self.name, forKey: UserDefaultsKeys.name)
        aCoder.encode(self.address, forKey: UserDefaultsKeys.address)
    }
    
    
}

