//
//  SignUp2VC.swift
//  TaKol?
//
//  Created by 3Mr on 7/10/19.
//  Copyright © 2019 3Mr. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireImage


class SignUp2VC: UIViewController {
    @IBOutlet weak var user_iv: UIImageView!
    @IBOutlet weak var name_tf: UITextField!
    @IBOutlet weak var address_tf: UITextField!
    @IBOutlet weak var homeAddress_tf: UITextField!
    @IBOutlet weak var workAddress_tf: UITextField!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var rePassword_tf: UITextField!
    @IBOutlet weak var signUp_btn: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //user_iv.image = #imageLiteral(resourceName: "addImage")
        //Change NavigationItem Title
        self.navigationItem.title = "Sign Up"
        //Make Image Round
        user_iv.layer.masksToBounds = true
        user_iv.layer.cornerRadius = user_iv.frame.size.height / 2
        user_iv.clipsToBounds = true
        //SignUpButton Design
        signUp_btn.layer.cornerRadius = 15;
    }
    
    //Func Show Gallary and Chosse Image
    func gallary(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    //Get Image From URL
    func profileImage() {
        let downloadURL = NSURL(string: "https://robohash.org/123.png")!
        user_iv.af_setImage(withURL: downloadURL as URL)
        
        
       
    }
    //Start Indicator
    func startLoading(){
        activityIndicator.hidesWhenStopped = true;
        view.addSubview(activityIndicator);
        activityIndicator.startAnimating();
        UIApplication.shared.beginIgnoringInteractionEvents();
    }
     //Stop Indicator
    func stopLoading(){
        activityIndicator.stopAnimating();
        UIApplication.shared.endIgnoringInteractionEvents();
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        let name = name_tf.text?.trimm
        let address = address_tf.text?.trimm
        let homeAddress = homeAddress_tf.text?.trimm
        let workAddress = workAddress_tf.text?.trimm
        let email = email_tf.text?.trimm
        let password = password_tf.text?.trimm
        let repassword = rePassword_tf.text?.trimm
        let _image = user_iv.image
        let placeHolderImage = UIImage(named: "addImage")
        //Check All Fields Are Required
        guard let image = _image, image != placeHolderImage, !name.isBlank, !address.isBlank, !homeAddress.isBlank, !workAddress.isBlank, !email.isBlank, !password.isBlank, !repassword.isBlank else {
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
        let user1 = User(email: email!, password: password!, image: image, name: name!, address: [address!, homeAddress!, workAddress!])
        UserdefultsManger.shared.userData = user1
        //Pop to SignInVC
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func imagePickerBtnPressed(_ sender: UIButton) {
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        // create the alert
        let alert = UIAlertController(title: "Choose", message: "Choose Method To Get Your Image", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Choose From Gallery", style: UIAlertAction.Style.default, handler: {ACTION in self.gallary()}))
        alert.addAction(UIAlertAction(title: "From URL", style: UIAlertAction.Style.default, handler: {ACTION in self.profileImage()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
     
    }
    
}

//ImagePicker
extension SignUp2VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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


