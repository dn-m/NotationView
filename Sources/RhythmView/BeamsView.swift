//
//  BeamsView.swift
//  RhythmView
//
//  Created by James Bean on 7/2/17.
//
//

import SpelledRhythm
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
            orientation: Orientation = .stemsDown,
            slope: Double = 0,
            width: Double = 10,
            beamletLength: Double = 16,
            displacement: Double = 13,
            color: Color = .black
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

    public var rendered: StyledPath.Composite {
        let path: Path = beams.map { $0.path }.sum
        let styling = Styling(fill: Fill(color: color))
        let styledPath = StyledPath(path: path, styling: styling)
        let leaf = StyledPath.Composite.leaf(.path(styledPath))
        return leaf.resizedToFitContents
    }

    private let beams: [Beam]
    private let color: Color

    public init(beams: [Beam], color: Color) {
        self.beams = beams
        self.color = color
    }

    public init(beaming: Beaming, positions: [Double], configuration: Configuration = .init()) {
        let builder = Builder(configuration: configuration)
        builder.prepare(beaming, at: positions)
        self = builder.build()
    }
}
