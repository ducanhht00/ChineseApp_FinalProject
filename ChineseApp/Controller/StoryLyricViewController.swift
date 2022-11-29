//
//  StoryLyricViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 27/11/2022.
//

import UIKit
import AVFoundation

class StoryLyricViewController: UIViewController {
    var player: AVAudioPlayer!
    
    var pinyinString:NSString = ""
    var pinyin : String = ""
    var pinyinMutableString = NSMutableAttributedString()
    
    var wordString:NSString = ""
    var word : String = ""
    var wordMutableString = NSMutableAttributedString()
    
    var timer = Timer()
    var pinyinItemList = [PinyinItem]()
    var wordItemList = [WordItem]()
    let defaults : UserDefaults = UserDefaults()
    var soundName : String = ""
    var sentenceNumber : Int = 0
    var currentSentenceList = [Sentence]()
    
    @IBOutlet weak var pinyinlabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var meanLabel: UILabel!
    @IBOutlet weak var SentenceImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentStory : String = defaults.object(forKey: "currentStory") as! String 
        if currentStory == "0" {
            currentSentenceList = StoryMainViewController.story1_1
        } else if currentStory == "1" {
            currentSentenceList = StoryMainViewController.story1_2
        }
        SentenceImage.image = UIImage.init(named: currentSentenceList[sentenceNumber].topicName)
        meanLabel.text = currentSentenceList[sentenceNumber].mean
        pinyinItemList = currentSentenceList[sentenceNumber].pinyinList
        
        
//        [PinyinItem(time: 0.1, location: 0, length: 7),
//                          PinyinItem(time: 0.65, location: 7, length: 3),
//                          PinyinItem(time: 1.1, location: 10, length: 5),
//                          PinyinItem(time: 1.5, location: 16, length: 8),
//                          PinyinItem(time: 2.4, location: 0, length: 0)]
        wordItemList = currentSentenceList[sentenceNumber].wordList
        
//        [WordItem(time: 0.1, location: 0, length: 4),
//                        WordItem(time: 0.65, location: 4, length: 2),
//                        WordItem(time: 1.1, location: 6, length: 2),
//                        WordItem(time: 1.5, location: 8, length: 2),
//                        WordItem(time: 2.4, location: 0, length: 0)]
        pinyin = currentSentenceList[sentenceNumber].pinyin //"Nǐ hǎo, wǒ jiào wáng lì."
        pinyinString = pinyin as NSString
        pinyinMutableString = NSMutableAttributedString(string: pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        pinyinlabel.attributedText = pinyinMutableString
        
        word = currentSentenceList[sentenceNumber].word
        wordString = word as NSString
        wordMutableString = NSMutableAttributedString(string: wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        wordLabel.attributedText = wordMutableString
        // Do any additional setup after loading the view.
        let url1 = Bundle.main.url(forResource: currentSentenceList[sentenceNumber].nameSound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url1!)
        player.play()
        for n in pinyinItemList{
            if n.length == 0 {
                timer = Timer.scheduledTimer(withTimeInterval: n.time, repeats: false){_ in
                    self.pinyinMutableString = NSMutableAttributedString(string: self.pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                    self.pinyinlabel.attributedText = self.pinyinMutableString
                }
            } else {
                runPinyin(time: n.time, location: n.location, length: n.length)
            }
            
        }
        
        for n in wordItemList{
            if n.length == 0 {
                timer = Timer.scheduledTimer(withTimeInterval: n.time, repeats: false){_ in
                    self.wordMutableString = NSMutableAttributedString(string: self.wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                    self.wordLabel.attributedText = self.wordMutableString
                }
            } else {
                runWord(time: n.time, location: n.location, length: n.length)
            }
            
        }
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        let url1 = Bundle.main.url(forResource: currentSentenceList[sentenceNumber].nameSound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url1!)
        player.play()
        self.pinyinMutableString = NSMutableAttributedString(string: self.pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        self.pinyinlabel.attributedText = self.pinyinMutableString
        
        self.wordMutableString = NSMutableAttributedString(string: self.wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        self.wordLabel.attributedText = self.wordMutableString

        for n in pinyinItemList{
            if n.length == 0 {
                timer = Timer.scheduledTimer(withTimeInterval: n.time, repeats: false){_ in
                    self.pinyinMutableString = NSMutableAttributedString(string: self.pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                    self.pinyinlabel.attributedText = self.pinyinMutableString
                }
            } else {
                runPinyin(time: n.time, location: n.location, length: n.length)
            }
            
        }
        
        for n in wordItemList{
            if n.length == 0 {
                timer = Timer.scheduledTimer(withTimeInterval: n.time, repeats: false){_ in
                    self.wordMutableString = NSMutableAttributedString(string: self.wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                    self.wordLabel.attributedText = self.wordMutableString
                }
            } else {
                runWord(time: n.time, location: n.location, length: n.length)
            }
            
        }
        
    }
    func runPinyin(time: Double,location: Int, length: Int){
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: false){_ in
            self.pinyinMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location: location,length:length))
            self.pinyinlabel.attributedText = self.pinyinMutableString
        }
    }
    func runWord(time: Double,location: Int, length: Int){
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: false){_ in
            self.wordMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location: location,length:length))
            self.wordLabel.attributedText = self.wordMutableString
        }
    }
    
    @IBAction func backpressed(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    @IBAction func prevButton(_ sender: Any) {
        if sentenceNumber > 0 {
            if player.isPlaying == true {
                player.stop()
                self.pinyinMutableString = NSMutableAttributedString(string: self.pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                self.pinyinlabel.attributedText = self.pinyinMutableString
                
                self.wordMutableString = NSMutableAttributedString(string: self.wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                self.wordLabel.attributedText = self.wordMutableString
                let alert: UIAlertController = UIAlertController(title: "Notification", message: "Listen to all the information before changing sentences", preferredStyle: UIAlertController.Style.alert)
                let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(btnOK)
                
                present(alert, animated: true, completion: nil)
            } else {
                sentenceNumber -= 1
                pinyin = currentSentenceList[sentenceNumber].pinyin //"Nǐ hǎo, wǒ jiào wáng lì."
                pinyinString = pinyin as NSString
                pinyinMutableString = NSMutableAttributedString(string: pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                pinyinlabel.attributedText = pinyinMutableString
                
                word = currentSentenceList[sentenceNumber].word
                wordString = word as NSString
                wordMutableString = NSMutableAttributedString(string: wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                wordLabel.attributedText = wordMutableString
                    
                wordItemList = currentSentenceList[sentenceNumber].wordList
                pinyinItemList = currentSentenceList[sentenceNumber].pinyinList
                SentenceImage.image = UIImage.init(named: currentSentenceList[sentenceNumber].topicName)
                meanLabel.text = currentSentenceList[sentenceNumber].mean
            }
        
        
        
        
        } else {
            print("First sentance")
            
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "This is first sentence of Story", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func nextButton(_ sender: Any) {
        
        if sentenceNumber + 1 < currentSentenceList.count{
            if player.isPlaying == true {
                player.stop()
                self.pinyinMutableString = NSMutableAttributedString(string: self.pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                self.pinyinlabel.attributedText = self.pinyinMutableString
                
                self.wordMutableString = NSMutableAttributedString(string: self.wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                self.wordLabel.attributedText = self.wordMutableString
                let alert: UIAlertController = UIAlertController(title: "Notification", message: "Listen to all the information before changing sentences", preferredStyle: UIAlertController.Style.alert)
                let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(btnOK)
                
                present(alert, animated: true, completion: nil)
            } else {
                sentenceNumber += 1
                pinyin = currentSentenceList[sentenceNumber].pinyin //"Nǐ hǎo, wǒ jiào wáng lì."
                pinyinString = pinyin as NSString
                pinyinMutableString = NSMutableAttributedString(string: pinyinString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                pinyinlabel.attributedText = pinyinMutableString
                
                word = currentSentenceList[sentenceNumber].word
                wordString = word as NSString
                wordMutableString = NSMutableAttributedString(string: wordString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
                wordLabel.attributedText = wordMutableString
                
                wordItemList = currentSentenceList[sentenceNumber].wordList
                pinyinItemList = currentSentenceList[sentenceNumber].pinyinList
                SentenceImage.image = UIImage.init(named: currentSentenceList[sentenceNumber].topicName)
                meanLabel.text = currentSentenceList[sentenceNumber].mean
            }
            
            
        } else {
            print("last icon")
            let alert: UIAlertController = UIAlertController(title: "Notification", message: "This is last sentence of story", preferredStyle: UIAlertController.Style.alert)
            let btnOK: UIAlertAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    

}
