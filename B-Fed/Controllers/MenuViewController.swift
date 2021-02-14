//
//  DashboardViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 27/1/21.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationItem.hidesBackButton = true
    }
    


    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
    do {
        try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
        }
    }

}

