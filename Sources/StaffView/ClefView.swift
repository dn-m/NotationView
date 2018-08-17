//
//  ClefView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import DataStructures
import Geometry
import Path
import Rendering
import PlotView
import StaffModel

// TODO: Move to dn-m/PlotView
public struct ClefConfiguration {
    public var foregroundColor: Color
    public var maskColor: Color
    public init(foregroundColor: Color, maskColor: Color) {
        self.foregroundColor = foregroundColor
        self.maskColor = maskColor
    }
}

// TODO: Move to dn-m/PlotView
public protocol ClefView: VerticalAxisView {
    var extenderLength: Double { get }
    var lineWidth: Double { get }
    var position: VerticalAxisPosition { get }
    var configuration: ClefConfiguration { get }
    var components: [StyledPath] { get }
}

// TODO: Move to dn-m/PlotView
extension ClefView {
    
    public var clefHeight: Double {
        return abs(position.plotTop - position.plotBottom)
    }
    
    public var lineWidth: Double {
        return 0.025 * clefHeight
    }
    
    public var extenderLength: Double {
        return clefHeight / 8
    }
    
    public var height: Double {
        return clefHeight + 2 * extenderLength
    }
}

extension ClefView {
    
    // MARK: - Renderable
    
    public var line: StyledPath {
        let path = Path.line(from: Point(x: 0, y: 0), to: Point(x: 0, y: height))
        let style = Styling(stroke: Stroke(width: lineWidth, color: configuration.foregroundColor))
        return StyledPath(frame: frame, path: path, styling: style)
    }
    
    public var frame: Rectangle {
        return Rectangle(x: 0, y: -extenderLength, width: 0, height: height)
    }
    
    public var rendered: StyledPath.Composite {
        return .branch(Group("clef"), components.map { .leaf(.path($0)) })
    }
}

public class StaffClefView: ClefView {
    
    public static func makeClef(
        _ kind: Clef.Kind,
        at position: Position,
        with configuration: Configuration
    ) -> StaffClefView
    {
        
        var type: StaffClefView.Type {
            switch kind {
            case .bass:
                return BassClef.self
            case .tenor:
                return TenorClef.self
            case .alto:
                return AltoClef.self
            case .treble:
                return TrebleClef.self
            }
        }
        
        return type.init(position: position, configuration: configuration)
    }
    
    public var position: VerticalAxisPosition
    public var configuration: ClefConfiguration

    public var ornamentAltitude: Double {
        return 0
    }
    
    public var ornament: StyledPath? {
        return nil
    }
    
    required public init(position: Position, configuration: Configuration) {
        self.position = position
        self.configuration = configuration
    }
}

extension StaffClefView {
    
    public var staffSlotHeight: Double {
        return clefHeight / 8
    }
    
    public var components: [StyledPath] {
        return [line] + ornament
    }
}
