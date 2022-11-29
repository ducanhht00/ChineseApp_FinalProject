//
//  QuizViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 11/11/2022.
//

import UIKit

class QuizViewController: UIViewController {

    // Outlet
    @IBOutlet weak var quesNumber: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAButton: UIButton!
    @IBOutlet weak var optionBButton: UIButton!
    @IBOutlet weak var optionCButton: UIButton!
    @IBOutlet weak var optionDButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    // Variable & Aray
    var quizList = [Question]()
    var questionNumber = 0
    let defaults : UserDefaults = UserDefaults()
    static var correctNumber : Int = 0
    static var count_Question : Int = 0
    static var relateList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizViewController.relateList = []
        QuizViewController.correctNumber = 0
        let currentLesson : String = defaults.object(forKey: "currentLesson") as! String
        
        quizList = ViewController.questionList.filter({ (currQues) -> Bool in
            return currQues.lessonCode == currentLesson
        })
        QuizViewController.count_Question = quizList.count
        loadQuestion(a: questionNumber)
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        // Check Answer
        let result : Bool = checkAnswer(answer: sender.currentTitle!, quesNum: questionNumber)
        if result {
            QuizViewController.correctNumber += 1
            print(quizList[questionNumber].relate)
            QuizViewController.relateList.append(quizList[questionNumber].relate)
            
        } else {
            print("Wrong")
        }
        
        // Load question and reset
        questionNumber += 1
        if questionNumber < quizList.count{
            loadQuestion(a: questionNumber)
        } else {
            performSegue(withIdentifier: "QuizToResult", sender: self)
        }
    }
    
    // Load Question text
    func loadQuestion(a : Int){
        
        
        quesNumber.text = "Question : \(a+1) / \(quizList.count)"
        progressBar.progress = Float(a)/Float(quizList.count)
        questionLabel.text = quizList[a].question
        optionAButton.setTitle(quizList[a].optionA, for: .normal)
        optionBButton.setTitle(quizList[a].optionB, for: .normal)
        optionCButton.setTitle(quizList[a].optionC, for: .normal)
        optionDButton.setTitle(quizList[a].optionD, for: .normal)
        
//        optionAButton.backgroundColor = .purple
//        optionBButton.backgroundColor = .purple
//        optionCButton.backgroundColor = .purple
//        optionDButton.backgroundColor = .purple
//        if quizList[a].correctAnswer == quizList[a].optionA {
//            optionAButton.backgroundColor = .black
//        }
//        else if quizList[a].correctAnswer == quizList[a].optionB {
//            optionBButton.backgroundColor = .black
//        }
//        else if quizList[a].correctAnswer == quizList[a].optionC {
//            optionCButton.backgroundColor = .black
//        } else {
//                optionDButton.backgroundColor = .black
//
//        }
    }
    
    
    // Check answer
    
    func checkAnswer(answer : String, quesNum: Int) -> Bool {
        var Aloha : Bool
        if answer == quizList[quesNum].correctAnswer{
            Aloha = true
        }else{
            Aloha = false
        }
        return Aloha
    }
}
