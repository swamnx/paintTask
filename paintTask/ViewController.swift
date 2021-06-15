//
//  ViewController.swift
//  paintTask
//
//  Created by swamnx on 12.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    var startDrawingPoint: CGPoint?
    
    @IBOutlet weak var customPaintView: CustomPaintView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customPaintView.backgroundColor = .systemTeal
    }
    
    @IBAction func clearPaint(_ sender: UIButton) {
        customPaintView?.clearPaint()
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        let endDrawingPoint = recognizer.location(in: customPaintView)
        if let startPoint = startDrawingPoint,
           recognizer.state == .changed || recognizer.state == .ended {
            customPaintView.addLine(line: .init(startPoint: startPoint, endPoint: endDrawingPoint))
            customPaintView.setNeedsDisplay()
        }
        startDrawingPoint = endDrawingPoint
    }

}
