//
//  ViewController.swift
//  Game
//
//  Created by Alexander Skorulis on 25/6/18.
//

import Cocoa
import Common

class ViewController: NSViewController {

    @IBOutlet weak var mapView: NSTextField!
    
    var cityController:CityController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityController = CityController()

        mapView.stringValue = getMapText()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    private func getMapText() -> String {
        let city = cityController.city
        var text = ""
        for y in 0..<city.height {
            for x in 0..<city.width {
                let square = city.getPlot(x: x, y: y)
                text += "#"
            }
            text += "\n"
        }
        return text
    }
    

}

