//
//  ExpandableCellTableViewCell.swift
//  ExpandableTableView
//
//  Created by Soubhi Hadri on 26/07/16.
//  Copyright © 2016 Soubhi Hadri. All rights reserved.
//

import UIKit

class ExpandableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var directionImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
