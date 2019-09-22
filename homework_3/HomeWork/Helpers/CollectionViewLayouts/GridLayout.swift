//
//  GridLayout.swift
//  HomeWork
//
//  Created by Nick on 21/09/2019.
//  Copyright © 2019 Nikolay Artyugin. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewLayout {
    private var numberOfColumns = 1
    private var cellHeight: CGFloat = 44
    private var cellPadding: CGFloat = 10
    private var cache = [UICollectionViewLayoutAttributes]()
    private var elementsCount = 0
    
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    init(numberOfColumns: Int = 2) {
        super.init()
        self.numberOfColumns = numberOfColumns
        if numberOfColumns <= 0 {
            self.numberOfColumns = 1
        }
        if self.numberOfColumns == 1 {
            cellPadding = 0
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView,
            elementsCount != collectionView.numberOfItems(inSection: 0)
            else { return }
        if self.numberOfColumns == 1 {
            cellPadding = 0
        }
        if elementsCount != collectionView.numberOfItems(inSection: 0) {
            cache.removeAll()
        }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(columnWidth * CGFloat(column))
        }
        var column = 0
        var yOffset = cellPadding
        let height = numberOfColumns == 1 ? cellHeight : cellPadding * 2 + columnWidth
        
        elementsCount = collectionView.numberOfItems(inSection: 0)
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let frame = CGRect(x: xOffset[column], y: yOffset, width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            contentHeight = max(collectionView.frame.height + 10, frame.maxY)
            if  numberOfColumns == 1 {
                yOffset = yOffset + height
            }
            else if indexPath.row > 0,
                column == numberOfColumns - 1,
                indexPath.row % (numberOfColumns - 1) == 0 {
                yOffset = yOffset + height
            }
            column = (column + 1) % numberOfColumns
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
