//
//  OutletTableViewCell.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit

class OutletTableViewCell: UITableViewCell {
    //MARK: Properties

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var onButton: OutletButton!
    @IBOutlet weak var offButton: OutletButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
