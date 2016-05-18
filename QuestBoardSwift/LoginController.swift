//
//  LoginController.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //let user: User
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func textFieldReturn(sender: UITextField) {
        self.nameTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
    }
    
    @IBAction func submitInfoButton(sender: UIButton) {
        let user = User(name: self.nameTextField.text!, email: self.emailTextField.text!)
        
        let state: SignUpState = CommonUtil.isValidEmail(user.email)
        
        let isFromLogOut: Bool = true
        
        if state == SignUpState.Correct {
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
            SVProgressHUD.show()
            SignUpClient.signUp(user, success: { (success) in
                SVProgressHUD.showInfoWithStatus("message")
                if !isFromLogOut {
                    self.dismissViewControllerAnimated(true, completion: { 
                        
                    })
                } else {
                    self.performSegueWithIdentifier("SignUpSegue", sender: nil)
                }
                
                UserDefaultsUtil.saveEmail(user.email)
            })
        } else if state == SignUpState.EmptyEmail {
            SVProgressHUD.showErrorWithStatus("Email cannot be blank")
        } else {
            SVProgressHUD.showErrorWithStatus("Wrong Email")
        }
        
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
