//
//  AccidentalView.swift
//  StaffView
//
//  Created by James Bean on 8/18/15.
//  Copyright © 2015 James Bean. All rights reserved.
//

import Geometry
import Path
import Rendering
import Pitch
import SpelledPitch
import StaffModel

public class AccidentalView: Renderable {
    
    public enum VerticalDirection: Double {
        case above = -1
        case below = 1
    }
    
    public var path: Path {
        fatalError("Must override")
    }
    
    public var rendered: StyledPath.Composite {
        let styling = Styling(fill: Fill(color: color, rule: .evenOdd))
        let styledPath = StyledPath(frame: frame, path: path, styling: styling)
        return StyledPath.Composite.leaf(.path(styledPath))
    }
    
    func thickLineY(x: Double, displace: Double, from direction: VerticalDirection) -> Double {
        let yRef = centerReference.y + displace + direction.rawValue * (0.5 * thickLineWidth)
        let xRef = x - 0.5 * width
        return yRef - thickLineSlope * xRef
    }

    var thickLineDisplace: Double {
        return 0.8250 * size
    }
    
    var thinLineWidth: Double {
        return 0.175 * size
    }
    
    var thickLineWidth: Double {
        return 0.764 * size
    }
    
    var thickLineSlope: Double {
        return 0.25
    }
    
    var midWidth: Double {
        return 1.150 * size
    }
    
    var flankWidth: Double {
        return 0.3 * size
    }
    
    var columnLength: Double {
        return 2.472 * size
    }
    
    var width: Double {
        return midWidth + 2 * thinLineWidth
    }
    
    var height: Double {
        return 2 * columnLength
    }
    
    var frame: Rectangle {
        return Rectangle(
            x: position.x - centerReference.x,
            y: position.y - centerReference.y,
            width: width,
            height: height
        )
    }
    
    var centerReference: Point {
        return Point(x: 0.5 * width, y: 0.5 * height)
    }
    
    let position: Point
    let size: StaffItemSize
    let color: Color
    
    public required init(
        position: Point = Point(),
        size: StaffItemSize = StaffItemSize(),
        color: Color = .black
    )
    {
        self.position = position
        self.size = size
        self.color = color
    }
    
    func point(x: Double, displace: Double, from direction: VerticalDirection) -> Point {
        return Point(x: x, y: thickLineY(x: x, displace: displace, from: direction))
    }
}

extension AccidentalView {
    
    public static func makeAccidental(
        _ kind: Pitch.Spelling.Modifier,
        at position: Point,
        size: StaffItemSize,
        color: Color
    ) -> AccidentalView
    {
        var type: AccidentalView.Type {
            switch kind {
            case .natural: return Natural.self
            case .sharp: return Sharp.self
            case .flat: return Flat.self
            default: fatalError()
            }
        }
        return type.init(position: position, size: size, color: color)
    }
}

extension AccidentalView {
    
    public static func makeAccidental(
        modifier: Pitch.Spelling.Modifier,
        at position: Point,
        size: StaffItemSize,
        color: Color
    ) -> AccidentalView?
    {
        return makeAccidental(modifier, at: position, size: size, color: color)
    }
}
