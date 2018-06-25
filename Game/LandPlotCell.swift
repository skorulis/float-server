//
//  LandPlotCell.swift
//  Game
//
//  Created by Alexander Skorulis on 25/6/18.
//

import Cocoa

class LandPlotCell: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.black.cgColor
    }
    
}
