//
//  BeamsView.Builder.swift
//  RhythmView
//
//  Created by James Bean on 7/2/17.
//
//

import DictionaryProtocol
import BeamedRhythm
import Geometry
import Path
import Rendering

extension BeamsView {

    public final class Builder {

        /// Configuration of `BeamsView`.
        private let configuration: BeamsView.Configuration

        /// Start and end values for each beam segment.
        private var beamSegments: [Int: [(Double, Double)]]

        /// Beamlet positions with direction.
        private var beamlets: [Int: [(Double, RhythmSpelling.BeamJunction.BeamletDirection)]]

        /// Previous x-values by level.
        private var start: [Int: Double]

        // MARK: - Initializers

        /// Creates a `BeamsRenderer` ready to receive commands in order to render beams.
        public init(configuration: Configuration) {
            self.configuration = configuration
            self.beamSegments = [:]
            self.beamlets = [:]
            self.start = [:]
        }

        /// Start a beam at the given horizontal position, on the given `level`.
        public func startBeam(at x: Double, on level: Int) {
            start[level] = x
        }

        /// Stop the beam at the given horizontal position, on the given `level`.
        public func stopBeam(at x: Double, on level: Int) {
            let start = self.start[level]!
            beamSegments.safelyAppend((start,x), toArrayWith: level)
            self.start[level] = nil
        }

        /// Add a beamlet at the given `x`, on the given `level`, going the given `direction`.
        public func addBeamlet(
            at x: Double,
            on level: Int,
            direction: RhythmSpelling.BeamJunction.BeamletDirection
        )
        {
            beamlets.safelyAppend((x,direction), toArrayWith: level)
        }

        /// Add all of the nececessary components for the given `rhythmSpelling` at the given
        /// `positions`.
        public func prepare(_ rhythmSpelling: RhythmSpelling, at positions: [Double]) {
            prepare(rhythmSpelling.map { $0.beamJunction }, at: positions)
        }

        /// Add all of the nececessary components for the given `junctions` at the given
        /// `positions`.
        public func prepare(_ junctions: [RhythmSpelling.BeamJunction], at positions: [Double]) {
            precondition(junctions.count == positions.count)
            zip(junctions, positions).forEach(handle)
        }

        private func handle(_ junction: RhythmSpelling.BeamJunction, at position: Double) {
            junction.states.forEach { level, state in
                switch state {
                case .start:
                    startBeam(at: position, on: level)
                case .stop:
                    stopBeam(at: position, on: level)
                case .beamlet(let direction):
                    addBeamlet(at: position, on: level, direction: direction)
                default:
                    break
                }
            }
        }

        public func build() -> BeamsView {

            var beams: [Beam] {
                return beamSegments.flatMap { level, beamSegments -> [Beam] in
                    let displacement = Double(level - 1) * configuration.displacement
                    return beamSegments.map { left, right in
                        let start = Point(x: left, y: left * configuration.slope + displacement)
                        let end = Point(x: right, y: right * configuration.slope + displacement)
                        return Beam(start: start, end: end, width: configuration.width)
                    }
                }
            }

            var beamlets: [Beam] {
                return self.beamlets.flatMap { level, beamlets -> [Beam] in
                    let displacement = Double(level - 1) * configuration.displacement
                    return beamlets.map { x, direction in
                        let left = x
                        let right = x + direction.rawValue * configuration.beamletLength
                        let start = Point(x: left, y: left * configuration.slope + displacement)
                        let end = Point(x: right, y: right * configuration.slope + displacement)
                        return Beam(start: start, end: end, width: configuration.width)
                    }
                }
            }
            
            return BeamsView(beams: beams + beamlets, color: configuration.color)
        }
    }
}
