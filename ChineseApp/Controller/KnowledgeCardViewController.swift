//
//  KnowledgeCardViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 26/11/2022.
//

import UIKit

class KnowledgeCardViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var cardCollection: UICollectionView!
    
    
    var listlearnedCard = [TheoryCard]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addList()

        cardCollection.delegate = self
        cardCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listlearnedCard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        cardCell.theory.text = listlearnedCard[indexPath.row].theory
        cardCell.lessonName.text = listlearnedCard[indexPath.row].lessonName
        cardCell.maincontent.text = listlearnedCard[indexPath.row].mainContent
        cardCell.supportContent.text = listlearnedCard[indexPath.row].supportContent
        cardCell.pinyin1.text = listlearnedCard[indexPath.row].pinyin1
        cardCell.word1.text = listlearnedCard[indexPath.row].word1
        cardCell.mean1.text = listlearnedCard[indexPath.row].mean1
        cardCell.pinyin2.text = listlearnedCard[indexPath.row].pinyin2
        cardCell.word2.text = listlearnedCard[indexPath.row].word2
        cardCell.mean2.text = listlearnedCard[indexPath.row].mean2
        cardCell.layer.cornerRadius = 20
//        cardCell.layer.shadowOffset = CGSize.zero
//        cardCell.layer.shadowOpacity = 0.3
//        cardCell.layer.shadowRadius = 5.0
//        cardCell.layer.masksToBounds = false
        cardCell.layer.borderWidth = 0.3
        cardCell.layer.borderColor = UIColor.lightGray.cgColor
        return cardCell
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func addList(){
        listlearnedCard.append(TheoryCard(id: "1", lessonCode: "1.1", lessonName: "basic 1", mainContent: "Chinese Sentence Structure", supportContent: "", theory: "Basic sentence word order of Chinese is very similar to that of English, which is: Subject + Verb + Object (SVO)"
, pinyin1: "W?? sh?? zh??nggu?? r??n", word1: "???????????????", mean1: "I am Chinese", pinyin2: "T??men x??hu??n f??gu?? r??n", word2: "?????????????????????", mean2: "They like the French"))
        listlearnedCard.append(TheoryCard(id: "1", lessonCode: "1.2", lessonName: "basic 2", mainContent: "Chinese Sentence Structure", supportContent: "", theory: "Basic sentence word order of Chinese is very similar to that of English, which is: Subject + Verb + Object (SVO)"
, pinyin1: "W?? sh?? zh??nggu?? r??n", word1: "???????????????", mean1: "I am Chinese", pinyin2: "T??men x??hu??n f??gu?? r??n", word2: "?????????????????????", mean2: "They like the French"))
        listlearnedCard.append(TheoryCard(id: "1", lessonCode: "1.1", lessonName: "basic 3", mainContent: "Chinese Sentence Structure", supportContent: "", theory: "Basic sentence word order of Chinese is very similar to that of English, which is: Subject + Verb + Object (SVO)"
, pinyin1: "W?? sh?? zh??nggu?? r??n", word1: "???????????????", mean1: "I am Chinese", pinyin2: "T??men x??hu??n f??gu?? r??n", word2: "?????????????????????", mean2: "They like the French"))
        listlearnedCard.append(TheoryCard(id: "1", lessonCode: "1.1", lessonName: "Color", mainContent: "Adjective + Noun", supportContent: "", theory: "In Chinese, adjectives are usually placed in front of the noun"
, pinyin1: "H??ng ji??", word1: "??? ???", mean1: "Red Wine", pinyin2: "L?? ch??", word2: "??? ???", mean2: "Green Tea"))
    }
    
}
