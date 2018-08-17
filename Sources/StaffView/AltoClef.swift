//
//  AltoClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//


import Geometry
import Path
import Rendering
import PlotView
import StaffModel

public final class AltoClef: StaffClefView {
    
    public override var ornamentAltitude: Double {
        return 4 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: StyledPath {
        
        let width = staffSlotHeight
        let position = Point(x: 0, y: ornamentAltitude)
        let path = Path
            .square(center: position, width: width)
            .rotated(by: Angle(degrees: 45), around: position)
        
        let styling = Styling(
            fill: Fill(color: configuration.maskColor),
            stroke: Stroke(width: lineWidth, color: configuration.foregroundColor)
        )
        
        return StyledPath(frame: frame, path: path, styling: styling)
    }
}
