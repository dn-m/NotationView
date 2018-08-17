//
//  Beam.swift
//  RhythmView
//
//  Created by James Bean on 6/24/17.
//
//

import Geometry
import Path

/// - TODO: Implement rotated sizing, rather than sheering
public struct Beam {
    
    public let path: Path
    
    public init(start: Point, end: Point, width: Double) {
        self.path = Path(vertices: [
            start.translatedBy(y: 0.5 * width),
            end.translatedBy(y: 0.5 * width),
            end.translatedBy(y: -0.5 * width),
            start.translatedBy(y: -0.5 * width)
        ])
    }
}
