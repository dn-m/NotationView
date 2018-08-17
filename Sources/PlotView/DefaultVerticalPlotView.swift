//
//  DefaultVerticalPlotView.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import Geometry
import Path
import Rendering
import PlotModel

public struct DefaultPlotConfiguration {
    
    public static var `default` = DefaultPlotConfiguration()
    
    public var lineWidth: Double {
        return 1
    }
    
    public let height: Double
    public let pointColor: Color
    public let linesColor: Color
    public let axisColor: Color
    
    public init(
        height: Double = 40,
        pointColor: Color = .black,
        linesColor: Color = .lightGray,
        axisColor: Color = .red
    )
    {
        self.height = height
        self.pointColor = pointColor
        self.linesColor = linesColor
        self.axisColor = axisColor
    }
}


public struct DefaultVerticalPointView {
    // TODO: Add configuration
    let position: Point
}

extension DefaultVerticalPointView: Renderable {
    
    public var rendered: StyledPath.Composite {
        
        // TODO: Add configuration
        let path = Path.circle(center: position, radius: 3)
        let styledPath = StyledPath(path: path)
        return .leaf(.path(styledPath))
    }
}

public struct DefaultVerticalPlotView: VerticalPlotView {
    
    public typealias Model = DefaultVerticalPlotModel
    
    public let axis: DefaultVerticalAxisView
    public let lines: DefaultVerticalPlotLinesCollection
    
    // TODO: Create DefaultVerticalPointView
    public let points: [DefaultVerticalPointView]
    
    public init(
        axis: DefaultVerticalAxisView,
        lines: DefaultVerticalPlotLinesCollection,
        points: [DefaultVerticalPointView]
    )
    {
        self.axis = axis
        self.lines = lines
        self.points = points
    }
    
    public init(model: DefaultVerticalPlotModel, configuration: DefaultPlotConfiguration) {
        self = Builder(model: model, configuration: configuration).build()
    }
    
    public func concreteVerticalPosition(for coordinate: Double) -> Double {
        fatalError()
    }
}

extension DefaultVerticalPlotView: Renderable {

    public var rendered: StyledPath.Composite {
        let group = Group("DefaultVerticalPlotView")
        let components: [Renderable] = ([lines, axis] + (points as [Renderable]))
        let trees: [StyledPath.Composite] = components.lazy.map { $0.rendered }
        return StyledPath.Composite.branch(group, trees)
    }
}
