//
//  WelcomeMessageViewController.swift
//  B-Fed
//
//  Created by Jody Clelland on 9/2/21.
//
//
//import Foundation
//import Firebase
//
//class WelcomeMessageViewController: UIViewController {
//
//    @IBOutlet weak var welcomeMessageLabel: UILabel!
//
//    func loadUserData() {
//
//
//        _ = welcomeMessageLabel.text
//        _ = Firestore.firestore()
//
//
//        
//        guard (Auth.auth().currentUser?.uid) != nil else { return }
//        let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
//
//        docRef.getDocuments { (querySnapshot, err) in
////                   if let err = err {
////                       print(err.localizedDescription)
////                       return
////                   } else if querySnapshot!.documents.count != 1 {
////                       print("More than one document or none")
////                   } else {
////                       let document = querySnapshot!.documents.first
////                       let dataDescription = document?.data()
////                       guard let first = dataDescription?["first"] else { return }
////                       print(first)
//
//
//
//
//
//
//            guard (snapshot?.data() != nil else { return }
//            self.welcomeMessageLabel.text = "Welcome, \("first")"
//
//            UIView.animate(withDuration: 2.0, animations: {
//                self.welcomeMessageLabel.alpha = 1
//            },completion: {
//                (value: Bool) in
//                self.welcomeMessageLabel.isHidden = true
//        }
//   }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = false
//    }
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        loadUserData()
//}
//}
                    
