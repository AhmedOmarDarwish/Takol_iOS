//
//  ProfileTableCell.swift
//  TaKol?
//
//  Created by 3Mr on 7/15/19.
//  Copyright © 2019 3Mr. All rights reserved.
//

import UIKit

class ProfileTableCell: UITableViewCell {

    @IBOutlet weak var userData_iv: UIImageView!
    @IBOutlet weak var userData_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
