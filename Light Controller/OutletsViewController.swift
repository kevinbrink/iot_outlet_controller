//
//  OutletsViewController
//  Light Controller
//
//  Created by Kevin Brink on 2017-05-02.
//  Copyright © 2017 Kevin Brink. All rights reserved.
//

import UIKit

class OutletsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    let cellIdentifier = "OutletTableViewCell"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationItems: UINavigationItem!

    var doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPushed(_:)))

    // This settings instance gets instantiated by the AppDelegate
    var 🔌: OutletSettings!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: TableView datasource / delegate methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 🔌.outletNames.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? OutletTableViewCell else {
            fatalError("Didn't get a OutletTableViewCell when I tried :(")
        }
        let outletId = indexPath.row + 1
        // Set the label
        cell.outletName.text = "\(🔌.outletNames[indexPath.row])"

        // Set the on button
        cell.onButton.action = .on // Not sure if this is really necessary :P
        cell.onButton.outletId = outletId

        // Set the off button
        cell.offButton.action = .off // Not sure if this is really necessary :P
        cell.offButton.outletId = outletId

        return cell
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }

    //MARK: Other delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.doneButtonPushed(textField)
        return false
    }

    //MARK: Actions

    @IBAction func buttonPushed(_ sender: OutletButton) {
        OutletCommunicator.sendSignal(🔌.serverUrl, sender.outletId!, sender.action)
    }

    @IBAction func cellEditBegan(_ sender: UITextField) {
        navigationItems.leftBarButtonItem = self.doneButton
    }

    func doneButtonPushed(_ sender: Any?) {
        navigationItems.leftBarButtonItems?.removeAll()
        if let cells = self.tableView.visibleCells as? [OutletTableViewCell] {
            🔌.outletNames = cells.map({ $0.outletName.text! })
            🔌.save()
        }
        self.view.endEditing(true)
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination.childViewControllers[0] as? SettingsViewController {
            // It seems that this view controller gets completely destroyed and 
            // re-created with navigation, so we have to always re-set the
            // settings property
            destinationViewController.🔌 = self.🔌
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}
