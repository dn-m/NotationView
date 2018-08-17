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

#warning("Reinstate AccidentalTests")
//class AccidentalTests: GraphicsTestCase {
//
//    func testHole() {
//        let outside = Path.square(center: Point(), width: 10)
//        let inside = Path.square(center: Point(), width: 8)
//        let path = outside + inside
//        let styledPath = StyledPath(path: path, styling: Styling(fill: Fill(rule: .evenOdd)))
//        let layer = CAShapeLayer(styledPath)
//        render(layer, name: "hole")
//    }
//
//    func testNatural() {
//        let accidental = Natural(position: Point(x: 0, y: 0))
//        let layer = CALayer(accidental.rendered)
//        layer.showTestBorder()
//        render(layer, name: "accidental_natural")
//    }
//
//    func testSharp() {
//        let accidental = Sharp(position: Point(x: 0, y: 0))
//        let layer = CALayer(accidental.rendered)
//        layer.showTestBorder()
//        render(layer, name: "accidental_sharp")
//    }
//
//    func testFlat() {
//        let accidental = Flat(position: Point(x: 0, y: 0))
//        let layer = CALayer(accidental.rendered)
//        layer.showTestBorder()
//        render(layer, name: "accidental_flat")
//    }
//
//    func testInContext() {
//
//        let frame = Rectangle(x: 0, y: 0, width: 100, height: 100)
//        let accidental = Natural(position: frame.center)
//        let composite = accidental.rendered
//
//        let resizedComposite = composite
//        let layer = CALayer(resizedComposite)
//        layer.showTestBorder()
//
//        let container = CALayer()
//        container.frame = CGRect(frame)
//        container.addSublayer(layer)
//        render(container, name: "accidental_in_context")
//    }
//}
