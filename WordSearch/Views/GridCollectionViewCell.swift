//
//  GridCollectionViewCell.swift
//  WordSearch
//
//  Created by Manan on 2019-05-13.
//  Copyright © 2019 Manan Patel. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    var wordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    var word: String? {
        didSet {
            wordLabel.text = word
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(wordLabel)
        wordLabel.anchor(safeTopAnchor, left: safeLeftAnchor, bottom: safeBottomAnchor, right: safeRightAnchor, topConstant: 5, leftConstant: 5, bottomConstant: 5, rightConstant: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
