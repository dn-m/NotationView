//
//  ClefTests.swift
//  StaffView
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import Geometry
import Path
import Rendering
import PlotModel
import PlotView
import StaffModel
import StaffView
import GraphicsTesting

class ClefTests: XCTestCase {

    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }

    func testClefsRender() {
        let position = VerticalAxisPosition(x: 0, plotTop: 0, plotBottom: 40)
        let configuration = ClefConfiguration(foregroundColor: .black, maskColor: .white)

        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
        for clef in clefs {
            let view = StaffClefView.makeClef(clef, at: position, with: configuration)
            render(view.rendered,
                fileName: "\(#function)_\(clef)",
                testCaseName: "\(type(of: self))"
            )
        }
    }
}
