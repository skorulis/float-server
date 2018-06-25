//
//  CityGridLayout.swift
//  Game
//
//  Created by Alexander Skorulis on 25/6/18.
//

import Cocoa

class CityGridLayout: NSCollectionViewLayout {

    private let itemSize = NSSize(width: 100, height: 100)
    private let spacing = CGFloat(10)
    
    private func getAtts(x:Int,y:Int) -> NSCollectionViewLayoutAttributes {
        let indexPath = IndexPath(item: x, section: y)
        let atts = NSCollectionViewLayoutAttributes(forItemWith: indexPath)
        let xPos = CGFloat(x) * (itemSize.width + spacing)
        let yPos = CGFloat(y) * (itemSize.height + spacing)
        atts.frame = NSRect(x: xPos, y: yPos, width: itemSize.width, height: itemSize.height)
        return atts
    }
    
    override var collectionViewContentSize: NSSize {
        let width = CGFloat(self.collectionView!.numberOfItems(inSection: 0)) * (itemSize.width + spacing)
        let height = CGFloat(self.collectionView!.numberOfSections) * (itemSize.height + spacing)
        return NSSize(width: width, height: height)
    }
    
    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        var items = [NSCollectionViewLayoutAttributes]()
        let rowCount = self.collectionView!.numberOfItems(inSection: 0)
        for y in 0..<self.collectionView!.numberOfSections {
            for x in 0..<rowCount {
                let atts = getAtts(x: x, y: y)
                items.append(atts)
            }
        }
        return items
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        return getAtts(x: indexPath.item, y: indexPath.section)
    }
    
}
