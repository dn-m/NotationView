//
//  StaffItemSize.swift
//  StaffView
//
//  Created by James Bean on 6/30/17.
//
//

/// Unit of height of a single `StaffSlot`
public typealias StaffSlotHeight = Double

public struct StaffItemSize {
    
    public var scaledValue: Double {
        return staffSlotHeight * scale
    }
    
    public let staffSlotHeight: StaffSlotHeight
    public let scale: Double
    
    public init(staffSlotHeight: StaffSlotHeight = 12, scale: Double = 1) {
        self.staffSlotHeight = staffSlotHeight
        self.scale = scale
    }
}

internal func * (lhs: Double, rhs: StaffItemSize) -> Double {
    return lhs * rhs.scaledValue
}

internal func * (lhs: StaffItemSize, rhs: Double) -> Double {
    return rhs * lhs.scaledValue
}
