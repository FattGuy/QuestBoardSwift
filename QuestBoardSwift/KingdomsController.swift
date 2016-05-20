//
//  KingdomsController.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/18/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import SVProgressHUD
import Gloss

class KingdomsController: UITableViewController {
    
    var kingdomList: Array<Kingdom> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let user = User(name:"", email:"")
        user.email = UserDefaultsUtil.getEmail()
        self.navigationItem.title = user.email

        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData() -> Void {
        
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
        SVProgressHUD.showWithStatus("Loading")
        
        KingdomClient.getEmailList { (success) in
            SVProgressHUD.dismiss()
            
            //print(success)
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return kingdomList.count
    }

    @IBAction func logOutAction(sender: AnyObject) {
        UserDefaultsUtil.saveEmail("")
        
        let loginController: LoginController = self.storyboard!.instantiateViewControllerWithIdentifier("LoginController") as! LoginController
        //loginController.isFromLogOut = true;
        self.navigationController?.presentViewController(loginController, animated: true, completion: { 
            
        })
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:KingdomCell = tableView.dequeueReusableCellWithIdentifier("KingdomCell", forIndexPath: indexPath) as! KingdomCell
        //Configure the cell...
        cell.setCellValue(kingdomList[indexPath.row])

        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
