//
//  HealthController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/26.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import HealthKit

class HealthController: WKInterfaceController {
    
    @IBOutlet weak var label: WKInterfaceLabel!
    @IBOutlet weak var startBtn: WKInterfaceButton!
    
    let healthStore = HKHealthStore()
    let heartRateType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
    let heartRateUnit = HKUnit(from: "count/min")
    var heartRateQuery: HKQuery?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
//        let state = healthStore.authorizationStatus(for: )
//        if state != .sharingAuthorized {
//            print("Please Authorize In Your iPhone App")
//            return
//        }

        let dataTypes = Set([heartRateType])
        healthStore.requestAuthorization(toShare: nil, read: dataTypes) { (success, error) -> Void in
            guard success else {
                self.label.setText("Not Allowed")
                return
            }
        }
    }
    
    @IBAction func fetchBtnTapped() {
        
        if !HKHealthStore.isHealthDataAvailable() {
            label.setText("Not Available")
            return
        }
        
        guard heartRateQuery == nil else { return }
        
        if heartRateQuery == nil {
            // start
            heartRateQuery = self.createStreamingQuery()
            healthStore.execute(self.heartRateQuery!)
            startBtn.setTitle("Stop")
        }
        else {
            // stop
            healthStore.stop(self.heartRateQuery!)
            heartRateQuery = nil
            startBtn.setTitle("Start")
        }
    }
    
    
    // =========================================================================
    // MARK: - Private
    
    private func createStreamingQuery() -> HKQuery {
        let predicate = HKQuery.predicateForSamples(withStart: NSDate() as Date, end: nil, options: [])
        
        let query = HKAnchoredObjectQuery(type: heartRateType, predicate: predicate, anchor: nil, limit: Int(HKObjectQueryNoLimit)) { (query, samples, deletedObjects, anchor, error) -> Void in
            self.addSamples(samples: samples)
        }
        query.updateHandler = { (query, samples, deletedObjects, anchor, error) -> Void in
            self.addSamples(samples: samples)
        }
        
        return query
    }
    
    private func addSamples(samples: [HKSample]?) {
        guard let samples = samples as? [HKQuantitySample] else { return }
        guard let quantity = samples.last?.quantity else { return }
        label.setText("\(quantity.doubleValue(for: heartRateUnit))")
    }
}
