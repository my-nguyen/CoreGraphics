//
//  ViewController.swift
//  CoreGraphics
//
//  Created by My Nguyen on 8/17/16.
//  Copyright © 2016 My Nguyen. All rights reserved.
//

import UIKit

// this project doesn't compile due to lack of constructors to make CGSize, CGRect, etc
// work has to stop at the lesson "Drawing into a Core Graphics context"
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var currentDrawType = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // start with the screen showing something
        drawRectangle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redrawTapped(sender: AnyObject) {
        // increment the currentDrawType property
        currentDrawType += 1

        // wrap currentDrawType back to zero when it reaches 5
        if currentDrawType > 5 {
            currentDrawType = 0
        }

        // decide what method to call based on currentDrawType
        switch currentDrawType {
        case 0:
            drawRectangle()

        default:
            break
        }
    }

    func drawRectangle() {
        // create a new Core Graphics drawing context, with the same size as the image view (512x512),
        // make it not opaque, and match the scale of the current screen
        UIGraphicsBeginImageContextWithOptions(<#T##size: CGSize##CGSize#>, <#T##opaque: Bool##Bool#>, <#T##scale: Double##Double#>)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(width: 512, height: 512), false, 0)
        // get a reference to the Core Graphics context
        let context = UIGraphicsGetCurrentContext()

        // draw the actual rectangle
        let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
        // set the fill color, which is the color inside the rectangle
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        // set the stroke color, which is the color on th eline around the edge of the rectangle
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        // set the line width for the stroke
        CGContextSetLineWidth(context, 10)
        // add a CGRect to the current path
        CGContextAddRect(context, rectangle)
        // draw the path using both fill and stroke
        CGContextDrawPath(context, .FillStroke)

        // convert the Core Graphics context to a UIImage
        let img = UIGraphicsGetImageFromCurrentImageContext()
        // terminate the Core Graphics context
        UIGraphicsEndImageContext()

        imageView.image = img
    }
}

