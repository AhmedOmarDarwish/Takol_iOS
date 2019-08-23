//
//  SignUpTestVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/19/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class SignUpTestVC: UIViewController {
    @IBOutlet weak var user_iv: UIImageView!
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make Image Round
        user_iv.layer.masksToBounds = true
        user_iv.layer.cornerRadius = user_iv.frame.size.height / 2
        user_iv.clipsToBounds = true
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpTableView"{
            let vc = segue.destination as! SignUpTableViewVC
            vc.name_tf.text = "fghf"
            
        }
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
                 let signUpTableViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpTableViewVC") as! SignUpTableViewVC
        
        
                let name = signUpTableViewVC.name_tf.text?.trimm
                let address = signUpTableViewVC.homeAdress_tf.text?.trimm
                let email = signUpTableViewVC.email_tf.text?.trimm
                let password = signUpTableViewVC.password_tf.text?.trimm
                let repassword = signUpTableViewVC.rePassword_tf.text?.trimm
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


extension SignUpTestVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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




