//
//  Game.swift
//  Apple Pie
//
//  Created by Arda Toprak on 28.11.2022.
//

import Foundation
struct Game{
    var word : String
    var remainGuessCount : Int
    var wordGuess : [Character]
    mutating func guessDid(char : Character){
        wordGuess.append(char)
        if !word.contains(char) {
            remainGuessCount -= 1
            
        }
    }
}
