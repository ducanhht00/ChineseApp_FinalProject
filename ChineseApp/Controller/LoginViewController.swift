//
//  LoginViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 14/10/2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    // Outlet
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        emailtextField.text = "demo1@gmail.com"

        passwordTextField.text = "123456"
        //        // ducanhht@gmail.com
        //        //1@2.com
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailtextField.text , let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { [self]authResult, error in
                if let e = error {
                    print(e)
                    let alert: UIAlertController = UIAlertController(title: "Notification", message: "Incorrect email or password!", preferredStyle: UIAlertController.Style.alert)
                    let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(btnOK)
                    
                    present(alert, animated: true, completion: nil)
                } else {
                    FirestoreManager.rootTest.document(email).getDocument(source: .server){ (document, error) in
                        if let document = document {
                            ViewController.User.name = document["name"] as? String ?? "1"
                            ViewController.User.email = document["email"] as? String ?? "1"
                            ViewController.User.type = document["type"] as? String ?? "1"
                            ViewController.User.point = document["point"] as? Int ?? 0
                            ViewController.User.lessonStatus = document["lessonStatus"] as? [String:String] ?? [:]
                            ViewController.User.wordStatus = document["wordStatus"] as? [String:String] ?? [:]
                            ViewController.User.markQuiz = document["markQuiz"] as? [String:String] ?? [:]
                            ViewController.User.lessonPremiumLock = document["premiumLock"] as? [String:String] ?? [:]
                        } else {
                          print("Document does not exist in cache")
                        }
                      }
                    timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeSergue), userInfo: nil, repeats: false)
                }
              
            }
        }
        
    }
    @objc func changeSergue(){
        print(ViewController.User.email)
        self.performSegue(withIdentifier: "LoginToChat", sender: self)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
