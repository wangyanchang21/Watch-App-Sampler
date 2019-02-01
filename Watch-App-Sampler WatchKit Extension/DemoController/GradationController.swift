//
//  GradationController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/27.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class GradationController: WKInterfaceController {
    
    @IBOutlet var image: WKInterfaceImage!
    
    
    @IBAction func drawGradientRectAction() {
        
        UIGraphicsBeginImageContext(CGSize(width: 120.0, height: 120.0))
        let ref = UIGraphicsGetCurrentContext()
        if let context = ref {
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let compoents:[CGFloat] = [0xfc/255, 0x68/255, 0x20/255, 1,
                                       0xfe/255, 0xd3/255, 0x2f/255, 1,
                                       0xb1/255, 0xfc/255, 0x33/255, 1]
            let locations:[CGFloat] = [0, 0.5, 1]
            let gradient = CGGradient(colorSpace: colorSpace,
                                      colorComponents: compoents,
                                      locations: locations,
                                      count: locations.count)!
            
            let startPoint = CGPoint(x: 0.0, y: 0.0)
            let endPoint = CGPoint(x: 120.0, y: 120.0)
            context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: .drawsBeforeStartLocation)
            
            
            UIGraphicsEndImageContext()
            let newImage = UIImage(cgImage: context.makeImage()!)
            image.setImage(newImage)
        }
    }
    
    @IBAction func drawGradientRoundAction() {
        
        UIGraphicsBeginImageContext(CGSize(width: 120.0, height: 120.0))
        let ref = UIGraphicsGetCurrentContext()
        if let context = ref {

            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let compoents:[CGFloat] = [0xfc/255, 0x68/255, 0x20/255, 1,
                                       0xfe/255, 0xd3/255, 0x2f/255, 1,
                                       0xb1/255, 0xfc/255, 0x33/255, 1]
            let locations:[CGFloat] = [0, 0.5, 1]
            let gradient = CGGradient(colorSpace: colorSpace, colorComponents: compoents,
                                      locations: locations, count: locations.count)!
            
            let center = CGPoint(x: 60.0, y: 60.0)
            let endRadius: CGFloat = 50.0
            let startRadius: CGFloat = endRadius / 3
            context.drawRadialGradient(gradient,
                                   startCenter: center,
                                   startRadius: startRadius,
                                   endCenter: center,
                                   endRadius: endRadius,
                                   options: .drawsBeforeStartLocation)
            
            UIGraphicsEndImageContext()
            let newImage = UIImage(cgImage: context.makeImage()!)
            image.setImage(newImage)
        }
    }
    
    @IBAction func drawGradientClipRectAction() {
        
        UIGraphicsBeginImageContext(CGSize(width: 120.0, height: 120.0))
        let ref = UIGraphicsGetCurrentContext()
        if let context = ref {
            
            let rect1 = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
            let rect2 = CGRect(x: 30.0, y: 30.0, width: 30.0, height: 30.0)
            let rect3 = CGRect(x: 60.0, y: 0.0, width: 30.0, height: 30.0)
            let rect4 = CGRect(x: 90.0, y: 30.0, width: 30.0, height: 30.0)
            let rect5 = CGRect(x: 0.0, y: 60.0, width: 30.0, height: 30.0)
            let rect6 = CGRect(x: 60.0, y: 60.0, width: 30.0, height: 30.0)
            context.clip(to: [rect1, rect2, rect3, rect4, rect5, rect6])
            
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let compoents:[CGFloat] = [0xfc/255, 0x68/255, 0x20/255, 1,
                                       0xfe/255, 0xd3/255, 0x2f/255, 1,
                                       0xb1/255, 0xfc/255, 0x33/255, 1]
            let locations:[CGFloat] = [0, 0.5, 1]
            let gradient = CGGradient(colorSpace: colorSpace, colorComponents: compoents,
                                      locations: locations, count: locations.count)!
            
            let start = CGPoint(x: 0.0, y: 0.0)
            let end = CGPoint(x: 120.0, y: 120.0)
            context.drawLinearGradient(gradient, start: start, end: end,
                                       options: .drawsBeforeStartLocation)
            
            UIGraphicsEndImageContext()
            let newImage = UIImage(cgImage: context.makeImage()!)
            image.setImage(newImage)
        }
    }
    
}
