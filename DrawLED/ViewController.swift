//
//  ViewController.swift
//  DrawLED
//
//  Created by khacviet on 11/21/16.
//  Copyright © 2016 khacviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var conditionX: UITextField!
    
    @IBOutlet weak var conditionY: UITextField!
    
    
    //    var n:Int = Int(quantityLED.text!)
    //    var n:Int = 0
    
    var x = 0
    var y = 0
    
    let widthMargin = 30
    let heightMargin = 70
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func DrawLED(sender: AnyObject)
    {
        for subview in self.view.subviews
        {
            if subview.tag == 0
            {
                subview.removeFromSuperview()
            }
        }
        
        if checkCondition() == true
        {
            draw()
        }
        
    }
    
    func checkCondition() -> Bool
    {
        if (Int(conditionX.text!) == nil  || Int(conditionY.text!) == nil)
        {
            return false
        }
        return true
    }
    
    func draw()
    {
        
        x = Int(conditionX.text!)!
        y = Int(conditionY.text!)!
        
        for indexX in 0..<x
        {
            for indexY in 0..<y
            {
                let image = UIImage(named: "greenLed")
                let greenLED = UIImageView(image: image)
                greenLED.center = CGPointMake(CGFloat(widthMargin) + (CGFloat(indexX) * setWidth()), CGFloat(heightMargin) + (CGFloat(indexY) * setHeight()))
                self.view.addSubview(greenLED)
            }
        }
    }
    
    func setWidth() -> CGFloat
    {
        let a = self.view.bounds.size.width
        var widthSpace:CGFloat = 0
        if conditionX.text! == "1"
        {
            widthSpace = 0
        }
        else
        {
            widthSpace = (a - (CGFloat(widthMargin) * 2)) / (CGFloat(x) - 1)
        }
        return widthSpace
    }
    
    func setHeight() -> CGFloat
    {
        let b = self.view.bounds.size.height
        var heightSpace: CGFloat = 0
        if conditionY.text! == "1"
        {
            heightSpace = 0
        }
        else
        {
            heightSpace = (b - (CGFloat(heightMargin) * 2)) / (CGFloat(y) - 1)
        }
        return heightSpace
    }
}

