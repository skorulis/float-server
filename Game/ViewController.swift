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

        let layout = CityGridLayout()
        collectionView.collectionViewLayout = layout
        view.wantsLayer = true
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

}

