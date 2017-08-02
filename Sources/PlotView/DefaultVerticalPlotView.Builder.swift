//
//  DefaultVerticalPlotView.Builder.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import Geometry
import Path
import Rendering
import PlotModel

extension DefaultVerticalPlotView {
    
    public final class Builder {
        
        private var lines: DefaultVerticalPlotLinesCollection {
            
            let linesConfig = DefaultVerticalPlotLinesCollection.Configuration(
                height: configuration.height,
                linesColor: configuration.linesColor,
                lineWidth: configuration.lineWidth
            )
            
            return DefaultVerticalPlotLinesCollection(
                lineSegments: boundaryLines,
                configuration: linesConfig
            )
        }
        
        private var axisView: DefaultVerticalAxisView {
            let position = VerticalAxisPosition(x: 0, plotTop: 0, plotBottom: configuration.height)
            let axisConfig = DefaultVerticalAxisConfiguration(color: configuration.axisColor)
            return DefaultVerticalAxisView(position: position, configuration: axisConfig)
        }
        
        // Input
        private let axis = DefaultAxis<Double>()
        private let configuration: DefaultPlotConfiguration
        
        // Intermediate Representation
        private var boundaryLines = LinesSegmentCollection()
        private var points: [DefaultVerticalPointView] = []
        
        /// Creates a `DefaultVerticalPlotView.Builder` ready to build a `DefaultVerticalPlotView`
        /// with the given `configuration`.
        public init(configuration: DefaultPlotConfiguration = .default) {
            self.configuration = configuration
        }
        
        public init(model: DefaultVerticalPlotModel, configuration: DefaultPlotConfiguration) {
            
            self.configuration = configuration
            
            startLines(at: 0)
            for (position, points) in model {
                startLines(at: position)
                for point in points {
                    let y = axis.coordinate(point.value) * configuration.height
                    let pointView = DefaultVerticalPointView(position: Point(x: position, y: y))
                    self.points.append(pointView)
                }
            }
            
            // FIXME: Should be called externally
            stopLines(at: model.points.keys.max()! + 100)
        }
        
        /// Starts staff lines at the given position.
        public func startLines(at x: Double) {
            boundaryLines.startLines(at: x)
        }
        
        /// Stops staff lines at the given position.
        public func stopLines(at x: Double) {
            boundaryLines.stopLines(at: x)
        }
        
        public func build() -> DefaultVerticalPlotView {
            return DefaultVerticalPlotView(axis: axisView, lines: lines, points: points)
        }
    }
}
