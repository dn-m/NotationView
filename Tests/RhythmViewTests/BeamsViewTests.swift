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
import GraphicsTesting

#if os(macOS)
import QuartzAdapter
#endif

class BeamsViewTests: XCTestCase {

    #if os(macOS)
    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }
    #endif

    func testBeamStraight() {
        let beam = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 20), width: 10)
        let beamsView = BeamsView(beams: [beam], color: .black)
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamAngledDown() {
        let beam = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 30), width: 10)
        let beamsView = BeamsView(beams: [beam], color: .black)
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamAngledUp() {
        let beam = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 10), width: 10)
        let beamsView = BeamsView(beams: [beam], color: .black)
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsStraight() {
        let a = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 20), width: 10)
        let b = Beam(start: Point(x: 20, y: 33), end: Point(x: 100, y: 33), width: 10)
        let beamsView = BeamsView(beams: [a,b], color: .black)
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsAngledDown() {
        let a = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 30), width: 10)
        let b = Beam(start: Point(x: 20, y: 33), end: Point(x: 100, y: 43), width: 10)
        let beamsView = BeamsView(beams: [a,b], color: .black)
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsAngledUp() {
        let a = Beam(start: Point(x: 20, y: 20), end: Point(x: 100, y: 10), width: 10)
        let b = Beam(start: Point(x: 20, y: 33), end: Point(x: 100, y: 23), width: 10)
        let beamsView = BeamsView(beams: [a,b], color: .black)
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamStraightWithBeaming() {
        let beaming = Beaming([.init(start: 1), .init(stop: 1)])
        let beamsView = BeamsView(beaming: beaming, positions: [0, 100])
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsStraightWithBeaming() {
        let beaming = Beaming([.init(start: 2), .init(stop: 2)])
        let beamsView = BeamsView(beaming: beaming, positions: [0, 100])
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsAngledDownWithBeaming() {
        let beaming = Beaming([.init(start: 2), .init(stop: 2)])
        let configuration = BeamsView.Configuration(slope: 0.25)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0, 100],
            configuration: configuration
        )
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsAngledUpWithBeaming() {
        let beaming = Beaming([.init(start: 2), .init(stop: 2)])
        let configuration = BeamsView.Configuration(slope: -0.25)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0, 100],
            configuration: configuration
        )
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsAndBeamletsWithBeaming() {
        let beaming = Beaming([.init(start: 2, beamlets: 2), .init(stop: 2)])
        let configuration = BeamsView.Configuration(slope: 0.125)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0, 100],
            configuration: configuration
        )
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsAndBeamletsWithBeaming2() {
        let beaming = Beaming([
            .init(start: 2, beamlets: 2),
            .init(maintain: 1, stop: 1),
            .init(maintain: 1, start: 2, beamlets: 3),
            .init(stop: 3)
        ])
        let configuration = BeamsView.Configuration(slope: -0.125)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0,50,100,150],
            configuration: configuration
        )
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }

    func testBeamsWithRhythm() {
        let rhythm = Rhythm(1/>4, [(4,event(())),(2,event(())),(1,event(())),(2,event(()))])
        let beaming = DefaultBeamer.beaming(for: rhythm)
        let configuration = BeamsView.Configuration(slope: -0.125)
        let beamsView = BeamsView(
            beaming: beaming,
            positions: [0,200,300,350],
            configuration: configuration
        )
        #if os(macOS)
        render(beamsView.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }
}
