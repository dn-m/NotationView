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

class ClefTests: GraphicsTestCase {
    
    func testClefs() {
        
        let position = VerticalAxisPosition(x: 0, plotTop: 0, plotBottom: 40)
        let configuration = ClefConfiguration(foregroundColor: .black, maskColor: .white)
        
        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
        for clef in clefs {
            let view = StaffClefView.makeClef(clef, at: position, with: configuration)
            let layer = CALayer(view.rendered)
            layer.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
            layer.showTestBorder()
            render(layer, name: "clef_\(clef)")
        }
    }
}
