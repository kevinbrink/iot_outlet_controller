//
//  SettingsViewController.swift
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-04.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    var settings: OutletSettings!

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
        settings.serverUrl = serverUrl.text!
        dismiss(animated: true, completion: nil)
    }

    @IBAction func numOutletsChanged(_ sender: UIStepper) {
        let newValue = Int(sender.value)

        // Update model
        settings.numOutlets = newValue

        // Update display
        numOutletsDisplay.text = "\(settings.numOutlets)"
    }

    //MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Here, if we wanted to, we could pass on all of the data from this viewController in some way to the next one
        super.prepare(for: segue, sender: sender)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Update display
        numOutletsDisplay.text = "\(settings.numOutlets)"
        numOutletsStepper.value = Double(settings.numOutlets)
        serverUrl.text = settings.serverUrl
    }
}
