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
    var questView: QuestView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetUp()
    }
    
    required init!(coder aDecoder: (NSCoder!)) {
        super.init(coder: aDecoder)
        
        xibSetUp()
    }
    
    func xibSetUp() {
        questView = loadViewFromNib() as! QuestView
        
        // use bounds not frame or it'll be offset
        questView.frame = bounds
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(questView)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "QuestView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func buildWithQuest(quests: Quest) -> Void {
        gImageView!.layer.masksToBounds = true
        gImageView!.layer.cornerRadius = 25
        
        qImageView!.contentScaleFactor = UIScreen.mainScreen().scale
        qImageView!.contentMode = UIViewContentMode.ScaleAspectFill
        qImageView!.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        qImageView!.clipsToBounds = true
        
        qImageView!.sd_setImageWithURL(quests.qImageURL)
        
        qNameLabel!.text = quests.questName
        qDescription!.text = quests.questDescription
        
        gImageView!.sd_setImageWithURL(quests.giver!.gImageURL)
        gNameLabel!.text = quests.giver!.giverName
    }
}
    

