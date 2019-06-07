//
//  ComplicationController.swift
//  WatchApp WatchKit Extension
//
//  Created by DCSnail on 2018/6/6.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  WatchOS表盘功开发教程: https://blog.csdn.net/wangyanchang21/article/details/81072477

import ClockKit
import WatchKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    let startDate = Date()
    
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(startDate)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(Date(timeInterval: 60*60*24, since: startDate))
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Get the complication data from the extension delegate.
        
        // Default
        handler(nil)
        
//        // Custom
//        let tuple = configureTemplateAndEntry(complication: complication)
//        handler(tuple.1)
    }
    
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        
        // Default
        handler(nil)

//        // Custom
//        var array: [CLKComplicationTimelineEntry] = Array()
//        let colorArray = [UIColor.red, UIColor.yellow, UIColor.blue, UIColor.green, UIColor.white]
//
//        for index in 0...4 {
//            if array.count < limit {
//                let newDate = Date(timeInterval: TimeInterval(120 * index), since: startDate)
//                let template = configureTemplateAndEntry(complication: complication).0
//                template?.tintColor = colorArray[index]
//                let entry = CLKComplicationTimelineEntry(date: newDate, complicationTemplate: template!)
//                array.append(entry)
//            }
//        }
//        handler(array)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        
        // Default Complication Image
        handler(nil)
        
//        // Custom
//        let tuple = configureTemplateAndEntry(complication: complication)
//        handler(tuple.0)
    }
    
    
    func configureTemplateAndEntry(complication: CLKComplication) -> (CLKComplicationTemplate?, CLKComplicationTimelineEntry?) {
        
        var entry: CLKComplicationTimelineEntry?
        let now = Date()
        
        switch complication.family {
        case .modularSmall:
            //            let template = CLKComplicationTemplateModularSmallSimpleImage()
            //            template.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "complicationIcon")!)
            //            template.imageProvider.tintColor = .orange
            let template = CLKComplicationTemplateModularSmallSimpleText()
            template.textProvider = CLKSimpleTextProvider(text: "MS")
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
            
        case .modularLarge:
            let template = CLKComplicationTemplateModularLargeStandardBody()
            template.headerImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "complicationIcon")!)
            template.headerImageProvider?.tintColor = .orange
            template.headerTextProvider = CLKSimpleTextProvider(text: "ML")
            template.body1TextProvider = CLKSimpleTextProvider(text: "content is blank")
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
            
        case .circularSmall:
            let template = CLKComplicationTemplateCircularSmallStackImage()
            template.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "complicationIcon")!)
            template.line1ImageProvider.tintColor = .orange
            template.line2TextProvider = CLKSimpleTextProvider(text: "CS")
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
            
        case .utilitarianSmall:
            let template = CLKComplicationTemplateUtilitarianSmallRingText()
            template.textProvider = CLKSimpleTextProvider(text: "CS")
            template.ringStyle = .open
            template.fillFraction = 0.66
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
            
        case .utilitarianLarge:
            let template = CLKComplicationTemplateUtilitarianLargeFlat()
            template.textProvider = CLKSimpleTextProvider(text: "UL")
            template.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "complicationIcon")!)
            template.imageProvider?.tintColor = .orange
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
            
        case .utilitarianSmallFlat:
            let template = CLKComplicationTemplateUtilitarianSmallFlat()
            template.textProvider = CLKSimpleTextProvider(text: "USF")
            template.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "complicationIcon")!)
            template.imageProvider?.tintColor = .orange
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
            
        case .extraLarge:
            let template = CLKComplicationTemplateExtraLargeStackImage()
            template.line2TextProvider = CLKSimpleTextProvider(text: "EL")
            template.highlightLine2 = true
            template.line1ImageProvider = CLKImageProvider(onePieceImage: UIImage(named: "complicationIcon")!)
            template.line1ImageProvider.tintColor = .orange
            entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)

            // following templates are addition to watchOS 5.0
        case .graphicCorner:
                let template = CLKComplicationTemplateGraphicCornerGaugeText()
                template.leadingTextProvider = CLKSimpleTextProvider(text: "GC1")
                template.trailingTextProvider = CLKSimpleTextProvider(text: "GC2")
                template.outerTextProvider = CLKSimpleTextProvider(text: "100°C")
                entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)

        case .graphicBezel:
                let template = CLKComplicationTemplateGraphicBezelCircularText()
                template.textProvider = CLKSimpleTextProvider(text: "GB")
                let circularTemplate = CLKComplicationTemplateGraphicCircularImage()
                circularTemplate.imageProvider = CLKFullColorImageProvider.init(fullColorImage: UIImage(named: "complicationIcon")!)
                template.circularTemplate = circularTemplate
                entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)

        case .graphicCircular:
                let template = CLKComplicationTemplateGraphicCircularOpenGaugeRangeText()
                template.centerTextProvider = CLKSimpleTextProvider(text: "GCL")
                template.leadingTextProvider = CLKSimpleTextProvider(text: "GCL1")
                template.trailingTextProvider = CLKSimpleTextProvider(text: "GCL2")
                entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)

        case .graphicRectangular:
                let template = CLKComplicationTemplateGraphicRectangularLargeImage()
                template.textProvider = CLKSimpleTextProvider(text: "GR")
                template.imageProvider = CLKFullColorImageProvider.init(fullColorImage: UIImage(named: "complicationIcon")!)
                entry = CLKComplicationTimelineEntry(date: now, complicationTemplate: template)
        default:
            break
        }
        
        return (entry?.complicationTemplate, entry)
    }
    
}
