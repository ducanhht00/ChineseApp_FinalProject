//
//  buyLessonViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 21/11/2022.
//

import UIKit

class buyLessonViewController: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var lessonName : String = ""
    var lessonPrice : Int = 0
    var lessonCode : String = ""
    let defaults : UserDefaults = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonName = defaults.object(forKey: "lessonName") as! String
        lessonPrice = defaults.object(forKey: "lessonPrice") as! Int
        lessonCode = defaults.object(forKey: "lessonCodeShop") as! String
        getShadowforView(a: shadowView)
        nameLabel.text = lessonName
        pointLabel.text = "Price : \(lessonPrice) points"
    }

    @IBAction func buyLessonButton(_ sender: UIButton) {
        if (ViewController.User.lessonPremiumLock[lessonCode] == "unlock"){
            print("You buy this")
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "You already bought this lesson", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
            
        }else if(ViewController.User.point < lessonPrice){
            print("not enough point")
            
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "you don't have enough points", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        } else{
            ViewController.User.lessonPremiumLock[lessonCode] = "unlock"
            ViewController.User.point -= lessonPrice
            
            updateUserToFirestore()
            
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "successfully purchase", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        }
        //print("Tesst buy")
    }
    @IBAction func BackToShopPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "BuyLessonBackToShop", sender: self)
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
