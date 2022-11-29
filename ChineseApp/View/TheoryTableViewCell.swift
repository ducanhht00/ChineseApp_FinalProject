//
//  TheoryTableViewCell.swift
//  ChineseApp
//
//  Created by HoangDucAnh on 21/11/2022.
//

import UIKit

class TheoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel:UILabel!
    @IBOutlet weak var theory1Label:UILabel!
    @IBOutlet weak var forExample:UILabel!
    @IBOutlet weak var pinyinLabel:UILabel!
    @IBOutlet weak var wordLabel:UILabel!
    @IBOutlet weak var meanLabel:UILabel!
    @IBOutlet weak var theory2Label:UILabel!
    @IBOutlet weak var theory3Label:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
