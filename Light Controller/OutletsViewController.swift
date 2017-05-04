//
//  OutletsViewController
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-02.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit

class OutletsViewController: UIViewController, UITableViewDataSource {
    let cellIdentifier = "OutletTableViewCell"

    @IBOutlet weak var tableView: UITableView!
    // This settings instance gets instantiated by the AppDelegate
    var settings: OutletSettings!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return settings.numOutlets
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? OutletTableViewCell else {
            fatalError("Didn't get a OutletTableViewCell when I tried :(")
        }
        let outletId = indexPath.row + 1
        // Set the label
        cell.cellLabel.text = "\(outletId)"

        // Set the on button
        cell.onButton.action = .on // Not sure if this is really necessary :P
        cell.onButton.outletId = outletId

        // Set the off button
        cell.offButton.action = .off // Not sure if this is really necessary :P
        cell.offButton.outletId = outletId
        return cell
    }

    //MARK: Actions

    @IBAction func buttonPushed(_ sender: OutletButton) {
        switch sender.action {
        case .on:
            print("On Pushed!")
        case .off:
            print("Off Pushed!")
        }
        print("Outlet's ID is \(sender.outletId!)")
        OutletCommunicator.sendSignal(settings.serverUrl, sender.outletId!, sender.action)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination.childViewControllers[0] as? SettingsViewController {
            // It seems that this view controller gets completely destroyed and 
            // re-created with navigation, so we have to always re-set the
            // settings property
            destinationViewController.settings = self.settings
        }
    }

    // "Unwinding" from the settings view controller. If we wanted to, we could 
    // get some data from that viewcontroller, and use it to update the state here
    @IBAction func unwindToOutletList(sender: UIStoryboardSegue) {

    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}
