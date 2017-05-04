//
//  OutletButton.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit

class OutletButton: UIButton {
    //MARK: Properties

    var action = ActionType.on // Might not really be required
    var outletId: Int!
}
