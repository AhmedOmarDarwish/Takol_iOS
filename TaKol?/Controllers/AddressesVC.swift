//
//  AddressesVC.swift
//  TaKol?
//
//  Created by 3Mr on 7/22/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class AddressesVC: UIViewController {
    
    @IBOutlet weak var edit_Btn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let addressesArr = UserdefultsManger.shared.userData?.address
    let cellReuseIdentifier = "AddressCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //EditButton Design
        edit_Btn.layer.cornerRadius = 15;
    }
    
}
extension AddressesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressesArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let addressCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AddressCell
        addressCell.configureCell(address: addressesArr![indexPath.row])
        return addressCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
