//
//  StoryMainViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 27/11/2022.
//

import UIKit

class StoryMainViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    static var story1_1 = [Sentence]()
    static var story1_2 = [Sentence]()
    let defaults : UserDefaults = UserDefaults()
    var storyList = ["Introduction","Food"]
    
    @IBOutlet weak var storyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        storyTableView.delegate = self
        storyTableView.dataSource = self
        loadSentence()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let storyCell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath)
        storyCell.textLabel?.text = storyList[indexPath.row]
        
        return storyCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        defaults.set("\(indexPath.row)", forKey: "currentStory")
        print(indexPath.row)
        performSegue(withIdentifier: "StorySergue", sender: self)
    }
    @IBAction func backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: false)
    }
    func loadSentence(){
        StoryMainViewController.story1_1 = [Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 7),
                                                                  PinyinItem(time: 0.65, location: 7, length: 3),
                                                                  PinyinItem(time: 1.1, location: 10, length: 5),
                                                                  PinyinItem(time: 1.5, location: 16, length: 8),
                                                                  PinyinItem(time: 2.4, location: 0, length: 0)],
                                                     wordList: [WordItem(time: 0.1, location: 0, length: 4),
                                                                WordItem(time: 0.65, location: 4, length: 2),
                                                                WordItem(time: 1.1, location: 6, length: 2),
                                                                WordItem(time: 1.5, location: 8, length: 2),
                                                                WordItem(time: 2.4, location: 0, length: 0)],
                                                     nameSound: "story1_1",
                                                     word: "你好 ,我 叫 王丽。",
                                                     pinyin: "Nǐ hǎo, wǒ jiào wáng lì.",
                                                     mean: "Hello, I'm Wang Li",
                                                     topicName: "Story1_1",
                                                     order: 0),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 2),
                                                                                                      PinyinItem(time: 0.65, location: 2, length: 4),
                                                                                                      PinyinItem(time: 1.0, location: 6, length: 9),
                                                                                                      PinyinItem(time: 1.4, location: 15, length: 4),
                                                                                                      PinyinItem(time: 2.2, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.65, location: 2, length: 1),
                                                                                                    WordItem(time: 1.0, location: 4, length: 2),
                                                                                                    WordItem(time: 1.4, location: 6, length: 2),
                                                                                                    WordItem(time: 2.2, location: 0, length: 0)],
                                                                                         nameSound: "story1_2",
                                                                                         word: "我 是 中国 人。",
                                                                                         pinyin: "Wǒ shì zhōngguó rén.",
                                                                                         mean: "I'm Chinese",
                                                                                         topicName: "Story1_2",
                                                                                         order: 1),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 2),
                                                                                                      PinyinItem(time: 0.4, location: 2, length: 5),
                                                                                                      PinyinItem(time: 0.8, location: 7, length: 7),
                                                                                                      PinyinItem(time: 1.25, location: 14, length: 7),
                                                                                                      PinyinItem(time: 2.1, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.4, location: 2, length: 1),
                                                                                                    WordItem(time: 0.8, location: 4, length: 2),
                                                                                                    WordItem(time: 1.25, location: 6, length: 3),
                                                                                                    WordItem(time: 2.1, location: 0, length: 0)],
                                                                                         nameSound: "story1_3",
                                                                                         word: "你 叫 什么 名字 ？",
                                                                                         pinyin: "Nǐ jiào shénme míngzì?",
                                                                                         mean: "What's your name?",
                                                                                         topicName: "Story1_3",
                                                                                         order: 2),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 3),
                                                                                                      PinyinItem(time: 0.45, location: 3, length: 8),
                                                                                                      PinyinItem(time: 0.9, location: 11, length: 7),
                                                                                                      PinyinItem(time: 1.4, location: 18, length: 3),
                                                                                                      PinyinItem(time: 2.0, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.45, location: 2, length: 2),
                                                                                                    WordItem(time: 0.9, location: 4, length: 3),
                                                                                                    WordItem(time: 1.4, location: 7, length: 2),
                                                                                                    WordItem(time: 2.0, location: 0, length: 0)],
                                                                                         nameSound: "story1_4",
                                                                                         word: "很 高兴 认识 你。",
                                                                                         pinyin: "Hěn gāoxìng rènshí nǐ.",
                                                                                         mean: "Nice to meet you.",
                                                                                         topicName: "Story1_4",
                                                                                         order: 3),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 7),
                                                                  PinyinItem(time: 0.7, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 3),
                                                                                                    WordItem(time: 0.7, location: 0, length: 0)],
                                                                                         nameSound: "story1_5",
                                                                                         word: "再见 ！",
                                                                                         pinyin: "Zàijiàn!",
                                                                                         mean: "goodbye !",
                                                                                         topicName: "Story1_5",
                                                                                         order: 4) ]
        StoryMainViewController.story1_2 = [Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 7),
                                                                  PinyinItem(time: 0.65, location: 7, length: 3),
                                                                  PinyinItem(time: 1.1, location: 10, length: 5),
                                                                  PinyinItem(time: 1.5, location: 16, length: 8),
                                                                  PinyinItem(time: 2.4, location: 0, length: 0)],
                                                     wordList: [WordItem(time: 0.1, location: 0, length: 4),
                                                                WordItem(time: 0.65, location: 4, length: 2),
                                                                WordItem(time: 1.1, location: 6, length: 2),
                                                                WordItem(time: 1.5, location: 8, length: 2),
                                                                WordItem(time: 2.4, location: 0, length: 0)],
                                                     nameSound: "story2_1",
                                                     word: "你好 ,我 叫 王丽。",
                                                     pinyin: "Nǐ hǎo, wǒ jiào wáng lì.1",
                                                     mean: "Hello, I'm Wang Li",
                                                     topicName: "Story1_1",
                                                     order: 0),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 2),
                                                                                                      PinyinItem(time: 0.65, location: 2, length: 4),
                                                                                                      PinyinItem(time: 1.0, location: 6, length: 9),
                                                                                                      PinyinItem(time: 1.4, location: 15, length: 4),
                                                                                                      PinyinItem(time: 2.2, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.65, location: 2, length: 1),
                                                                                                    WordItem(time: 1.0, location: 4, length: 2),
                                                                                                    WordItem(time: 1.4, location: 6, length: 2),
                                                                                                    WordItem(time: 2.2, location: 0, length: 0)],
                                                                                         nameSound: "story2_2",
                                                                                         word: "我 是 中国 人。",
                                                                                         pinyin: "Wǒ shì zhōngguó rén.",
                                                                                         mean: "I'm Chinese",
                                                                                         topicName: "Story1_2",
                                                                                         order: 1),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 2),
                                                                                                      PinyinItem(time: 0.4, location: 2, length: 5),
                                                                                                      PinyinItem(time: 0.8, location: 7, length: 7),
                                                                                                      PinyinItem(time: 1.25, location: 14, length: 7),
                                                                                                      PinyinItem(time: 2.1, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.4, location: 2, length: 1),
                                                                                                    WordItem(time: 0.8, location: 4, length: 2),
                                                                                                    WordItem(time: 1.25, location: 6, length: 3),
                                                                                                    WordItem(time: 2.1, location: 0, length: 0)],
                                                                                         nameSound: "story2_3",
                                                                                         word: "你 叫 什么 名字 ？",
                                                                                         pinyin: "Nǐ jiào shénme míngzì?",
                                                                                         mean: "What's your name?",
                                                                                         topicName: "Story1_3",
                                                                                         order: 2),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 3),
                                                                                                      PinyinItem(time: 0.45, location: 3, length: 8),
                                                                                                      PinyinItem(time: 0.9, location: 11, length: 7),
                                                                                                      PinyinItem(time: 1.4, location: 18, length: 3),
                                                                                                      PinyinItem(time: 2.0, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.45, location: 2, length: 2),
                                                                                                    WordItem(time: 0.9, location: 4, length: 3),
                                                                                                    WordItem(time: 1.4, location: 7, length: 2),
                                                                                                    WordItem(time: 2.0, location: 0, length: 0)],
                                                                                         nameSound: "story2_4",
                                                                                         word: "很 高兴 认识 你。",
                                                                                         pinyin: "Hěn gāoxìng rènshí nǐ.",
                                                                                         mean: "Nice to meet you.",
                                                                                         topicName: "Story1_4",
                                                                                         order: 3),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 3),
                                                                                                      PinyinItem(time: 0.45, location: 3, length: 8),
                                                                                                      PinyinItem(time: 0.9, location: 11, length: 7),
                                                                                                      PinyinItem(time: 1.4, location: 18, length: 3),
                                                                                                      PinyinItem(time: 2.0, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.45, location: 2, length: 2),
                                                                                                    WordItem(time: 0.9, location: 4, length: 3),
                                                                                                    WordItem(time: 1.4, location: 7, length: 2),
                                                                                                    WordItem(time: 2.0, location: 0, length: 0)],
                                                                                         nameSound: "story2_5",
                                                                                         word: "很 高兴 认识 你。",
                                                                                         pinyin: "Hěn gāoxìng rènshí nǐ.",
                                                                                         mean: "Nice to meet you.",
                                                                                         topicName: "Story1_4",
                                                                                         order: 3),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 3),
                                                                                                      PinyinItem(time: 0.45, location: 3, length: 8),
                                                                                                      PinyinItem(time: 0.9, location: 11, length: 7),
                                                                                                      PinyinItem(time: 1.4, location: 18, length: 3),
                                                                                                      PinyinItem(time: 2.0, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.45, location: 2, length: 2),
                                                                                                    WordItem(time: 0.9, location: 4, length: 3),
                                                                                                    WordItem(time: 1.4, location: 7, length: 2),
                                                                                                    WordItem(time: 2.0, location: 0, length: 0)],
                                                                                         nameSound: "story2_6",
                                                                                         word: "很 高兴 认识 你。",
                                                                                         pinyin: "Hěn gāoxìng rènshí nǐ.",
                                                                                         mean: "Nice to meet you.",
                                                                                         topicName: "Story1_4",
                                                                                         order: 3),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 3),
                                                                                                      PinyinItem(time: 0.45, location: 3, length: 8),
                                                                                                      PinyinItem(time: 0.9, location: 11, length: 7),
                                                                                                      PinyinItem(time: 1.4, location: 18, length: 3),
                                                                                                      PinyinItem(time: 2.0, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 1),
                                                                                                    WordItem(time: 0.45, location: 2, length: 2),
                                                                                                    WordItem(time: 0.9, location: 4, length: 3),
                                                                                                    WordItem(time: 1.4, location: 7, length: 2),
                                                                                                    WordItem(time: 2.0, location: 0, length: 0)],
                                                                                         nameSound: "story2_7",
                                                                                         word: "很 高兴 认识 你。",
                                                                                         pinyin: "Hěn gāoxìng rènshí nǐ.",
                                                                                         mean: "Nice to meet you.",
                                                                                         topicName: "Story1_4",
                                                                                         order: 3),
                                            Sentence(pinyinList: [PinyinItem(time: 0.1, location: 0, length: 7),
                                                                  PinyinItem(time: 0.7, location: 0, length: 0)],
                                                                                         wordList: [WordItem(time: 0.1, location: 0, length: 3),
                                                                                                    WordItem(time: 0.7, location: 0, length: 0)],
                                                                                         nameSound: "story2_8",
                                                                                         word: "再见 ！",
                                                                                         pinyin: "Zàijiàn!",
                                                                                         mean: "goodbye !",
                                                                                         topicName: "Story1_5",
                                                                                         order: 4) ]
    }
    
}
