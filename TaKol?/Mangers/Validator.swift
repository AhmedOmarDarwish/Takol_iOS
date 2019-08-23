//
//  Validator.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class Validator {
    //Singletone for class
    static let shared = Validator()
    private init() {}
    
    //Func to test valid email
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //Func to test valid password
    func isValidPassword(_ password: String) -> Bool {
        return password.count == 8
//        let passwordRegEx = "([(0-9)(A-Z)(!@#$%ˆ&*+-=<>)]+)([a-z]*){6,8}"
//        //        let passwordRegEx = "[(0-9)]{8}"
//        let passwordTest  = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
//        return passwordTest.evaluate(with: password)
    }
    
}
