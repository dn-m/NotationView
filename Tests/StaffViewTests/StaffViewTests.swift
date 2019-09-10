//
//  StaffViewTests.swift
//  StaffView
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import Pitch
import SpelledPitch
import Geometry
import StaffModel
import StaffView
import GraphicsTesting

class StaffViewTests: XCTestCase {

    #if os(macOS)
    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }
    #endif

    func testStaffLinesAndClef() {
        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
        for clef in clefs {
            let builder = StaffView.Builder(clef: Clef(clef), configuration: StaffConfiguration())
            builder.startLines(at: 0)
            builder.stopLines(at: 500)
            let staffView = builder.build()
            #if os(macOS)
            render(staffView.rendered,
                fileName: "\(#function)_\(clef)",
                testCaseName: "\(type(of: self))"
            )
            #endif
        }
    }

    func testStaffWithLinesNoteheadsAndClef() {
        let pitches: [Pitch] = [60,62,63,64,66,68,71]
        let spelled = pitches.map { $0.spelledWithDefaultSpelling }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        let points = representable.map { StaffPointModel([$0]) }
        let positions = (0..<pitches.count).map { Double($0) * 100 + 100 }
        let builder = StaffModel.builder
        zip(positions, points).forEach { position, point in builder.add(point, at: position) }
        let model = builder.build()
        let view = StaffView(model: model)
        #if os(macOS)
        render(view.rendered, fileName: #function, testCaseName: "\(type(of: self))")
        #endif
    }
}
