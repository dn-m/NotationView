//
//  NoteheadView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import Geometry
import Path
import Rendering

public class NoteheadView: Renderable {

    public struct Size {

        public let staffSlotHeight: StaffSlotHeight
        public let scale: Double

        public init(staffSlotHeight: StaffSlotHeight, scale: Double = 1) {
            self.staffSlotHeight = staffSlotHeight
            self.scale = scale
        }
    }
    
    public var rendered: StyledPath.Composite {
        let styling = Styling(fill: Fill(color: Color(white: 0.5, alpha: 1)))
        let styledPath = StyledPath(frame: frame, path: path, styling: styling)
        let leaf: StyledPath.Composite = .leaf(.path(styledPath))
        return leaf
    }
    
    private var path: Path {
        return Path
            .ellipse(in: Rectangle(x: 0, y: 0, width: width, height: height))
            .rotated(by: Angle(degrees: 45), around: Point(x: 0.5 * width, y: 0.5 * height))
    }
    
    private var frame: Rectangle {
        return Rectangle(
            x: position.x - 0.5 * width,
            y: position.y - 0.5 * height,
            width: width,
            height: height
        )
    }
    
    private var width: Double {
        return 2.25 * size.staffSlotHeight * size.scale
    }
    
    private var height: Double {
        return 0.75 * width
    }
    
    public var position: Point

    public var size: Size
    
    // Add configuration
    public init(position: Point, size: Size) {
        self.position = position
        self.size = size
    }
}
