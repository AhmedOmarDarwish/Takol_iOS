//
//  ForgetPasswordVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/12/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Change NavigationItem Title
        self.navigationItem.title = "Forget Password"
    }
 
    @IBAction func getPasswordBtnPressed(_ sender: UIButton) {
        let email = email_tf.text?.trimm
        let userData = UserdefultsManger.shared.userData
        if !email.isBlank &&  Validator.shared.isValidEmail(email!) && email == userData?.email {
            password_lbl.text = userData?.password
        } else if email.isBlank {
            self.showAlert(title: "Sorry", message: "Enter Your Email")
        } else if !Validator.shared.isValidEmail(email!) {
            self.showAlert(title: "Sorry", message: "Email Not Valid")
        }else{
            self.showAlert(title: "Sorry", message: "You Must SignUp")
        }
    }
    
}
