//
//  SearchGridController.swift
//  WordSearch
//
//  Created by Manan on 2019-05-10.
//  Copyright © 2019 Manan Patel. All rights reserved.
//

import UIKit

class SearchGridViewController: UIViewController, UICollectionViewDelegate{
    
    var wordGrid: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        return cv
    }()
    
    let wordTableLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 88, height: 44)
        return layout
    }()
    
    var wordTable: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        return cv
    }()
    
    //private let wordList = ["DOG", "CAT", "FISH"]
    private let cellID = "wordCell"
    private let gridID = "gridCell"
    
    var grid = WordGrid(words: [Word(text:"SWIFT"),Word(text:"KOTLIN"),Word(text:"OBJECTIVEC"),Word(text:"VARIABLE"),Word(text:"JAVA"),Word(text:"MOBILE")])
    
    override func viewDidLoad() {
        loadUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    private func loadUI() {
        createWordTable()
    }
    
    private func createGrid(){
        //wordGrid = UICollectionView()
        
        
    }
    
    private func createWordTable() {
        
        wordGrid.delegate = self
        wordGrid.dataSource = self
        
        let wordGridLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: view.frame.width/11, height: view.frame.width/11)
            return layout
        }()
        
        wordGrid.setCollectionViewLayout(wordGridLayout, animated: true)
        wordGrid.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: gridID)
        wordGrid.isScrollEnabled = false
        
        wordTable.delegate = self
        wordTable.dataSource = self
        wordTable.setCollectionViewLayout(wordTableLayout, animated: true)
        wordTable.register(FoundWordCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        view.addSubview(wordGrid)
        view.addSubview(wordTable)
        wordGrid.anchor(view.safeTopAnchor, left: view.safeLeftAnchor, bottom: wordTable.safeTopAnchor, right: view.safeRightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 8, rightConstant: 16,widthConstant: view.bounds.width, heightConstant: view.bounds.height * 3/4)
        wordTable.anchor(wordGrid.safeBottomAnchor, left: view.safeLeftAnchor, bottom: view.safeBottomAnchor, right: view.safeRightAnchor, topConstant: 88, leftConstant: 32, bottomConstant: 16, rightConstant: 32,widthConstant: view.bounds.width, heightConstant: view.bounds.height*1/4)
        
    }
}

extension SearchGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == wordGrid {
            return 10
        }
        else {
            return grid.wordList.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == wordGrid {
            return 10
        }
        else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == wordGrid {
            let gridCell = wordGrid.dequeueReusableCell(withReuseIdentifier: gridID, for: indexPath) as! GridCollectionViewCell
            gridCell.word = String(grid.labelList[indexPath.row][indexPath.section].letter)
            return gridCell
        }
        
        else {
            let wordCell = wordTable.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FoundWordCollectionViewCell
            wordCell.word = grid.wordList[indexPath.row].text
            return wordCell
        }
    }
}
