//
//  KingdomDetailController.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import SVProgressHUD
import Gloss

class KingdomDetailController: UIViewController {

    @IBOutlet weak var kImageView: UIImageView!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var selectedKingdomId: Int!
    var kingdomDetailList = KingdomDetail()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() -> Void {
        
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
        SVProgressHUD.showWithStatus("Loading")
        
        KingdomDetailClient.getKingdomDetailList(self.selectedKingdomId) { [weak self] (success) in
            SVProgressHUD.dismiss()
            self!.kingdomDetailList = success as! KingdomDetail
            
            self?.setUpTopRegion()
        }
    }

    func setUpTopRegion() -> Void {
        self.climateLabel.text = self.kingdomDetailList.climate
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
