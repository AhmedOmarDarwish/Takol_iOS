//
//  SignUpVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/10/19.
//  Copyright © 2019 3Mr. All rights reserved.
//


import UIKit
//Delegate (1)
protocol EmailDelegate: class {
    func setEmail(email: String)}

class SignUpVC: UIViewController {
    @IBOutlet weak var user_iv: UIImageView!
    @IBOutlet weak var name_tf: UITextField!
    @IBOutlet weak var address_tf: UITextField!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var rePassword_tf: UITextField!
    var imagePicker = UIImagePickerController()
    //Delegate (2)
    weak var delegate: EmailDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Change NavigationItem Title
        self.navigationItem.title = "Sign Up"
        //Make Image Round
        user_iv.layer.masksToBounds = true
        user_iv.layer.cornerRadius = user_iv.frame.size.height / 2
        user_iv.clipsToBounds = true
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
     let name = name_tf.text?.trimm
     let address = address_tf.text?.trimm
     let email = email_tf.text?.trimm
     let password = password_tf.text?.trimm
     let repassword = rePassword_tf.text?.trimm
     let _image = user_iv.image
     let placeHolderImage = UIImage(named: "addImage")
        
        //Check All Fields Are Required
        guard let image = _image, image != placeHolderImage, !name.isBlank, !address.isBlank, !email.isBlank, !password.isBlank, !repassword.isBlank else {
            self.showAlert(title: "Sorry", message: "All Fields Are Required")
            return
        }
        
        //Check Password_tf and rePassword_tf are the same
        guard password == repassword else {
            self.showAlert(title: "Sorry", message: "Password Must Be The Same")
            return
        }
        //Check Email regex and Password regex
        guard Validator.shared.isValidEmail(email!), Validator.shared.isValidPassword(password!) else {
            self.showAlert(title: "Sorry", message: "E-Mail or Password Not Valid")
            return
        }
        
        //Final state
        let user1 = User(email: email!, password: password!, image: image, name: name!, address: [address!])
        UserdefultsManger.shared.userData = user1
        ///Delegate (3)
        delegate?.setEmail(email: email!)
        //Pop to SignInVC
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func imagePickerBtnPressed(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
}

//للتنظيم
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //return dictionary of image key because original or edit
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        user_iv.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
    //Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


