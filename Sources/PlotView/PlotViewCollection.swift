//
//  PlotViewCollection.swift
//  PlotView
//
//  Created by James Bean on 6/27/17.
//
//

import DataStructures
import Rendering

public struct PlotViewCollection {
    
    let plots: [PlotView]
    
    public init <S: Sequence> (_ plots: S) where S.Iterator.Element == PlotView {
        self.plots = Array(plots)
    }
}

extension PlotViewCollection: CollectionWrapping {
    
    public var base: [PlotView] {
        return plots
    }
}
