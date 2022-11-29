//
//  BuyPremiumViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 21/11/2022.
//

import UIKit

class BuyPremiumViewController: UIViewController {

    @IBOutlet weak var premiumView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getShadowforView(a: premiumView)
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func buyPremiumPressed(_ sender: UIButton) {
        ViewController.User.type = "premium"
        for n in ViewController.lessonList {
            ViewController.User.lessonPremiumLock[n.lessonCode] = "unlock"
        }
        print("Buy sucess")
        let alert: UIAlertController = UIAlertController(title: "Notification", message: "successfully purchase", preferredStyle: UIAlertController.Style.alert)
        let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(btnOK)
        
        present(alert, animated: true, completion: nil)
        updateUserToFirestore()
    }
    
    
    
    
    
    
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
     performSegue(withIdentifier: "PremiumBackToShop", sender: self)
    }
    func getShadowforView(a: UIView){
        a.layer.cornerRadius = 20
        a.layer.shadowOffset = CGSize.zero
        a.layer.shadowOpacity = 0.3
        a.layer.shadowRadius = 5.0
        a.layer.masksToBounds = false
        a.layer.borderWidth = 0.3
        a.layer.borderColor = UIColor.lightGray.cgColor
    }
    func updateUserToFirestore(){
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
}
