//
//  SettingsViewController.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit
import os

class SettingsViewController: UIViewController, UITextFieldDelegate {
    var 🔌: OutletSettings!

    @IBOutlet weak var numOutletsDisplay: UITextField!
    @IBOutlet weak var numOutletsStepper: UIStepper!
    @IBOutlet weak var serverUrl: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.serverUrl.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    //MARK: Actions; responding to buttons or other UI interactions

    @IBAction func done(_ sender: UIBarButtonItem) {
        🔌.serverUrl = serverUrl.text!
        🔌.save()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func numOutletsChanged(_ sender: UIStepper) {
        let newValue = Int(sender.value)

        // Update model
        while (newValue > 🔌.outletNames.count) {
            🔌.outletNames.append("\(🔌.outletNames.count+1)")
        }
        while (newValue < 🔌.outletNames.count) {
            // For now, we just naively, brutally, remove the last one
            🔌.outletNames.removeLast()
        }

        // Update display
        numOutletsDisplay.text = "\(🔌.outletNames.count)"
    }

    //MARK: Navigation

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Update display
        numOutletsDisplay.text = "\(🔌.outletNames.count)"
        numOutletsStepper.value = Double(🔌.outletNames.count)
        serverUrl.text = 🔌.serverUrl
    }
}
