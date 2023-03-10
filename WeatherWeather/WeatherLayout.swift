//
//  WeatherLayout.swift
//  WeatherWeather
//
//  Created by Ольга on 10.03.2023.
//

import UIKit

class WeatherLayout: UICollectionViewLayout {
    
    let cellHeight: CGFloat = 128
    let columnsCount = 2
    var totalCellsHeight: CGFloat = 0
    
    var cachedAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        
        let bigCellWidth = collectionView.frame.width
        let smallCellWidth = bigCellWidth / 2.0
        
        var lastX: CGFloat = 0
        var lastY: CGFloat = 0
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let isBigCell = (index + 1) % (columnsCount + 1) == 0
            
            if isBigCell {
                attribute.frame = CGRect(x: 0, y: lastY, width: bigCellWidth, height: bigCellWidth)
                lastY += cellHeight
            } else {
                attribute.frame = CGRect(x: lastX, y: lastY, width: smallCellWidth, height: cellHeight)
                let isLastColumn = (index + 2) % (columnsCount + 1) == 0 || index == itemsCount - 1
                
                if isLastColumn {
                    lastY += cellHeight
                    lastX = 0
                } else {
                    lastX += smallCellWidth
                }
            }
            
            cachedAttributes[indexPath] = attribute
        }
        totalCellsHeight = lastY
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cachedAttributes.values.filter {
            return rect.intersects($0.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.frame.width ?? 0, height: totalCellsHeight)
    }
}
