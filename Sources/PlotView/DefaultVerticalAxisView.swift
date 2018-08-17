//
//  DefaultVerticalAxisView.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import Geometry
import Path
import Rendering

public struct DefaultVerticalAxisConfiguration {
    
    public let color: Color
    
    public init(color: Color) {
        self.color = color
    }
}

public struct DefaultVerticalAxisView {
    
    // MARK: - Dimensions
    
    public var clefHeight: Double {
        return abs(position.plotTop - position.plotBottom)
    }
    
    public var lineWidth: Double {
        return clefHeight * 0.025
    }
    
    public var extenderLength: Double {
        return clefHeight * 0.125
    }
    
    public var height: Double {
        return clefHeight + 2 * extenderLength
    }
    
    public let configuration: DefaultVerticalAxisConfiguration
    public let position: VerticalAxisPosition
    
    public init(position: VerticalAxisPosition, configuration: DefaultVerticalAxisConfiguration) {
        self.position = position
        self.configuration = configuration
    }
}

extension DefaultVerticalAxisView: Renderable {
    
    // MARK: - Renderable
    
    public var line: StyledPath {
        let path = Path.line(from: Point(x: 0, y: 0), to: Point(x: 0, y: height))
        let style = Styling(stroke: Stroke(width: lineWidth, color: configuration.color))
        return StyledPath(frame: frame, path: path, styling: style)
    }
    
    public var frame: Rectangle {
        return Rectangle(x: 0, y: -extenderLength, width: 0, height: height)
    }
    
    public var rendered: StyledPath.Composite {
        return .leaf(.path(line))
    }
}
