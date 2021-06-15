//
//  CustomPaintView.swift
//  paintTask
//
//  Created by swamnx on 14.06.21.
//

import Foundation
import UIKit

class CustomPaintView: UIView {
    
    private var lines = [CustomLine]()
    
    override func draw(_ rect: CGRect) {
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(5)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineCap(.round)
        for line in lines {
            context.move(to: line.startPoint)
            context.addLine(to: line.endPoint)
        }
        context.strokePath()
    }
    
    func addLine(line: CustomLine) {
        lines.append(line)
    }
    
    func clearPaint() {
        lines.removeAll()
        self.setNeedsDisplay()
    }
    
    struct CustomLine {
        var startPoint: CGPoint
        var endPoint: CGPoint
    }

}
