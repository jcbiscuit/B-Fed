//
//  RegisterViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 22/1/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginEmailAddressTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    
    let userDefault = UserDefaults.standard
    let launchedBefore = UserDefaults.standard.bool(forKey: "IsLoggedIn")
    
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    if let email = loginEmailAddressTextField.text, let password = loginPasswordTextField.text {
        Auth.auth().signIn(withEmail: email, password: password) { [self] authResult, error in
                if error != nil {
                    self.passwordError.text = error!.localizedDescription
                    self.passwordError.alpha = 1
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                    self.userDefault.set(true, forKey: "IsLoggedIn")
                    self.userDefault.synchronize()
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

        if userDefault.bool(forKey: "usersignedin") {
//            performSegue(withIdentifier: K.loginSegue, sender: self)
                }
        

        loginEmailAddressTextField.delegate = self
        loginPasswordTextField.delegate = self
      
        
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



