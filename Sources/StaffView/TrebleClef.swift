//
//  TrebleClef.swift
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

public final class TrebleClef: StaffClefView {
    
    public override var ornamentAltitude: Double {
        return 6 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: StyledPath {
        
        let path = Path.circle(
            center: Point(x: 0, y: ornamentAltitude),
            radius: staffSlotHeight
        )
        
        let styling = Styling(
            fill: Fill(color: configuration.maskColor),
            stroke: Stroke(width: lineWidth, color: configuration.foregroundColor)
        )
        
        return StyledPath(frame: frame, path: path, styling: styling)
    }
}
