//
//  MainPageCollectionViewCell.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 16/11/2022.
//

import UIKit

class MainPageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lessonIcon: UIImageView!
    @IBOutlet weak var lessonNameText: UILabel!
    func setup(with lesson: Lesson){
        lessonIcon.image = UIImage.init(named: lesson.name)
        lessonNameText.text = lesson.name
    }
    func logLesson(){
        lessonIcon.image = UIImage.init(named: "lock")
    }
    
}
