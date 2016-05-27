//
//  TutorialViewcontroller.swift
//  karousel
//
//  Created by Karan Khurana on 5/25/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class TutorialViewcontroller: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeButton: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        takeButton.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
            UIView.animateWithDuration(0.5) { () -> Void in
            self.takeButton.alpha = 1
            }
        }
        else {
            pageControl.hidden = false
            self.takeButton.alpha = 0
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
