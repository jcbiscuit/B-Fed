//
//  ForgottenPasswordViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 14/2/21.
//

import UIKit
import Firebase

class ForgottenPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func resetPasswordPressed(_ sender: UIButton) {
    
    let auth = Auth.auth()
    
    auth.sendPasswordReset(withEmail: emailTextField.text!) {(error) in
    if let error = error {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    self.present(alert, animated: true, completion: nil)
    return
    }
        let alert = UIAlertController(title: "Hurray", message: "A password reset email has been sent!", preferredStyle: .alert)
    self.present(alert, animated: true, completion: nil)
    }
        
}
    
    
}
