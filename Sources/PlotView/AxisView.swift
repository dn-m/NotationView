//
//  AxisView.swift
//  PlotView
//
//  Created by James Bean on 6/28/17.
//
//

import PlotModel
import Rendering

public protocol AxisView: Renderable {
    
    associatedtype Position
    associatedtype Configuration
    
    var position: Position { get }
    var configuration: Configuration { get }
}
