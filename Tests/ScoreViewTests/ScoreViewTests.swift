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
import ScoreView

class ScoreViewTests: XCTestCase {

    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }

    func testScoreView() {
        let rhythm = Rhythm(1/>4, [(4,event(())),(2,event(())),(1,event(())),(2,event(()))])
        let beaming = DefaultBeamer.beaming(for: rhythm)
        let configuration = BeamsView.Configuration(slope: -0.125)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0,200,300,350],
            configuration: configuration
        )
        let score = ScoreView(beamsView)
        render(score.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }
}
