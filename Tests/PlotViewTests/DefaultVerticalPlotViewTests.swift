//
//  DefaultVerticalPlotViewTests.swift
//  PlotView
//
//  Created by James Bean on 6/30/17.
//
//

import GraphicsTesting
import Geometry
import Path
import Rendering
import PlotModel
import PlotView

#warning("Reinstate DefaultVerticalPlotViewTests")
//class DefaultVerticalPlotViewTests: GraphicsTestCase {
//
//    func testBuilder() {
//
//        let configuration = DefaultPlotConfiguration(
//            height: 50,
//            pointColor: .darkGray,
//            linesColor: .lightGray,
//            axisColor: .cadetBlue
//        )
//
//        let builder = DefaultVerticalPlotView.Builder(configuration: configuration)
//        builder.startLines(at: 0)
//        builder.stopLines(at: 300)
//        let plot = builder.build()
//        let layer = CALayer(plot.rendered)
//        layer.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
//        render(layer, name: "default_vertical_plot")
//    }
//
//    func testWithModel() {
//
//        let values: [Double: Double] = [0: 1, 30: 0.5, 60: 0.75, 90: 0.25, 300: 1, 325: 0]
//        let builder = DefaultVerticalPlotModel.Builder()
//
//        for (position, value) in values {
//            let point = DefaultVerticalPointModel(value)
//            builder.add(point, at: position)
//        }
//
//        let model = builder.build()
//
//        let configuration = DefaultPlotConfiguration(
//            height: 50,
//            pointColor: .crimson,
//            linesColor: .lightGray,
//            axisColor: .cadetBlue
//        )
//
//        let view = DefaultVerticalPlotView(model: model, configuration: configuration)
//        let layer = CALayer(view.rendered)
//        layer.frame = CGRect(x: 0, y: 0, width: 425, height: 50)
//        render(layer, name: "default_vertical_plot_from_model")
//    }
//}
