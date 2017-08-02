//
//  DefaultVerticalPlotModelTests.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import XCTest
import PlotModel
import PlotView

/// - TODO: Move to dn-m/PlotModel
class DefaultVerticalPlotModelTests: XCTestCase {
    
    func testBuilder() {
        
        let values: [Double: Double] = [0: 1, 30: 0.5, 60: 0.75, 90: 0.25, 300: 1, 325: 0]
        let builder = DefaultVerticalPlotModel.Builder()
        
        for (position, value) in values {
            let point = DefaultVerticalPointModel(value)
            builder.add(point, at: position)
        }

        _ = builder.build()
    }
}
