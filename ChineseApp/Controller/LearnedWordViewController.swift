//
//  LearnedWordViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 16/11/2022.
//

import UIKit

class LearnedWordViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var back_Button: UIButton!
    @IBOutlet weak var learnedwordTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        learnedwordTable.delegate = self
        learnedwordTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReviewPageViewController.learnedWord.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celllearnedWord = tableView.dequeueReusableCell(withIdentifier: "cellLearnedWord")
        celllearnedWord?.textLabel?.text = ReviewPageViewController.learnedWord[indexPath.row].word
        return celllearnedWord!
    }
    @IBAction func back_pressed(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    

}
