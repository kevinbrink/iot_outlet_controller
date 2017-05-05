//
//  OutletSettings.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit
import os.log

class OutletSettings: NSObject, NSCoding {
    //MARK: Properties

    var outletNames: [String]
    var serverUrl: String

    struct PropertyKeys {
        static let outletNames = "outletNames"
        static let serverUrl = "serverUrl"
    }

    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("outletSettings")

    init(outletNames: [String] = ["1", "2", "3"], serverUrl: String = "http://172.20.10.14:5000") {
        self.outletNames = outletNames
        self.serverUrl = serverUrl
    }

    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(outletNames, forKey: PropertyKeys.outletNames)
        aCoder.encode(serverUrl, forKey: PropertyKeys.serverUrl)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let serverUrl = aDecoder.decodeObject(forKey: PropertyKeys.serverUrl) as? String else {
            os_log("Unable to find serverUrl")
            return nil
        }
        if let outletNames = aDecoder.decodeObject(forKey: PropertyKeys.outletNames) as? [String] {
            self.init(outletNames: outletNames, serverUrl: serverUrl)
        } else {
            os_log("Unable to find outletNames")
            self.init(serverUrl: serverUrl)
        }
    }

    func save() {
        if NSKeyedArchiver.archiveRootObject(self, toFile: OutletSettings.ArchiveURL.path) {
            os_log("Successfully persisted outlet settings", log: OSLog.default, type: .debug)
        } else {
            os_log("Error while saving outlet settings", log: OSLog.default, type: .error)
        }
    }
    
}
