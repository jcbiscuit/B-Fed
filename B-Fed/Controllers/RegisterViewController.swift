//
//  RegisterViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 22/1/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    if let email = emailAddressTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
            }  else {
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
        }
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerLabel.text = ""
        var letterIndex = 0.0
        let registerText = K.registerMessage
        for letter in registerText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * letterIndex, repeats: false) { (timer) in
                self.registerLabel.text?.append(letter)
            }
            letterIndex += 1
        }
        
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self

    }
    
    func hideKeyboard() {
        emailAddressTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

