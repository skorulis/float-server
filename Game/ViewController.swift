//
//  ViewController.swift
//  Game
//
//  Created by Alexander Skorulis on 25/6/18.
//

import Cocoa
import Common

class ViewController: NSViewController, NSCollectionViewDelegate, NSCollectionViewDataSource {

    @IBOutlet weak var collectionView: NSCollectionView!
    
    private let cellIdentifier:NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier(rawValue: "LandPlotCell")
    
    var cityController:CityController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityController = CityController()

        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 160.0, height: 140.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        flowLayout.minimumInteritemSpacing = 20.0
        flowLayout.minimumLineSpacing = 20.0
        collectionView.collectionViewLayout = flowLayout
        // 2
        view.wantsLayer = true
        // 3
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
        
        self.collectionView.register(LandPlotCell.self, forItemWithIdentifier: cellIdentifier)
    }
    
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return cityController.city.height
    }
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityController.city.width
    }
    
    
    @available(OSX 10.11, *)
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cell = collectionView.makeItem(withIdentifier: cellIdentifier, for: indexPath)
        cell.textField?.stringValue = "TEST";
        guard let landCell = cell as? LandPlotCell else {return cell}
        return landCell
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

