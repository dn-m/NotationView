//
//  AccidentalTests.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import XCTest
import QuartzAdapter
import StaffModel
import Geometry
import Path
import Rendering
import StaffView
import GraphicsTesting

class AccidentalTests: XCTestCase {

    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }

    func testAccidentalsRender() {
        let accidentals: [Accidental] = [.natural, .sharp, .flat]
        for accidental in accidentals {
            let view = AccidentalView.makeAccidental(accidental,
                at: .zero,
                size: StaffItemSize(staffSlotHeight: 40, scale: 1),
                color: .black
            )
            render(view.rendered,
                fileName: "\(#function)_\(accidental)",
                testCaseName: "\(type(of: self))"
            )
        }
    }
}
