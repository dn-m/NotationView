//
//  RhythmView.swift
//  RhythmView
//
//  Created by James Bean on 6/14/17.
//
//

import Duration
import SpelledRhythm
import Rendering

/// View composed of `BeamsView`.
///
/// - TODO: Add `TupletBracketView` values.
public struct RhythmView: Renderable {
    
    public struct Configuration {

        public let orientation: Orientation
        public let slope: Double
        public let beamWidth: Double
        public let beamletLength: Double
        public let beamDisplacement: Double
        public let beamStyling: Styling
        
        public init(
            orientation: Orientation,
            slope: Double,
            beamWidth: Double,
            beamletLength: Double,
            beamDisplacement: Double,
            beamStyling: Styling
        )
        {
            self.orientation = orientation
            self.slope = slope
            self.beamWidth = beamWidth
            self.beamletLength = beamletLength
            self.beamDisplacement = beamDisplacement
            self.beamStyling = beamStyling
        }
    }

    public var rendered: StyledPath.Composite {
        return .branch(Group("RhythmView"), [beamsView.rendered])
    }

    private let beamsView: BeamsView

    public init(beamsView: BeamsView) {
        self.beamsView = beamsView
    }
}
