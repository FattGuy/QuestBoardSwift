//
//  BaseNavigationController.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bgImage: UIImage = CommonUtil.imageWithColor(UIColor.init(rgba: OutstandingBlue))
        self.navigationBar.setBackgroundImage(bgImage, forBarMetrics:UIBarMetrics.Default)
        
        let backBarButtonItem = UIBarButtonItem.init(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        self.navigationBar.topItem?.backBarButtonItem = backBarButtonItem
        self.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
