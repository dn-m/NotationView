//
//  BeamsViewTests.swift
//  RhythmView
//
//  Created by James Bean on 7/2/17.
//
//

import XCTest
import Rhythm
import BeamedRhythm
import Geometry
import Path
import Rendering
import RhythmView
import QuartzAdapter
import GraphicsTesting

class BeamsViewTests: GraphicsTestCase {

    func testBeamsView() {

        let durationTree = 4/>8 * [1,3,4,2,2,1]
        let contexts = durationTree.leaves.map { _ in MetricalContext<Int>.instance(.event(0)) }

        let rhythm = Rhythm(durationTree, contexts)
        let spelling = RhythmSpelling(rhythm)
        let spelledRhythm = SpelledRhythm(rhythm: rhythm, spelling: spelling)

        let beatWidth: Double = 480
        let positions = spelledRhythm.map { offset,_,_ in beatWidth * offset }

        let configuration = BeamsView.Configuration(
            orientation: .stemsDown,
            slope: 0,
            width: 4,
            beamletLength: 6,
            displacement: 6,
            color: .black
        )

        let beamsView = BeamsView(
            rhythmSpelling: spelledRhythm.spelling,
            positions: positions,
            configuration: configuration
        )

        let layer = CALayer(beamsView.rendered)
        layer.showTestBorder()
        render(layer, name: "beams_view")
    }
}
