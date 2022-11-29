//
//  VocabularyViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 11/11/2022.
//

import UIKit
import AVFoundation

class VocabularyViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var wordtable: UITableView!
    var player: AVAudioPlayer!
    var vocabList = [Word]()
    let defaults : UserDefaults = UserDefaults()
    override func viewDidLoad() {
        
        // Get current Lesson
        let currentLesson : String = defaults.object(forKey: "currentLesson") as! String
        let currentWords = ViewController.wordList.filter({ (less1) -> Bool in
            return less1.lessonCode == currentLesson
        })
        // Sort Lesson
        vocabList = currentWords.sorted(by: {Int($0.order) ?? 0 < Int($1.order) ?? 1})
        
        super.viewDidLoad()
        wordtable.dataSource = self
        wordtable.delegate = self
        
    }
    
    @IBAction func BackButtonToDetail(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellWord = tableView.dequeueReusableCell(withIdentifier: "CellWord") as! VocabTableViewCell
        //CellWord?.textLabel?.text = vocabList[indexPath.row].word
        CellWord.wordLabel.text = vocabList[indexPath.row].word
        CellWord.pinyinLabel.text = vocabList[indexPath.row].pinyin
        CellWord.meanLabel.text = vocabList[indexPath.row].mean
        CellWord.meanLabel.textColor = .gray
        CellWord.pinyinLabel.textColor = .gray
        return CellWord
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // play sound
        let url = Bundle.main.url(forResource: vocabList[indexPath.row].word, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
