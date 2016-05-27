//
//  SignInViewController.swift
//  karousel
//
//  Created by Karan Khurana on 5/24/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120


        // Do any additional setup after loading the view.
    }
    
    // The main view is about to appear...
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        buttonParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
        buttonParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.5) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            self.buttonParentView.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
            self.buttonParentView.alpha = 1
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -50 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            self.display_error("Email/Password Required", msg: "Please enter your email/password")
        }
        else {
            // Start animating the activity indicator
            loginIndicator.startAnimating()
            // Delay for 2 second.
            delay (2) {
                if self.emailField.text == "correctEmail" && self.passwordField.text == "password" {
                    self.performSegueWithIdentifier("tutorialSegue", sender: self)
                }
                else {
                    self.display_error("Invalid Email/Password", msg: "Please enter a valid email or password")
                }
                self.loginIndicator.stopAnimating()
            }
        }
        
        
    }

    func display_error( tit: String, msg: String) {
        let alertController = UIAlertController(title: tit, message: msg, preferredStyle: .Alert)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
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
