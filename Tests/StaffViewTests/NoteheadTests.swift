//
//  NoteheadTests.swift
//  StaffView
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import GraphicsTesting
import Geometry
import Path
import Rendering
import StaffView

class NoteheadTests: XCTestCase {

    override func setUp() {
        createArtifactsDirectory(for: "\(type(of: self))")
    }

    override func tearDown() {
        openArtifactsDirectory()
    }

    func testNotehead() {
        let notehead = NoteheadView(
            position: .zero,
            size: NoteheadView.Size(staffSlotHeight: 40, scale: 1)
        )
        render(notehead.rendered, fileName: #function, testCaseName: "\(type(of: self))")
    }
}
