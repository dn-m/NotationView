//
//  ScoreView.swift
//  ScoreView
//
//  Created by James Bean on 8/17/18.
//
//

import Rendering
import RhythmView
import StaffView

public struct ScoreView: Renderable {

    let beams: BeamsView
    let staff: StaffView

    public init(beams: BeamsView, staff: StaffView ) {
        self.beams = beams
        self.staff = staff
    }

    public var rendered: StyledPath.Composite {
        let renderables: [Renderable] = [beams,staff]
        let composite: StyledPath.Composite = .branch(Group("Score"),
            renderables.map { $0.rendered }
        )
        return composite.resizedToFitContents
    }
}
