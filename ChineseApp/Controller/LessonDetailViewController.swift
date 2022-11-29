//
//  LessonDetailViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 11/11/2022.
//

import UIKit

class LessonDetailViewController: UIViewController{
   
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowView2: UIView!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.titleLabel!.text = ""
        // View Widget 1
        shadowView.layer.cornerRadius = 20
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 5.0
        shadowView.layer.masksToBounds = false
        shadowView.layer.borderWidth = 0.3
        shadowView.layer.borderColor = UIColor.lightGray.cgColor
        // Shadow 2
        shadowView2.layer.cornerRadius = 20
        shadowView2.layer.shadowOffset = CGSize.zero
        shadowView2.layer.shadowOpacity = 0.3
        shadowView2.layer.shadowRadius = 5.0
        shadowView2.layer.masksToBounds = false
        shadowView2.layer.borderWidth = 0.3
        shadowView2.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func vocabPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "DetailLessonToVocab", sender: self)
    }
    @IBAction func quizPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LessonDetailToQuiz", sender: self)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "DetailBackToMain", sender: self)
    }
    
}
