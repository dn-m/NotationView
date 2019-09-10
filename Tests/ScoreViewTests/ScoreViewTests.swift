//
//  ScoreViewTests.swift
//  ScoreViewTests
//
//  Created by James Bean on 8/17/17.
//
//

import XCTest
import GraphicsTesting
import Duration
import SpelledRhythm
import RhythmView
import Pitch
import SpelledPitch
import StaffModel
import StaffView
import ScoreView

class ScoreViewTests: XCTestCase {

    #if os(macOS)
    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }
    #endif

    func testScoreView() {

        // Make RhythmView
        let rhythm = Rhythm(1/>4, [(4,event(())),(2,event(())),(1,event(())),(2,event(()))])
        let beaming = DefaultBeamer.beaming(for: rhythm)
        let configuration = BeamsView.Configuration(slope: -0.125)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0,200,300,350],
            configuration: configuration
        )

        // Make StaffView
        let pitches: [Pitch] = [60,62,63,64,66,68,71]
        let spelled = pitches.map { $0.spelledWithDefaultSpelling }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        let points = representable.map { StaffPointModel([$0]) }
        let positions = (0..<pitches.count).map { Double($0) * 100 + 100 }
        let builder = StaffModel.builder
        zip(positions, points).forEach { position, point in builder.add(point, at: position) }
        let model = builder.build()
        let staffView = StaffView(model: model)

        let score = ScoreView(beams: beamsView, staff: staffView)

        #if os(macOS)
        render(score.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }
}
