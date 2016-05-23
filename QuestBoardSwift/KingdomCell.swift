//
//  KingdomCell.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/18/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import SDWebImage


class KingdomCell: UITableViewCell {

    @IBOutlet weak var kImageView: UIImageView!
    @IBOutlet weak var kNameLabel: UILabel!
    
    func setCellValue(kingdom: Kingdom) -> Void {
        self.kImageView.setImageWithURL(kingdom.imageURL!)
        
        self.kNameLabel.text = kingdom.kingdomName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.kImageView.layer.masksToBounds = true
        self.kImageView.layer.cornerRadius = 25;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
