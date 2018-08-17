//
//  TenorClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import StaffModel
import Geometry
import Path
import Rendering
import PlotView

public final class TenorClef: StaffClefView {

    public override var ornamentAltitude: Double {
        return 2 * staffSlotHeight + extenderLength
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
