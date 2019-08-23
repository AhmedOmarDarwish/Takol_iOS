//
//  ViewController.swift
//  TaKol?
//
//  Created by 3Mr on 7/10/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit
import Foundation
import MarqueeLabel

class SignInVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var signIn_btn: UIButton!
    @IBOutlet weak var signUp_btn: UIButton!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change NavigationItem Title
        self.navigationItem.title = "Sign In"
        //SignInButton Design
        signIn_btn.roundBorderGreen
        //SignUpButton Design
        signUp_btn.layer.cornerRadius = 15;
        
    }
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        let email =  email_tf.text?.trimm
        let password = password_tf.text?.trimm
        let userData = UserdefultsManger.shared.userData
        
        //check if email and password are blank
        guard !email.isBlank, !password.isBlank else {
            self.showAlert(title: "Sorry", message: "Enter Email and Password")
            return
        }
        
        //Check Email regex and Password regex
        guard Validator.shared.isValidEmail(email!), Validator.shared.isValidPassword(password!) else {
            self.showAlert(title: "Sorry", message: "E-Mail or Password Not Valid")
            return
        }
        
        guard userData != nil else {
            self.showAlert(title: "Sorry", message: "You Must SignUp First")
            return
        }
        
        guard let cachedEmail = userData?.email, email == cachedEmail, let cachedPassword = userData?.password, password == cachedPassword else {
            self.showAlert(title: "Sorry", message: "Enter Valid Email and Password")
            return
        }
        
        UserdefultsManger.shared.isLogedIn = true
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        //RootViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = UINavigationController(rootViewController: homeVC)
        appDelegate.window!.makeKeyAndVisible()
        
        
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        let signUp2VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp2VC") as! SignUp2VC
        
        //Clear email tf and password tf
        email_tf.text = ""
        password_tf.text = ""
        
        //Push to SignUp2VC
        self.navigationController?.pushViewController(signUp2VC, animated: true)
    }
    
    @IBAction func forgetPasswordBtnPressed(_ sender: UIButton) {
        guard UserdefultsManger.shared.userData != nil else {
            self.showAlert(title: "Sorry", message: "You Must SignUp")
            return
        }
        let forgetPasswordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        //Push to SignUpVC
        self.navigationController?.pushViewController(forgetPasswordVC, animated: true)
    }
}


