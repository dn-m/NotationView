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

#warning("Reinstate StaffViewTests")
//class StaffViewTests: GraphicsTestCase {
//
//    func testBuilderAPI() {
//        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
//        for clef in clefs {
//            let builder = StaffView.Builder(clef: Clef(clef), configuration: StaffConfiguration())
//            builder.startLines(at: 0)
//            builder.stopLines(at: 500)
//            let staffView = builder.build()
//            let path = staffView.rendered.resizedToFitContents
//            let layer = CALayer(path)
//            render(layer, name: "\(clef)_staff")
//        }
//    }
//
//    func testInitWithModelAndConfiguration() {
//
//        let pitches: [Pitch] = [60,62,63,64,66,68,71]
//        let spelled = pitches.map { $0.spelledWithDefaultSpelling }
//        let representable = spelled.map { StaffRepresentablePitch($0) }
//        let points = representable.map { StaffPointModel([$0]) }
//
//        var positions: [Double] = []
//        var accum: Double = 100
//        for _ in points.indices {
//            positions.append(accum)
//            accum += 100
//        }
//
//        let builder = StaffModel.builder
//        zip(positions, points).forEach { position, point in builder.add(point, at: position) }
//        let model = builder.build()
//
//        let view = StaffView(model: model)
//        let composite = view.rendered.resizedToFitContents.translated(by: Point(x: 0, y: 300))
//        dump(composite)
//        let layer = CALayer(composite)
//        layer.showTestBorder()
//
//        let container = CALayer()
//        container.frame = CGRect(x: 0, y: 0, width: 800, height: 800)
//        container.addSublayer(layer)
//        render(container, name: "staff_pitches")
//    }
//
//    // FIXME: Not fully implemented!
//    func testHull() {
//
//        let pitches: [Pitch] = [60,62,63,64,66,68,71]
//        let spelled = pitches.map { $0.spelledWithDefaultSpelling }
//        let representable = spelled.map { StaffRepresentablePitch($0) }
//        let points = representable.map { StaffPointModel([$0]) }
//
//        var positions: [Double] = []
//        var accum: Double = 100
//        for _ in points.indices {
//            positions.append(accum)
//            accum += 100
//        }
//
//        let builder = StaffModel.builder
//        zip(positions, points).forEach { position, point in builder.add(point, at: position) }
//        let model = builder.build()
//
//        let view = StaffView(model: model)
//        let _ = view.rendered
//    }
//}
//
