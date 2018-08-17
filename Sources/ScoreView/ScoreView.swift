//
//  ScoreView.swift
//  ScoreView
//
//  Created by James Bean on 8/17/18.
//
//

import Rendering
import RhythmView

public struct ScoreView: Renderable {

    let beamsView: BeamsView

    public init(_ beamsView: BeamsView) {
        self.beamsView = beamsView
    }

    public var rendered: StyledPath.Composite {
        let composite: StyledPath.Composite = .branch(Group("Score"), [beamsView.rendered])
        return composite.resizedToFitContents
    }
}
