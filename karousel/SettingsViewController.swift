//
//  SettingsViewController.swift
//  karousel
//
//  Created by Karan Khurana on 5/25/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 695)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func confirmSignOut() {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to Sign Out?", preferredStyle: .ActionSheet)

        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }
        // add the logout action to the alert controller
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
        confirmSignOut()
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
