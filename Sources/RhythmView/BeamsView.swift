//
//  BeamsView.swift
//  RhythmView
//
//  Created by James Bean on 7/2/17.
//
//

import BeamedRhythm
import Geometry
import Path
import Rendering

public struct BeamsView: Renderable {

    public struct Configuration {
        let orientation: Orientation
        let slope: Double
        let width: Double
        let beamletLength: Double
        let displacement: Double
        let color: Color

        public init(
            orientation: Orientation,
            slope: Double,
            width: Double,
            beamletLength: Double,
            displacement: Double,
            color: Color
        )
        {
            self.orientation = orientation
            self.slope = slope
            self.width = width
            self.beamletLength = beamletLength
            self.displacement = displacement
            self.color = color
        }
    }

    public var rendered: Composite {
        let path = beams.map { $0.path }.sum
        let styling = Styling(fill: Fill(color: color))
        let styledPath = RenderedPath(path: path, styling: styling)
        let leaf = Composite.leaf(.path(styledPath))
        return leaf.resizedToFitContents
    }

    private let beams: [Beam]
    private let color: Color

    public init(beams: [Beam], color: Color) {
        self.beams = beams
        self.color = color
    }

    public init(rhythmSpelling: RhythmSpelling, positions: [Double], configuration: Configuration) {
        let builder = Builder(configuration: configuration)
        builder.prepare(rhythmSpelling, at: positions)
        self = builder.build()
    }
}
