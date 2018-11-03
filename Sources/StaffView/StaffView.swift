//
//  StaffView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import Geometry
import Path
import Rendering
import PlotModel
import StaffModel
import PlotView

/// Graphical representation of a musical staff.
public struct StaffView: VerticalPlotView {
    
    /// Points.
    public let points: [PointView]
    
    /// Clef.
    public let clef: StaffClefView
    
    /// Staff and ledger lines.
    public let lines: StaffLinesCollection
    
    // FIXME: This is left over from an over-engineered `PlotModel`.
    public typealias Model = StaffModel
    
    /// Creates a `StaffView` with the given `clef`, `lines`, and `points`.
    public init(clef: StaffClefView, lines: StaffLinesCollection, points: [PointView]) {
        self.clef = clef
        self.lines = lines
        self.points = points
    }
    
    public init(model: Model, configuration: StaffConfiguration = StaffConfiguration()) {
        self = Builder(model: model, configuration: configuration).build()
    }

    // FIXME: Ultimately, this is useless, if builders are used for everything.
    // FIXME: This is left over from an over-engineered `PlotModel`.
    public func concreteVerticalPosition(for slot: Model.VerticalAxis.Coordinate) -> Double {
        fatalError()
    }
}

extension StaffView {
    
    // MARK: - Rendering

    public var rendered: StyledPath.Composite {
        let structure: [Renderable] = [lines,clef]
        let renderables: [Renderable] = structure + points
        return StyledPath.Composite.branch(Group("StaffView"), renderables.map { $0.rendered })
            .resizedToFitContents
    }
}

// FIXME: Move to own file.
extension StaffView {

    /// Manages a single verticality of pitches represented on a `StaffView`.
    ///
    /// - TODO: Staff-based articulations
    /// - TODO: Accidental collision
    /// - TODO: Notehaead moving
    ///
    public struct PointView {

        public let position: Double
        public let pitches: [StaffRepresentedPitch]

        public init(pitches: [StaffRepresentedPitch], at position: Double) {
            self.pitches = pitches
            self.position = position
        }
    }
}

extension StaffView.PointView: Renderable {

    // MARK: - CompositeRenderable

    /// Subcomponents to be rendered.
    public var rendered: StyledPath.Composite {
        let noteheads: [Renderable] = pitches.compactMap { $0.notehead }
        let accidentals: [Renderable] = pitches.compactMap { $0.accidental }
        let renderables = noteheads + accidentals
        return .branch(Group("StaffView.PointView"), renderables.map { $0.rendered })
    }
}

// FIXME: Move to own file

public enum LedgerLineDirection: Double {
    case above = -1
    case below = 1
}

extension StaffView {

    public class Builder {

        // Input
        private let clef: Clef
        private let configuration: StaffConfiguration

        // Intermediate representation
        private var staffLines = LinesSegmentCollection()
        private var ledgerLines: [Double: [LedgerLineDirection: Int]] = [:]
        private var points: [PointView] = []

        /// Creates a `StaffView.Builder` ready to represent the given `clef`, with the given
        /// `configuration`.
        public init(clef: Clef, configuration: StaffConfiguration) {
            self.clef = clef
            self.configuration = configuration
        }

        /// Creates an internal representation of the given `model` with the given `configuration`.
        public init(model: StaffModel, configuration: StaffConfiguration) {

            self.clef = model.verticalAxis
            self.configuration = configuration

            startLines(at: 0)
            for (position, points) in model {
                startLines(at: position)
                for point in points {
                    let (above, below) = point.ledgerLines(model.verticalAxis)
                    addLedgerLines(at: position, above: above, below: below)
                    let pointView = PointView(
                        of: point,
                        at: position,
                        clef: model.verticalAxis,
                        staffSlotHeight: configuration.staffSlotHeight
                    )
                    self.points.append(pointView)
                }
            }

            // FIXME: Probably done from the outside
            stopLines(at: model.points.keys.max()! + 100)
        }

        /// Starts staff lines at the given position.
        public func startLines(at x: Double) {
            staffLines.startLines(at: x)
        }

        /// Stops staff lines at the given position.
        public func stopLines(at x: Double) {
            staffLines.stopLines(at: x)
        }

        /// Adds the amount ledger lines `above` and `below` at the given `position`.
        public func addLedgerLines(at position: Double, above: Int, below: Int) {
            ledgerLines[position, default: [:]][.below] = below
            ledgerLines[position, default: [:]][.above] = above
        }

        /// Creates a `StaffView` with the
        public func build() -> StaffView {
            let clef = makeClef(with: configuration)
            let lines = StaffLinesCollection(
                staffLines: staffLines,
                ledgerLines: ledgerLines,
                configuration: configuration
            )
            return StaffView(clef: clef, lines: lines, points: points)
        }

        private func makeClef(with configuration: StaffConfiguration) -> StaffClefView {

            let position = StaffClefView.Position(
                x: 0,
                plotTop: 0,
                plotBottom: 8 * configuration.staffSlotHeight
            )

            let clefConfig = StaffClefView.Configuration(
                foregroundColor: configuration.clefColor,
                maskColor: .white
            )

            return StaffClefView.makeClef(clef.kind, at: position, with: clefConfig)
        }
    }
}

extension StaffView.PointView {

    init(of pointModel: StaffPointModel, at position: Double, clef: Clef, staffSlotHeight: StaffSlotHeight) {

        let pitches: [StaffRepresentedPitch] = pointModel.elements.map { element in

            let slot = clef.coordinate(element.spelledPitch)
            let altitude = StaffSlotHeight(4 - slot) * staffSlotHeight

            return StaffRepresentedPitch(
                for: element,
                at: position,
                altitude: altitude,
                staffSlotHeight: staffSlotHeight
            )
        }

        self.init(pitches: pitches, at: position)
    }
}

extension Path {

    public init(lines: [Line.Segment]) {
        self.init(lines.map { BezierCurve.init($0) })
    }
}

