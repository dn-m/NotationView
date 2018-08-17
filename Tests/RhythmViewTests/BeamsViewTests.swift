//
//  BeamsViewTests.swift
//  RhythmView
//
//  Created by James Bean on 7/2/17.
//
//

import XCTest
import Duration
import SpelledRhythm
import Geometry
import Path
import Rendering
import RhythmView
import QuartzAdapter
import GraphicsTesting

#warning("Reinstate BeamsViewTests")

class BeamsViewTests: XCTestCase {

    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }

    func testBeamStraight() {
        let beam = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 20), width: 10)
        let beamsView = BeamsView(beams: [beam], color: .black)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamAngledDown() {
        let beam = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 30), width: 10)
        let beamsView = BeamsView(beams: [beam], color: .black)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamAngledUp() {
        let beam = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 10), width: 10)
        let beamsView = BeamsView(beams: [beam], color: .black)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamsStraight() {
        let a = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 20), width: 10)
        let b = Beam(start: Point(x: 20, y: 33), end: Point(x: 100, y: 33), width: 10)
        let beamsView = BeamsView(beams: [a,b], color: .black)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamsAngledDown() {
        let a = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 30), width: 10)
        let b = Beam(start: Point(x: 20, y: 33), end: Point(x: 100, y: 43), width: 10)
        let beamsView = BeamsView(beams: [a,b], color: .black)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamsAngledUp() {
        let a = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 10), width: 10)
        let b = Beam(start: Point(x: 20, y: 33), end: Point(x: 100, y: 23), width: 10)
        let beamsView = BeamsView(beams: [a,b], color: .black)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamStraightWithBeaming() {
        let beaming = Beaming([.init(start: 1), .init(stop: 1)])
        let beamsView = BeamsView(beaming: beaming, positions: [0, 100])
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamsStraightWithBeaming() {
        let beaming = Beaming([.init(start: 2), .init(stop: 2)])
        let beamsView = BeamsView(beaming: beaming, positions: [0, 100])
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamsAngledDownWithBeaming() {
        let beaming = Beaming([.init(start: 2), .init(stop: 2)])
        let configuration = BeamsView.Configuration(slope: 0.25)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0, 100],
            configuration: configuration
        )
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }

    func testBeamsAngledUpWithBeaming() {
        let beaming = Beaming([.init(start: 2), .init(stop: 2)])
        let configuration = BeamsView.Configuration(slope: -0.25)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0, 100],
            configuration: configuration
        )
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }
}

//class BeamsViewTests: GraphicsTestCase {
//
//    func testBeamsView() {
//
//        let durationTree = 4/>8 * [1,3,4,2,2,1]
//        let contexts = durationTree.leaves.map { _ in MetricalContext<Int>.instance(.event(0)) }
//
//        let rhythm = Rhythm(durationTree, contexts)
//        let spelling = RhythmSpelling(rhythm)
//        let spelledRhythm = SpelledRhythm(rhythm: rhythm, spelling: spelling)
//
//        let beatWidth: Double = 480
//        let positions = spelledRhythm.map { offset,_,_ in beatWidth * offset }
//
//        let configuration = BeamsView.Configuration(
//            orientation: .stemsDown,
//            slope: 0,
//            width: 4,
//            beamletLength: 6,
//            displacement: 6,
//            color: .black
//        )
//
//        let beamsView = BeamsView(
//            rhythmSpelling: spelledRhythm.spelling,
//            positions: positions,
//            configuration: configuration
//        )
//
//        let layer = CALayer(beamsView.rendered)
//        layer.showTestBorder()
//        render(layer, name: "beams_view")
//    }
//}
