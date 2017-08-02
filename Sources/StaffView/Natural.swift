//
//  Natural.swift
//  Staff
//
//  Created by James Bean on 6/14/16.
//
//

import Geometry
import Path
import Rendering

public class Natural: AccidentalView {
    
    var left: Double {
        return 0
    }
    
    var insideLeft: Double {
        return thinLineWidth
    }
    
    var insideRight: Double {
        return width - thinLineWidth
    }
    
    var right: Double {
        return width
    }
    
    private var outside: Path {
        
        let builder = Path.builder
            .move(to: Point())
            .addLine(to: Point(x: insideLeft, y: 0))
            .addLine(to: point(x: insideLeft, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: -thickLineDisplace, from: .above))
            .addLine(to: Point(x: right, y: height))
            .addLine(to: Point(x: insideRight, y: height))
            .addLine(to: point(x: insideRight, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: thickLineDisplace, from: .below))
            .close()
        
        return builder.build()
    }
    
    private var inside: Path {
        
        let builder = Path.builder
            .move(to: point(x: insideLeft, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: insideRight, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: insideRight, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: insideLeft, displace: thickLineDisplace, from: .above))
            .close()
        
        return builder.build()
    }
    
    public override var path: Path {
        return outside + inside
    }
}
