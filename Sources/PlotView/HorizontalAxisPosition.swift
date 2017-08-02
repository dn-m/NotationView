//
//  HorizontalAxisPosition.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

public struct HorizontalAxisPosition {
    
    public let y: Double
    public let plotLeft: Double
    public let plotRight: Double
    
    public init(y: Double, plotLeft: Double, plotRight: Double) {
        self.y = y
        self.plotLeft = plotLeft
        self.plotRight = plotRight
    }
}
