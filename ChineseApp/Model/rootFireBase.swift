//
//  rootFireBase.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 09/11/2022.
//

import Foundation
import Firebase
struct FirestoreManager{
    
    static let course = "Course"
    static let lesson = "Lesson"
    static let word = "Word"
    static let question = "Question"
    static let test = "Test"
    static let theory = "Theory"
    
    static let db = Firestore.firestore()
    static let rootCourse = db.collection(course)
    static let rootLesson = db.collection(lesson)
    static let rootWord = db.collection(word)
    static let rootQuestion = db.collection(question)
    static let rootTest = db.collection(test)
    static let rootTheory = db.collection(theory)
}


