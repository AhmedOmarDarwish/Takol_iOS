//
//  ProfileVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/11/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var user_iv: UIImageView!
    //@IBOutlet weak var name_tf: UITextField!
   // @IBOutlet weak var adress_tf: UITextField!
    //@IBOutlet weak var email_tf: UITextField!
    //var tf_enable = false
    
    let userData = UserdefultsManger.shared.userData
    var userDataArr: [String] = []
    let userDataImg: [String] = ["name", "email"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Change NavigationItem Title
        self.navigationItem.title = "My Profile"
        let userData = UserdefultsManger.shared.userData
        user_iv.image = userData?.image
//        name_tf.text = userData?.name
//        adress_tf.text = userData?.address
//        email_tf.text = userData?.email
        //Make Image Round
        user_iv.layer.masksToBounds = true
        user_iv.layer.cornerRadius = user_iv.frame.size.height / 2
        user_iv.clipsToBounds = true
        //tf editing false
//        name_tf.isEnabled = false
//        adress_tf.isEnabled = false
//        email_tf.isEnabled = false
        
        
        userDataArr.append(userData!.name)
//        userDataArr.append(userData!.address)
//         userDataArr.append("userData!.address")
        userDataArr.append(userData!.email)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableCell", for: indexPath) as! ProfileTableCell
        cell.userData_iv.image = UIImage(named: userDataImg[indexPath.row])
        cell.userData_lbl.text = userDataArr[indexPath.row]
        
        return cell
    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        UserdefultsManger.shared.clearUserData()
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        //RootViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = UINavigationController(rootViewController: signInVC)
        appDelegate.window!.makeKeyAndVisible()
        //Push to SignInVC
//        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    
    @IBAction func editProfileBtnPressed(_ sender: UIButton) {
//        if tf_enable {
//            tf_enable = false
//            name_tf.isEnabled = false
//            adress_tf.isEnabled = false
//            email_tf.isEnabled = false
//        } else {
//            tf_enable = true
//            name_tf.isEnabled = true
//            adress_tf.isEnabled = true
//            email_tf.isEnabled = true
//            name_tf.becomeFirstResponder()
//        }
//
    }
    
}
