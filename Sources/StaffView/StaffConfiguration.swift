//
//  StaffConfiguration.swift
//  StaffView
//
//  Created by James Bean on 1/17/17.
//
//

import StaffModel
import Rendering

public struct StaffConfiguration {
    
    public static var `default` = StaffConfiguration()
    
    public let staffSlotHeight: StaffSlotHeight
    public let noteheadColor: Color
    public let linesColor: Color
    public let clefColor: Color
    public let maskColor: Color
    
    var ledgerLineWidth: StaffSlotHeight {
        return 0.175 * staffSlotHeight
    }
    
    var lineWidth: StaffSlotHeight {
        return 0.1 * staffSlotHeight
    }
    
    var ledgerLineLength: StaffSlotHeight {
        return 3 * staffSlotHeight
    }
    
    public init(
        staffSlotHeight: StaffSlotHeight = 12,
        noteheadColor: Color = Color(white: 0.25, alpha: 1),
        linesColor: Color = Color(white: 0.5, alpha: 1),
        clefColor: Color = Color(white: 0, alpha: 1),
        maskColor: Color = Color(white: 1, alpha: 1)
    )
    {
        self.staffSlotHeight = staffSlotHeight
        self.noteheadColor = noteheadColor
        self.linesColor = linesColor
        self.clefColor = clefColor
        self.maskColor = maskColor
    }
}
