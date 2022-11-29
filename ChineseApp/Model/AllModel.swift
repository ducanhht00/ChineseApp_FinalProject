//
//  CourseModel.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 18/10/2022.
//

import Foundation

struct Course{
    var id : String
    var courseCode : String
    var name : String
    var description : String
    var level : String
}
struct Lesson{
    var id : String
    var name : String
    var courseCode : String
    var lessonCode: String
    var order : String
    var relateLesson : String
}
struct Word{
    var id : String
    var word : String
    var lessonCode : String
    var mean: String
    var order : String
    var pinyin : String 
}
struct Question{
    var id : String
    var lessonCode : String
    var question : String
    var optionA : String
    var optionB : String
    var optionC : String
    var optionD : String
    var correctAnswer: String
    var relate : String
}
struct UserInfor{
    var name : String
    var email : String
    var type : String
    var point : Int
    var lessonStatus : [String: String]
    var wordStatus : [String : String]
    var markQuiz : [String: String]
    var lessonPremiumLock : [String: String]
}

struct Theory{
    var id : String
    var name : String
    var lessonCode : String
    var order : String
    var theory1 : String
    var theory2 : String
    var theory3 : String
    var word : String
    var pinyin : String
    var mean : String
}

struct TheoryCard{
    var id : String
    var lessonCode : String
    var lessonName : String
    var mainContent : String
    var supportContent : String
    var theory : String
    var pinyin1 : String
    var word1 : String
    var mean1 : String
    var pinyin2 : String
    var word2 : String
    var mean2 : String
}
struct PinyinItem{
    var time: Double
    var location: Int
    var length : Int
}
struct WordItem{
    var time: Double
    var location: Int
    var length : Int
}
struct Sentence{
    var pinyinList : [PinyinItem]
    var wordList : [WordItem]
    var nameSound : String
    var word: String
    var pinyin: String
    var mean : String
    var topicName : String
    var order : Int
}

