//
//  QuizResultViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 11/11/2022.
//

import UIKit

class QuizResultViewController: UIViewController {

    @IBOutlet weak var QuizResult: UILabel!
    @IBOutlet weak var Intresult: UILabel!
    @IBOutlet weak var highestResult: UILabel!
    
    let defaults : UserDefaults = UserDefaults()
    override func viewDidLoad() {
        for n in QuizViewController.relateList{
            ViewController.User.wordStatus[n] = "done"
            print(ViewController.User.wordStatus)
        }
        
        
        let currentLesson : String = defaults.object(forKey: "currentLesson") as! String
        for n in ViewController.lessonList{
            if n.lessonCode == currentLesson {
                let nextLesson: String = n.relateLesson
                if (QuizViewController.count_Question - QuizViewController.correctNumber) <= 2{
                    ViewController.User.lessonStatus[nextLesson] = "unlock"
                }
            }
        }
        
        
        let percent : Float = (Float(QuizViewController.correctNumber) / Float(QuizViewController.count_Question)) * 100
        let StrigPercent = String(format:"%.1f", percent)
        
        if percent > Float(ViewController.User.markQuiz[currentLesson]!) ?? 0.0  {
        ViewController.User.markQuiz[currentLesson] = StrigPercent
            print(ViewController.User.markQuiz[currentLesson]!)
            print(ViewController.User.email)
        }
        let gift : Int = Int (percent / 2.0)
        ViewController.User.point += gift
        QuizResult.text = "- You got \(StrigPercent)% of the questions correct in this exercise."
        Intresult.text = "- You get \(gift) bonus points"
        highestResult.text = "- Your highest achievement for this lesson is \(ViewController.User.markQuiz[currentLesson]!)%"
        updateUserToFirestore()
        super.viewDidLoad()
    }

    @IBAction func back_Button(_ sender: UIButton) {
        performSegue(withIdentifier: "ResultBackToDetaillesson", sender: self)
    }
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
