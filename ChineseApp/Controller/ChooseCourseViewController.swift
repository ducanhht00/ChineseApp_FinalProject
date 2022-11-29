//
//  ChooseCourseViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 16/10/2022.
//

import UIKit
import Firebase

class ChooseCourseViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    let defaults : UserDefaults = UserDefaults()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedCurrentCourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ChooseCourseTableViewCell
        //cell?.textLabel?.text =  sortedCurrentCourse[indexPath.row].name + " - " + sortedCurrentCourse[indexPath.row].level
        cell.layer.cornerRadius = 20
        cell.nameCourseLabel.text = sortedCurrentCourse[indexPath.row].name
        cell.levelCourseLabel.text = sortedCurrentCourse[indexPath.row].level
        cell.descriptionCourseLabel.text = sortedCurrentCourse[indexPath.row].description
        cell.coursePic.image = UIImage.init(named: sortedCurrentCourse[indexPath.row].name)
        
        cell.chooseCourseUIView.layer.cornerRadius = 20
        cell.chooseCourseUIView.layer.shadowOffset = CGSize.zero
        cell.chooseCourseUIView.layer.shadowOpacity = 0.3
        cell.chooseCourseUIView.layer.shadowRadius = 5.0
        cell.chooseCourseUIView.layer.masksToBounds = false
        cell.chooseCourseUIView.layer.borderWidth = 0.3
        cell.chooseCourseUIView.layer.borderColor = UIColor.lightGray.cgColor
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        defaults.set(sortedCurrentCourse[indexPath.row].courseCode, forKey: "currentCourse")
        performSegue(withIdentifier: "returnToMain", sender: self)
        
    }
    var currentCourse = [Course]()
    var sortedCurrentCourse = [Course]()

    override func viewDidLoad() {
        // Get current Lesson
        currentCourse = ViewController.courseList
        // Sort Lesson
        sortedCurrentCourse = currentCourse.sorted(by: {$0.courseCode < $1.courseCode})
        //print("Course List ne : \(currentCourse)")
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    
    }
   
}
