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

    @IBOutlet weak var outletName: UITextField!
    @IBOutlet weak var onButton: OutletButton!
    @IBOutlet weak var offButton: OutletButton!
}
