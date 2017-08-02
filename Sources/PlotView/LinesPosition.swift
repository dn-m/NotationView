//
//  LinesPosition.swift
//  PlotView
//
//  Created by James Bean on 1/16/17.
//
//

/// Horizontal position of a point for an arbitrary set of lines.
public struct LinesPosition {
    
    // MARK: - Nested Types
    
    /// Either starting or stopping a `LinesSegment`.
    public enum State {
        case start, stop
    }
    
    /// Horizontal position.
    public let position: Double
    
    /// Start or stop lines.
    public let state: State
    
    // MARK: - Initializers
    
    /// Create a `LinesPosition` with a given `state` and horizontal `position`.
    public init(_ state: State, at position: Double) {
        self.position = position
        self.state = state
    }
}

extension LinesPosition: Equatable {
    
    // MARK: - `Equatable`
    
    /// - returns: `true` if both `LinesPosition` values are equivalent. Otherwise, `false`.
    public static func == (lhs: LinesPosition, rhs: LinesPosition) -> Bool {
        return lhs.position == rhs.position
    }
}

extension LinesPosition: Comparable {
    
    // MARK: - `Comparable`
    
    /// - returns: `true` if the left value is less than the right view. Otherwise, `false`.
    public static func < (lhs: LinesPosition, rhs: LinesPosition) -> Bool {
        return lhs.position < rhs.position
    }
}
