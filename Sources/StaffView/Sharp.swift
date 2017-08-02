//
//  Sharp.swift
//  Staff
//
//  Created by James Bean on 6/14/16.
//
//

import Geometry
import Path
import Rendering

public class Sharp: AccidentalView {
    
    var left: Double {
        return 0
    }
    
    var outsideLeft: Double {
        return flankWidth
    }
    
    var insideLeft: Double {
        return flankWidth + thinLineWidth
    }
    
    var outsideRight: Double {
        return width - flankWidth
    }
    
    var insideRight: Double {
        return width - flankWidth - thinLineWidth
    }
    
    var right: Double {
        return width
    }
    
    private var outside: Path {
        
        let builder = Path.builder
            .move(to: Point(x: flankWidth, y: centerReference.y - shortColumnHeight))
            .addLine(to: Point(x: insideLeft, y: centerReference.y - shortColumnHeight))
            .addLine(to: point(x: insideLeft, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: insideRight, displace: -thickLineDisplace, from: .above))
            .addLine(to: Point(x: insideRight, y: 0))
            .addLine(to: Point(x: outsideRight, y: 0))
            .addLine(to: point(x: outsideRight, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: width, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: outsideRight, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: outsideRight, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: outsideRight, displace: thickLineDisplace, from: .below))
            .addLine(to: Point(x: outsideRight, y: centerReference.y + shortColumnHeight))
            .addLine(to: Point(x: insideRight, y: centerReference.y + shortColumnHeight))
            .addLine(to: point(x: insideRight, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: insideLeft, displace: thickLineDisplace, from: .below))
            .addLine(to: Point(x: insideLeft, y: height))
            .addLine(to: Point(x: outsideLeft, y: height))
            .addLine(to: point(x: outsideLeft, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: outsideLeft, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: outsideLeft, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: outsideLeft, displace: -thickLineDisplace, from: .above))
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
    
    public var tallColumnHeight: Double {
        return 2.1 * size
    }
    
    public var shortColumnHeight: Double {
        return 1.9 * size
    }
    
    override var height: Double {
        return 2 * tallColumnHeight
    }
    
    override var width: Double {
        return midWidth + 2 * flankWidth
    }
}
