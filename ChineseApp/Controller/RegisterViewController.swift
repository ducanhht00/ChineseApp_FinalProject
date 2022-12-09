//
//  RegisterViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 14/10/2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    // Outlet

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func resgisterPressed(_ sender: UIButton) {
        if let email = emailTextField.text , let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
                if let e = error {
                    print(e)
                } else {
                    // Navigation to the Main View Controller
                    newUserInfor()
                    
                    timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeSergue), userInfo: nil, repeats: false)
                }
            }
            
        }
        
       
    }
    @objc func changeSergue(){
        self.performSegue(withIdentifier: "RegisterToMain", sender: self)
    }
    func newUserInfor(){
        let listLess = ["1.1","2.1"]
        let listFreeLess = ["1.1","1.2","1.3","2.1"] // ,"1.4","1.5","2.2","2.3","2.4","2.5"
        for n in ViewController.wordList {
            ViewController.User.wordStatus[n.word] = "not done"
        }
        
        for n in ViewController.lessonList {
            ViewController.User.lessonStatus[n.lessonCode] = "lock"
            ViewController.User.markQuiz[n.lessonCode] = "00"
            ViewController.User.lessonPremiumLock[n.lessonCode] = "lock"
        }
        for n in listLess{
            ViewController.User.lessonStatus[n] = "unlock"
        }
        for n in listFreeLess{
            ViewController.User.lessonPremiumLock[n] = "unlock"
        }
        
        ViewController.User.type = "normal"
        ViewController.User.email = emailTextField.text!
        ViewController.User.name = nameTextField.text!
        FirestoreManager.rootTest.document(ViewController.User.email).setData([

            "name": ViewController.User.name,
            "email" : ViewController.User.email,
            "type" : ViewController.User.type,
            "point" : ViewController.User.point,
            "lessonStatus": ViewController.User.lessonStatus,
            "wordStatus": ViewController.User.wordStatus,
            "markQuiz" : ViewController.User.markQuiz,
            "premiumLock" : ViewController.User.lessonPremiumLock

        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
