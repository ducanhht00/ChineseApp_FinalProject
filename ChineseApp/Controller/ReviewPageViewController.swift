//
//  ReviewPageViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 17/10/2022.
//

import UIKit

class ReviewPageViewController: UIViewController{
    
    static var learnedWord = [Word]()
    // Outlet
    @IBOutlet weak var ViewPremium: UIView!
    @IBOutlet weak var normalView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getShadowforView(a: normalView)
        getShadowforView(a: ViewPremium)
        
        ReviewPageViewController.learnedWord = ViewController.wordList.filter({ (word1) -> Bool in
            return ViewController.User.wordStatus[word1.word] == "done"
        })
        
    }
    
    @IBAction func knowledgaeButton(_ sender: UIButton) {
        if ViewController.User.type == "normal"{
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "Functions reserved for premium users!", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "GoToKnowledgeCard", sender: self)
        }
        
    }
    
    @IBAction func storyPressed(_ sender: UIButton) {
        if ViewController.User.type == "normal"{
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "Functions reserved for premium users!", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "GoToMainStory", sender: self)
        }
        
    }
    
    
    @IBAction func learnedWPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ToLearnedWord", sender: self)
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
