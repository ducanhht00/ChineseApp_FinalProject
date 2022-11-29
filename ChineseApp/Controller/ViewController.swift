//
//  ViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 07/10/2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    static var courseList = [Course]()
    static var lessonList = [Lesson]()
    static var wordList = [Word]()
    static var questionList = [Question]()
    static var theoryList = [Theory]()
    
    static var User = UserInfor(name: "", email: "", type: "",point: 0, lessonStatus: [: ], wordStatus: [:],  markQuiz: [:], lessonPremiumLock: [:])
    let defaults : UserDefaults = UserDefaults()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set("1", forKey: "currentCourse")
        loadCourseData()
        loadLessonData()
        loadWordData()
        loadQuestionData()
        loadTheoryData()
        // Do any additional setup after loading the view.
    }

    
    func loadQuestionData(){
        FirestoreManager.rootQuestion.getDocuments{ snapshot, error in
            // check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        // Get all document and create Course
                        ViewController.questionList = snapshot.documents.map { d in
                            // Create a Course item for each document
                            return Question(id: d.documentID,
                                            lessonCode: d["lessonCode"] as? String ?? "",
                                            question: d["question"] as? String ?? "",
                                            optionA: d["optionA"] as? String ?? "",
                                            optionB: d["optionB"] as? String ?? "",
                                            optionC: d["optionC"] as? String ?? "",
                                            optionD: d["optionD"] as? String ?? "",
                                            correctAnswer: d["Correct"] as? String ?? "",
                                            relate: d["relate"] as? String ?? "")
                            }
                        }
                    }
                }
            }
        }
    func loadWordData(){
        FirestoreManager.rootWord.getDocuments{ snapshot, error in
            // check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        // Get all document and create Course
                        ViewController.wordList = snapshot.documents.map { d in
                            // Create a Course item for each document
                            return Word(id: d.documentID,
                                          word: d["word"] as? String ?? "",
                                          lessonCode: d["lessonCode"] as? String ?? "",
                                          mean: d["mean"] as? String ?? "",
                                          order: d["order"] as? String ?? "",
                                        pinyin: d["pinyin"] as? String ?? "")
                            }
                        }
                    }
                }
            }
        }
    func loadLessonData(){
        FirestoreManager.rootLesson.getDocuments{ snapshot, error in
            // check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        // Get all document and create Course
                        ViewController.lessonList = snapshot.documents.map { d in
                            // Create a Course item for each document
                            return Lesson(id: d.documentID,
                                          name: d["name"] as? String ?? "",
                                          courseCode: d["courseCode"] as? String ?? "",
                                          lessonCode: d["lessonCode"] as? String ?? "",
                                          order: d["order"] as? String ?? "",
                                        relateLesson: d["relateLesson"] as? String ?? "")
                            }
                        }
                    }
                }
            }
        }
    
    // Load course
    func loadCourseData(){
        FirestoreManager.rootCourse.getDocuments{ snapshot, error in
            // check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        // Get all document and create Course
                        ViewController.courseList = snapshot.documents.map { d in
                            // Create a Course item for each document
                            return Course(id: d.documentID,
                                          courseCode: d["courseCode"] as? String ?? "",
                                          name: d["name"] as? String ?? "",
                                          description: d["description"] as? String ?? "",
                                          level: d["level"] as? String ?? "")
                            }
                        }
                    }
                }
            }
        }
    // Load course
    func loadTheoryData(){
        FirestoreManager.rootTheory.getDocuments{ snapshot, error in
            // check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        // Get all document and create Course
                        ViewController.theoryList = snapshot.documents.map { d in
                            // Create a Course item for each document
                            return Theory(id: d.documentID,
                                          name: d["name"] as? String ?? "",
                                          lessonCode: d["lessonCode"] as? String ?? "",
                                          order: d["order"] as? String ?? "",
                                          theory1: d["theory1"] as? String ?? "",
                                          theory2: d["theory2"] as? String ?? "",
                                          theory3: d["theory3"] as? String ?? "",
                                          word: d["word"] as? String ?? "",
                                          pinyin: d["pinyin"] as? String ?? "",
                                          mean: d["mean"] as? String ?? "")
                            
                            }
                        }
                    }
                }
            }
        }
}




//    @IBAction func printCourse(_ sender: UIButton) {
//
//        //print(Auth.auth().currentUser?.email!)
//        FirestoreManager.rootTest.document("1@2.com").getDocument(source: .cache){ (document, error) in
//            if let document = document {
//                ViewController.User.lessonStatus = document["lessonStatus"] as? [String:String] ?? [:]
//                print("Cached document data: \(ViewController.User.lessonStatus)")
//            } else {
//              print("Document does not exist in cache")
//            }
//          }
     //Add or ghi de data
     // #1 Prepare Data
//        for n in ViewController.wordList {
//            ViewController.User.wordStatus[n.word] = "not done"
//        }
//
//        for n in ViewController.lessonList {
//            ViewController.User.lessonStatus[n.lessonCode] = "lock"
//            ViewController.User.markQuiz[n.lessonCode] = "00"
//        }
//        FirestoreManager.rootTest.document("1@2.com").setData([
//
//            "name": ViewController.User.name,
//            "email" : ViewController.User.email,
//            "type" : ViewController.User.type,
//            "lessonStatus": ViewController.User.lessonStatus,
//            "wordStatus": ViewController.User.wordStatus,
//            "markQuiz" : ViewController.User.markQuiz
//
//        ]){ err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//
//
//    }
//
