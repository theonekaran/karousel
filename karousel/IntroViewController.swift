//
//  IntroViewController.swift
//  karousel
//
//  Created by Karan Khurana on 5/24/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var tiles : [UIView]!
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 1136)
        tiles = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
        // Do any additional setup after loading the view.
        
        let offset = CGFloat(0)
        for index in 0...5 {
            updateTileTransformWithOffset(tiles[index], offset: offset, xOffset: CGFloat(xOffsets[index]), yOffset: CGFloat(yOffsets[index]), scale: CGFloat(scales[index]), rotation: CGFloat(rotations[index]))
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat!(scrollView.contentOffset.y)
       
        for index in 0...5 {
            updateTileTransformWithOffset(tiles[index], offset: offset, xOffset: CGFloat(xOffsets[index]), yOffset: CGFloat(yOffsets[index]), scale: CGFloat(scales[index]), rotation: CGFloat(rotations[index]))
            
        }
        
        
    }
    
    func updateTileTransformWithOffset(tileView: UIView, offset: CGFloat, xOffset: CGFloat, yOffset: CGFloat, scale: CGFloat, rotation: CGFloat) {
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffset, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffset , r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scale, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotation, r2Max: 0)
        
        tileView.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tileView.transform = CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
        tileView.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
    }
    
    
    
//    func getTransformValues (x: Double, y: Double, scale: Double, rot: Double){
//        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
