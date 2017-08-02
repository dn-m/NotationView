//
//  LinesSegment.swift
//  PlotView
//
//  Created by James Bean on 1/16/17.
//
//

/// A model of a starting and stopping point for an arbitrary set of lines.
public struct LinesSegment {
    
    /// Left horizontal position.
    public let start: Double
    
    /// Right horizontal position.
    public let stop: Double
    
    /// Create a `LinesSegment` with given `start` and `stop` values.
    public init(start: Double, stop: Double) {
        self.start = start
        self.stop = stop
    }
}
