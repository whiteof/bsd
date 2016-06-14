//
//  ChartView.swift
//  BSD
//
//  Created by Victor Yurkin on 6/14/16.
//  Copyright © 2016 WCM. All rights reserved.
//

import ResearchKit

class PieChartDataSource: NSObject, ORKPieChartViewDataSource {
    // MARK: Types
    
    struct Segment {
        let title: String
        let value: Float
        let color: UIColor
    }
    
    // MARK: Properties
    
    let segments = [
        Segment(title: "In the next 5 years, 992 will not get breast cancer ", value: 992.0, color: UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)),
        Segment(title: "In the next 5 years, 8 will get breast cancer", value: 8.0, color: UIColor(red: 255/255, green: 64/255, blue: 64/255, alpha: 1)),
    ]
    
    // MARK: ORKPieChartViewDataSource
    
    func numberOfSegmentsInPieChartView(pieChartView: ORKPieChartView ) -> Int {
        return segments.count
    }
    
    func pieChartView(pieChartView: ORKPieChartView, valueForSegmentAtIndex index: Int) -> CGFloat {
        return CGFloat(segments[index].value)
    }
    
    func pieChartView(pieChartView: ORKPieChartView, colorForSegmentAtIndex index: Int) -> UIColor {
        return segments[index].color
    }
    
    func pieChartView(pieChartView: ORKPieChartView, titleForSegmentAtIndex index: Int) -> String {
        return segments[index].title
    }
}
