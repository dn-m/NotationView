//
//  StaffLinesCollection.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import Geometry
import Path
import Rendering
import PlotView

/// Collection of staff and ledger lines, which can be rendered graphically when necessary.
///
/// - FIXME: Use own `Configuration` type (currently using `StaffConfiguration`, which is TMI).
///
public struct StaffLinesCollection: Renderable {
    
    public var rendered: StyledPath.Composite {
        
        let group = Group("lines")
        
        let paths = [
            staffLines(configuration: configuration),
            ledgerLines(configuration: configuration)
        ]

        let branch: StyledPath.Composite = .branch(group, paths.map { .leaf(.path($0)) })
        return branch.resizedToFitContents
    }
    
    let staffLines: LinesSegmentCollection
    let ledgerLines: [Double: [LedgerLineDirection: Int]]
    let configuration: StaffConfiguration
    
    public init(
        staffLines: LinesSegmentCollection,
        ledgerLines: [Double: [LedgerLineDirection: Int]],
        configuration: StaffConfiguration
    )
    {
        self.staffLines = staffLines
        self.ledgerLines = ledgerLines
        self.configuration = configuration
    }
    
    // FIXME: Passing Configuration for no reason
    // - Either accept statefulness, or break out to pure functions
    private func staffLines(configuration: StaffConfiguration) -> StyledPath {
        
        let staffSlotHeight = configuration.staffSlotHeight
        
        let path = Path(
            staffLines.flatMap { segment in
                return (0..<5).map { lineNumber in
                    let altitude = Double(lineNumber) * staffSlotHeight * 2
                    let left = segment.start
                    let right = segment.stop
                    return BezierCurve(
                        start: Point(x: left, y: altitude),
                        end: Point(x: right, y: altitude)
                    )
                }
            }
        )

        let styling = Styling(
            stroke: Stroke(width: configuration.lineWidth, color: configuration.linesColor)
        )
        
        return StyledPath(frame: .zero, path: path, styling: styling).resizedToFitContents
    }
    
    // FIXME: Passing Configuration for no reason
    // - Either accept statefulness, or break out to pure functions
    private func ledgerLines(configuration: StaffConfiguration) -> StyledPath {
        
        let staffSlotHeight = configuration.staffSlotHeight
        let length = configuration.ledgerLineLength
        var curves: [BezierCurve] = []
        
        for (x, amountByDirection) in ledgerLines {
            for (direction, amount) in amountByDirection {
                let left = x - 0.5 * length
                let right = x + 0.5 * length
                let refY = direction == .above ? -2 * staffSlotHeight : 10 * staffSlotHeight
                
                for number in 0..<amount {
                    let altitude = Double(number) * direction.rawValue * 2 * staffSlotHeight + refY
                    let curve = BezierCurve(
                        start: Point(x: left, y: altitude),
                        end: Point(x: right, y: altitude)
                    )
                    curves.append(curve)
                }
            }
        }
        
        let path = Path(curves)
        
        let styling = Styling(
            stroke: Stroke(
                width: configuration.ledgerLineWidth,
                color: configuration.linesColor
            )
        )
        
        return StyledPath(frame: .zero, path: path, styling: styling).resizedToFitContents
    }
}
