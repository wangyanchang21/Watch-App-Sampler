//
//  MapController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/26.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import MapKit

class MapController: WKInterfaceController {

    @IBOutlet var map: WKInterfaceMap!
    var coordinate: CLLocationCoordinate2D!
    var regionFlag = false
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Tian An Men Square
        coordinate = CLLocationCoordinate2DMake(39.909015, 116.397082)
        let point = MKMapPoint.init(coordinate)
        let distance: CLLocationDistance = 800
        map.setVisibleMapRect(MKMapRect.init(x: point.x, y: point.y, width: distance, height: distance))
    }
    
    @IBAction func changgeRegionAction() {
        if regionFlag {
            // Tian An Men Square
            coordinate = CLLocationCoordinate2DMake(39.909015, 116.397082)
            regionFlag = false
        } else {
            // Zhong Guan Cun Street
            coordinate = CLLocationCoordinate2DMake(39.983783, 116.316296)
            regionFlag = true
        }
        let distance: CLLocationDistance = 800
        let region: MKCoordinateRegion = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        map.setRegion(region)
    }
    
    @IBAction func addAnnotationAction() {
        if regionFlag {
            map.addAnnotation(coordinate, with: .red)
        } else {
            map.addAnnotation(coordinate, withImageNamed: "location", centerOffset: CGPoint(x: 0.0, y: 0.0))
        }
    }
    
    @IBAction func removeAllAnnotationAction() {
        map.removeAllAnnotations()
    }

}
