//
//  LinesSegmentCollection.swift
//  PlotView
//
//  Created by James Bean on 1/16/17.
//
//

import DataStructures

/// Collection of `LinesSegment` values, which indicate the start and stop points for
/// the structural lines in a `Plot`.
public struct LinesSegmentCollection {
    
    fileprivate var linesPositions: [LinesPosition] = []
    
    /// Start all lines at the given horizontal position.
    public mutating func startLines(at x: Double) {
        linesPositions.append(LinesPosition(.start, at: x))
    }
    
    /// Stop all lines at the given horizontal position.
    public mutating func stopLines(at x: Double) {
        linesPositions.append(LinesPosition(.stop, at: x))
    }
    
    /// Create an empty `LinesSegmentCollection`
    public init() { }
}

extension LinesSegmentCollection: CollectionWrapping {
    
    /// All `LinesSegments` contained herein.
    public var linesSegments: [LinesSegment] {
        
        var result: [LinesSegment] = []
        var lastPosition: Double?
        for linesPosition in linesPositions.sorted(by: <) {
            switch linesPosition.state {
            case .start:
                if lastPosition == nil {
                    lastPosition = linesPosition.position
                }
            case .stop:
                if let start = lastPosition {
                    let segment = LinesSegment(start: start, stop: linesPosition.position)
                    result.append(segment)
                    lastPosition = nil
                }
            }
        }
        
        return result
    }
    
    /// Collection of `LinesSegment` values contained herein.
    public var base: [LinesSegment] {
        return linesSegments
    }
}
