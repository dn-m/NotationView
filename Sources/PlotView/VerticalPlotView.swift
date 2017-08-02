//
//  VerticalPlotView.swift
//  PlotView
//
//  Created by James Bean on 6/27/17.
//
//

import PlotModel

public protocol VerticalPlotView: PlotView {
    associatedtype Model: VerticalPlotModel
    func concreteVerticalPosition(for coordinate: Model.VerticalAxis.Coordinate) -> Double
}
