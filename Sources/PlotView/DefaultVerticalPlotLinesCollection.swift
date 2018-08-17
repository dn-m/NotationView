//
//  DefaultVerticalPlotLinesCollection.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import Geometry
import Path
import Rendering

public struct DefaultVerticalPlotLinesCollection: Renderable {
    
    public struct Configuration {
        public let height: Double
        public let linesColor: Color
        public let lineWidth: Double
    }
    
    public var rendered: StyledPath.Composite {
        return .leaf(.path(boundaryLines))
    }
    
    public let lineSegments: LinesSegmentCollection
    public let configuration: Configuration
    
    public init(lineSegments: LinesSegmentCollection, configuration: Configuration) {
        self.lineSegments = lineSegments
        self.configuration = configuration
    }
    
    private var boundaryLines: StyledPath {
        
        let path = Path(
            lineSegments.flatMap { segment in
                return (0..<2).map { lineNumber in
                    let altitude = Double(lineNumber) * configuration.height
                    let left = segment.start
                    let right = segment.stop
                    return BezierCurve(
                        start: Point(x: left, y: altitude),
                        end: Point(x: right, y: altitude)
                    )
                }
            }
        )
        
        let styling = Styling(
            stroke: Stroke(width: configuration.lineWidth, color: configuration.linesColor)
        )
        
        return StyledPath(frame: .zero, path: path, styling: styling)
    }
}
