//
//  UserdefultsManger.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class UserdefultsManger {
    //Single tone for class
    static let shared = UserdefultsManger()
    let def = UserDefaults.standard
    
    var userData: User? {
        get {
            guard let savedUser = def.object(forKey: UserDefaultsKeys.user) as? Data else {
                return nil
            }
            let decoded = try? (NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedUser) as! User)
            return decoded
            
        } set {
            if let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: newValue!, requiringSecureCoding: false) {
                def.set(encodedData, forKey: UserDefaultsKeys.user)
            }
        }
    }
            
    var isLogedIn: Bool? {
        get {
            guard let loggedin = def.object(forKey: UserDefaultsKeys.isLogedIn) as? Bool else {
                return false
            }
            return loggedin
        } set {
            def.set(newValue, forKey: UserDefaultsKeys.isLogedIn)
            }
                
        }
    
    private init(){}
    func clearUserData() {
        self.isLogedIn = false
        //        def.removeObject(forKey: UserDefaultsKeys.user)
        //        def.synchronize()
    }
    
    
}

