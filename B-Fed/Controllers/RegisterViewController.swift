//
//  RegisterViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 22/1/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailAddressTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.passwordError.text = error!.localizedDescription
                self.passwordError.alpha = 1
            }  else {
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
                
            }
              
        }
    }
    }
//    let db = Firestore.firestore()
//
//    db.collection("users").addDocument(data: ["first name": self.firstNameTextField, "last name": self.lastNameTextField, "uid":authResult!.user.uid]) { (error) in
//
//        if error != nil {
//            self.passwordError.text = error!.localizedDescription
//        }
    
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
        
        
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
        guard ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
        
            view.frame.origin.y = -150
        } else {
            view.frame.origin.y = 0
        }
    
    }

    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
}



