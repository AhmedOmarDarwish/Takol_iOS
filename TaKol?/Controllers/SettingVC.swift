//
//  SettingVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/15/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit
import MarqueeLabel

class SettingVC: UITableViewController {
    @IBOutlet weak var user_iv: UIImageView!
    @IBOutlet weak var userName_lbl: MarqueeLabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName_lbl.type = .continuous
        userName_lbl.animationCurve = .easeInOut
        //Change NavigationItem Title
        self.navigationItem.title = "Profile Setting"
        //user_iv.image = #imageLiteral(resourceName: "Takol Sq22")
        user_iv.image = UserdefultsManger.shared.userData?.image
        userName_lbl.text = UserdefultsManger.shared.userData?.name
        //Make Image Round
        user_iv.layer.masksToBounds = true
        user_iv.layer.cornerRadius = user_iv.frame.size.height / 2
        user_iv.clipsToBounds = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            //Push to SignInVC
            self.navigationController?.pushViewController(profileVC, animated: true)
            
        case 1:
            let addressesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressesVC") as! AddressesVC
            //Push to SignInVC
            self.navigationController?.pushViewController(addressesVC, animated: true)
            
        case 2:
            UserdefultsManger.shared.clearUserData()
            let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
            //RootViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController = UINavigationController(rootViewController: signInVC)
            appDelegate.window!.makeKeyAndVisible()
            
        default:
            print("No Selection")
        }
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
