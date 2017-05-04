//
//  OutletSettings.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit

class OutletSettings {
    //MARK: Properties

    var numOutlets: Int
    var serverUrl: String

    init?(numOutlets: Int = 5, serverUrl: String = "http://172.20.10.14:5000") {
        if numOutlets < 0 {
            return nil
        }
        self.numOutlets = numOutlets
        self.serverUrl = serverUrl
    }
}
