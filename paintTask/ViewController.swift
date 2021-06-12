//
//  ViewController.swift
//  paintTask
//
//  Created by swamnx on 12.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var paintView: UIImageView!
    var startDrawingPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintView.backgroundColor = .systemTeal
    }
    
    @IBAction func clearPaint(_ sender: UIButton) {
        paintView.image = nil
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        let endDrawingPoint = recognizer.location(in: paintView)
        if let startPoint = startDrawingPoint,
           recognizer.state == .changed || recognizer.state == .ended {
            drawLineInPaintView(from: startPoint, to: endDrawingPoint)
        }
        startDrawingPoint = endDrawingPoint
    }
    
    private func drawLineInPaintView(from startDrawingPoint: CGPoint, to endDrawingPoint: CGPoint) {
        UIGraphicsBeginImageContext(paintView.frame.size)
        paintView.image?.draw(in: paintView.bounds)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(3)
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineCap(.round)
        context.move(to: startDrawingPoint)
        context.addLine(to: endDrawingPoint)
        context.strokePath()
        paintView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}
