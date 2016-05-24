	//
//  QuestView.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/23/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import SDWebImage

class QuestView: UIView {

    @IBOutlet weak var qImageView: UIImageView?
    @IBOutlet weak var qNameLabel: UILabel?
    @IBOutlet weak var qDescription: UILabel?
    @IBOutlet weak var gImageView: UIImageView?
    @IBOutlet weak var gNameLabel: UILabel?
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    static func instanceFromNib() -> QuestView {
        return NSBundle.mainBundle().loadNibNamed("QuestView", owner: nil, options: nil)[0] as! QuestView
    }
    
    func buildWithQuest(quests: Quest) -> Void {
        gImageView!.layer.masksToBounds = true
        gImageView!.layer.cornerRadius = 25
        
        qImageView!.contentScaleFactor = UIScreen.mainScreen().scale
        qImageView!.contentMode = UIViewContentMode.ScaleAspectFill
        qImageView!.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        qImageView!.clipsToBounds = true
        
        qImageView!.sd_setImageWithURL(quests.qImageURL, placeholderImage: nil, options: SDWebImageOptions.ProgressiveDownload)
        
        qNameLabel!.text = quests.questName
        qDescription!.text = quests.questDescription
        
        gImageView!.sd_setImageWithURL(quests.giver!.gImageURL)
        gNameLabel!.text = quests.giver!.giverName
    }
}
    

