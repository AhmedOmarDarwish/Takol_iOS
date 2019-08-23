//
//  ProfileTableViewVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/13/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class ProfileTableViewVC: UITableViewController {
    let namesArr: [String] = ["Ahmed", "Shady", "Belal", "Jacky", "Asmma", "Salma"]
    let imagesArr: [String] = Array(repeating: "name", count: 6)
    let details: [String] = Array(repeating: "IOS Developer", count: 6)
   
    let userData = UserdefultsManger.shared.userData
     var userDataArr: [String] = []
    let userDataImg: [String] = ["name", "address", "email"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        userDataArr.append(userData!.name)
        //userDataArr.append(userData!.address)
        userDataArr.append(userData!.email)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userDataImg.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableCell", for: indexPath) as! ProfileTableCell
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "firstCell")
//        cell.textLabel?.text = namesArr[indexPath.row]
//        let image = UIImage(named: imagesArr[indexPath.row])
//        cell.imageView?.image = image
//        cell.detailTextLabel?.text = details[indexPath.row]
        cell.userData_iv.image = UIImage(named: userDataImg[indexPath.row])
        cell.userData_lbl.text = userDataArr[indexPath.row]
        
        return cell
    }
    
    
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
