//
//  LearnedWordViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 16/11/2022.
//

import UIKit
import AVFoundation

class LearnedWordViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    var player: AVAudioPlayer!
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
        let celllearnedWord = tableView.dequeueReusableCell(withIdentifier: "cellLearnedWord") as! LearnedWordTableViewCell
        celllearnedWord.wordLabel.text = ReviewPageViewController.learnedWord[indexPath.row].word
        celllearnedWord.meanLabel.text = ReviewPageViewController.learnedWord[indexPath.row].mean
        celllearnedWord.pinyinLabel.text = ReviewPageViewController.learnedWord[indexPath.row].pinyin
        return celllearnedWord
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let url = Bundle.main.url(forResource: ReviewPageViewController.learnedWord[indexPath.row].word, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    @IBAction func back_pressed(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    

}
