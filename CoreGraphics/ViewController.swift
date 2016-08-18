//
//  ViewController.swift
//  CoreGraphics
//
//  Created by My Nguyen on 8/17/16.
//  Copyright © 2016 My Nguyen. All rights reserved.
//

import UIKit

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
        
    }
}

