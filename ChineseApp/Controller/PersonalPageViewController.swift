//
//  PersonalPageViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 17/10/2022.
//

import UIKit
import Firebase

class PersonalPageViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowView2: UIView!
    @IBOutlet weak var shadowView3: UIView!
    @IBOutlet weak var shadowView4: UIView!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    
    var buttonList = ["Aloha","Log Out"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLabel.text = "Point: \(ViewController.User.point)"
        
        
        getShadowforView(a: shadowView)
        getShadowforView(a: shadowView2)
        getShadowforView(a: shadowView3)
        getShadowforView(a: shadowView4)
        
        navigationItem.hidesBackButton = true
        nameLabel.text = "Hello \(ViewController.User.name)"
        typeLabel.text = "Type: \(ViewController.User.type)"
    }
    
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        do{
            ViewController.User.markQuiz = [:]
            ViewController.User.lessonStatus = [:]
            ViewController.User.wordStatus = [:]
            ViewController.User.name = ""
            ViewController.User.email = ""
            ViewController.User.type = "normal"
            try Auth.auth().signOut()
            performSegue(withIdentifier: "logOut", sender: self)
        } catch let signOutError as NSError {
            print("Error signing Out : &@ ", signOutError)
        }
    }
    
    @IBAction func pressShopButton(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToShop", sender: self)
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
    
}
