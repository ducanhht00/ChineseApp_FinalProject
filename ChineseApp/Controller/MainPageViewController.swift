//
//  MainPageViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 14/10/2022.
//

import UIKit
import Firebase

class MainPageViewController: UIViewController , UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    var currentLessons = [Lesson]()
    var sortedCurrentLessons = [Lesson]()
    let defaults : UserDefaults = UserDefaults()
    
    // Out let
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var showLevel: UILabel!
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var ShadowWidget: UIView!
    @IBOutlet weak var lessonCollectionView: UICollectionView!
    @IBOutlet weak var courseImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View Widget
        ShadowWidget.layer.cornerRadius = 20
        ShadowWidget.layer.shadowOffset = CGSize.zero
        ShadowWidget.layer.shadowOpacity = 0.3
        ShadowWidget.layer.shadowRadius = 5.0
        ShadowWidget.layer.masksToBounds = false
        ShadowWidget.layer.borderWidth = 0.3
        ShadowWidget.layer.borderColor = UIColor.lightGray.cgColor
        // Get current Lesson
        let currentCourse : String = defaults.object(forKey: "currentCourse") as! String
        currentLessons = ViewController.lessonList.filter({ (less1) -> Bool in
            return less1.courseCode == currentCourse
        })
        // Sort Lesson
        sortedCurrentLessons = currentLessons.sorted(by: {Int($0.order) ?? 0 < Int($1.order) ?? 1})
        
        
        navigationItem.hidesBackButton = true
        lessonCollectionView.dataSource = self
        lessonCollectionView.delegate = self
        var courseName :String = ""
        for n in ViewController.courseList {
            if n.courseCode == currentCourse{
                courseName = n.name
            }
        }
        showName.text = "Hello, \(ViewController.User.name)"
        showLevel.text = "Level : \(courseName)"
        pointLabel.text = "Point: \(ViewController.User.point)"
        courseImage.image = UIImage.init(named: courseName)
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedCurrentLessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lessonCell", for: indexPath) as! MainPageCollectionViewCell
        cell.setup(with: sortedCurrentLessons[indexPath.row])
        //cell.logLesson()
        if ViewController.User.lessonStatus[sortedCurrentLessons[indexPath.row].lessonCode] != "unlock" {
            cell.backgroundColor = .gray
        }
        if ViewController.User.lessonPremiumLock[sortedCurrentLessons[indexPath.row].lessonCode] != "unlock" {
            cell.logLesson()
        }
        cell.layer.cornerRadius = 10
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 5.0
        cell.layer.masksToBounds = false
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if ViewController.User.lessonPremiumLock[sortedCurrentLessons[indexPath.row].lessonCode] != "unlock" {
            print("Buy this lesson on Shop or Become Premium User to Study this")
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "Buy this lesson on Shop or Become Premium User to study this", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        }else if ViewController.User.lessonStatus[sortedCurrentLessons[indexPath.row].lessonCode] != "unlock"{
            
            let alert1: UIAlertController = UIAlertController(title: "Notification", message: "Complete the previous lesson to learn this lesson", preferredStyle: UIAlertController.Style.alert)
            let btnOK1: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert1.addAction(btnOK1)
            
            present(alert1, animated: true, completion: nil)
            
            print("Finish previous Lesson!")
        
        } else {
            
            
            defaults.set(sortedCurrentLessons[indexPath.row].lessonCode, forKey: "currentLesson")
            performSegue(withIdentifier: "LessonToDetail", sender: self)
        }
    }
    
    
    
    
    @IBAction func CoursePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "ChooseCourse", sender: self)
    }
    
}
