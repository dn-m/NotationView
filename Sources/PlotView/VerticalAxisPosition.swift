//
//  VerticalAxisPosition.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

public struct VerticalAxisPosition {
    
    public let x: Double
    public let plotTop: Double
    public let plotBottom: Double
    
    public init(x: Double, plotTop: Double, plotBottom: Double) {
        self.x = x
        self.plotTop = plotTop
        self.plotBottom = plotBottom
    }
}
