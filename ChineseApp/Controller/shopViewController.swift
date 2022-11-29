//
//  shopViewController.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 18/11/2022.
//

import UIKit
import simd

class shopViewController: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowView2: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var chinese1CollectionView: UICollectionView!
    @IBOutlet weak var chinese2CollectionView: UICollectionView!
    
    var listChinese1 = [Lesson]()
    var listChinese2 = [Lesson]()
    let defaults : UserDefaults = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.titleLabel!.text = ""
        pointLabel.text = "Point: \(ViewController.User.point)"
        // Get list for chinese 1 and 2 in shop
        let chinese1Lesson = ViewController.lessonList.filter({ (less1) -> Bool in
            return less1.courseCode == "1"
        })
        listChinese1 = chinese1Lesson.filter({(less1) -> Bool in
            return ViewController.User.lessonPremiumLock[less1.lessonCode] != "unlock"
        })
        let chinese2Lesson = ViewController.lessonList.filter({ (less2) -> Bool in
            return less2.courseCode == "2"
        })
        listChinese2 = chinese2Lesson.filter({(less2) -> Bool in
            return ViewController.User.lessonPremiumLock[less2.lessonCode] != "unlock"
        })
        // set up view shadow
        getShadowforView(a: shadowView)
        getShadowforView(a: shadowView2)
        
        
        chinese1CollectionView.delegate = self
        chinese1CollectionView.dataSource = self
        
        chinese2CollectionView.dataSource = self
        chinese2CollectionView.delegate = self
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "ShopBackToPersonal", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.chinese1CollectionView {
            return listChinese1.count
        } else {
            return listChinese2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.chinese1CollectionView {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "chinese1Item", for: indexPath) as! ShopCollectionViewCell
            
            cell1.nameLabel.text = "Name: \(listChinese1[indexPath.row].name)"
            
            getShadowforCell(a: cell1)
            
            cell1.buyButton.tag = indexPath.row
            cell1.buyButton.addTarget(self, action: #selector(shopping1), for: .touchUpInside)
            return cell1
        } else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "chinese2Item", for: indexPath) as! shop2CollectionViewCell
            cell2.nameLabel.text = "Name: \(listChinese2[indexPath.row].name)"
            
            getShadowforCell(a: cell2)
            
            cell2.buyButton.tag = indexPath.row
            cell2.buyButton.addTarget(self, action: #selector(shopping2), for: .touchUpInside)
            return cell2
        }
    }
    @objc func shopping1(sender: UIButton){
        let indexPath1 = IndexPath(row: sender.tag, section: 0)
        print(indexPath1.row)
//        if(ViewController.User.point > 50 ){
//            ViewController.User.point -= 50
//        } else{
//            print("Deo Du diem ma mua")
//        }
        defaults.set(1000, forKey: "lessonPrice")
        defaults.set(listChinese1[indexPath1.row].name, forKey: "lessonName")
        defaults.set(listChinese1[indexPath1.row].lessonCode, forKey: "lessonCodeShop")
        performSegue(withIdentifier: "BuyChineseLesson", sender: self)
        
    }
    @objc func shopping2(sender: UIButton){
        let indexPath1 = IndexPath(row: sender.tag, section: 0)
        print(indexPath1.row)
//        if(ViewController.User.point > 60 ){
//            ViewController.User.point -= 60
//        } else{
//            print("Deo Du diem ma mua")
//        }
        defaults.set(1200, forKey: "lessonPrice")
        defaults.set(listChinese2[indexPath1.row].name, forKey: "lessonName")
        defaults.set(listChinese2[indexPath1.row].lessonCode, forKey: "lessonCodeShop")
        performSegue(withIdentifier: "BuyChineseLesson", sender: self)
    }
    // Get shadow for UIView and Cell
    func getShadowforView(a: UIView){
        a.layer.cornerRadius = 20
        a.layer.shadowOffset = CGSize.zero
        a.layer.shadowOpacity = 0.3
        a.layer.shadowRadius = 5.0
        a.layer.masksToBounds = false
        a.layer.borderWidth = 0.3
        a.layer.borderColor = UIColor.lightGray.cgColor
    }
    func getShadowforCell(a: UIView){
        a.layer.cornerRadius = 20
        a.layer.shadowOffset = CGSize.zero
        a.layer.shadowRadius = 5.0
        a.layer.masksToBounds = false
        a.layer.borderWidth = 0.3
        a.layer.borderColor = UIColor.lightGray.cgColor
    }

}
