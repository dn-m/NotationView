//
//  AxisViewTests.swift
//  PlotView
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import Rendering
import PlotView

class AxisViewTests: XCTestCase {
    
    struct ClefConfiguration { }
    
    struct ClefView: VerticalAxisView {
        
        /// `RenderedPath.Composite`-representation of `Renderable`-conforming type.
        var rendered: Composite {
            fatalError()
        }

        let configuration: ClefConfiguration
        let position: VerticalAxisPosition
    }
}
