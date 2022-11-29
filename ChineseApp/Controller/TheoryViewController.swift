//
//  TheoryViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 21/11/2022.
//

import UIKit

class TheoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var theoryTable: UITableView!
    
    
    var currentTheoryList = [Theory]()
    let defaults : UserDefaults = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get current Lesson
        let currentLesson : String = defaults.object(forKey: "currentLesson") as! String
        let currentTheorys = ViewController.theoryList.filter({ (theo1) -> Bool in
            return theo1.lessonCode == currentLesson
        })
        // Sort Lesson
        currentTheoryList =  currentTheorys.sorted(by: {Int($0.order) ?? 0 < Int($1.order) ?? 1})
        
        theoryTable.delegate = self
        theoryTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTheoryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTheory = tableView.dequeueReusableCell(withIdentifier: "cellTheory") as! TheoryTableViewCell
        cellTheory .headerLabel.text = " \(indexPath.row + 1). \(currentTheoryList[indexPath.row].name)"
        cellTheory .theory1Label.text = "   " + currentTheoryList[indexPath.row].theory1
        cellTheory .theory3Label.text =  "   " + currentTheoryList[indexPath.row].theory3

        cellTheory .theory2Label.text =  "   " + currentTheoryList[indexPath.row].theory2
        cellTheory .pinyinLabel.text =  "   " + currentTheoryList[indexPath.row].pinyin
        cellTheory .meanLabel.text =  "   " + currentTheoryList[indexPath.row].mean
        cellTheory .wordLabel.text =  "   " + currentTheoryList[indexPath.row].word

        cellTheory.selectionStyle = .none
        return cellTheory
    }
    
    @IBAction func backButtonPress(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}
