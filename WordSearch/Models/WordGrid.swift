//
//  WordGrid.swift
//  WordSearch
//
//  Created by Manan on 2019-05-13.
//  Copyright © 2019 Manan Patel. All rights reserved.
//

import UIKit

class WordGrid {
    var wordList: [Word]
    var labelList: [[TextLabel]]
    
    var alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    init(words: [Word]) {
        wordList = words
        labelList = [[TextLabel]]()
        
        labelList = (0 ..< 10).map { _ in
            (0 ..< 10).map {_ in TextLabel()}
        }
        
        placeWords()
        placeRandomLetters()
    }
    
    // MARK:- Place words
    
    func placeWords() {
        
        wordList.forEach { word in
            let horiz = (Int.random(in: 0...9), Int.random(in: 0...(10 - word.text.count)))
            let vert = (Int.random(in: 0...(10 - word.text.count)), Int.random(in: 0...9))
            
            guard let direction = Direction(rawValue: Int.random(in: 0...1)) else {return}
            
            switch direction{
            case .horizontal:
                addWordHorizontally(x: horiz.0, y: horiz.1, word: word)
                return
            case .vertical:
                addWordVertically(x: vert.0, y: vert.1, word: word)
                return
            }
        }
    }
    
    private func addWordHorizontally(x: Int,y: Int, word: Word) {
        let length = word.text.count
        var i = 0
        while i < length {
            let label = labelList[x][y + i]
            let char = Array(word.text)[i]
            i = i + 1
            if (label.letter == " " || label.letter != char) {
                placeWord(word, direction: Direction.horizontal, coord: (x,y))
            }
        }
    }
    
    private func addWordVertically(x: Int,y: Int, word: Word) {
       let length = word.text.count
        var i = 0
        while i < length {
            let label = labelList[x + i][y]
            let char = Array(word.text)[i]
            i = i + 1
            if (label.letter == " " || label.letter != char){
                placeWord(word, direction: Direction.vertical, coord: (x,y))
            }
        }
    }
    
    private func placeWord(_ word: Word, direction:Direction, coord: (x: Int, y: Int)) {
        for i in 0..<word.text.count {
            switch direction{
            case .horizontal:
                labelList[coord.x][coord.y + i].letter = Array(word.text)[i]
            case .vertical:
                labelList[coord.x + i][coord.y].letter = Array(word.text)[i]
            }
            
        }
    }
    
    //MARK:- Place Random Letters
    
    func placeRandomLetters() {
        for row in labelList {
            for column in row {
                if column.letter == " " {
                    column.letter = randomLetter()
                }
            }
        }
    }
    
    private func randomLetter() -> Character {
        return Character(UnicodeScalar(Int.random(in: 65...90)) ?? " ")
    }
}

enum Direction: Int {
    case horizontal, vertical
}

enum MovementType: CaseIterable {
    case leftToRight
    case rightToLeft
    case topToBottom
    case BottomToTop
    
    var coordinate: (x: Int, y: Int) {
        switch self {
        case .leftToRight:
            return (1,0)
        case .rightToLeft:
            return (-1,0)
        case .topToBottom:
            return (0,-1)
        case .BottomToTop:
            return(0,1)
        }
    }
}
