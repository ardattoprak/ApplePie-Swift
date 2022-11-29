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
    var charGuess : [Character]
    var formattedWord : String {
        var wordGuess = ""
        for char in word{
            if charGuess.contains(char){
                var str = String(char)
                wordGuess.append(str)
            }else{
                wordGuess.append("_")
            }
        }
        return wordGuess
    }
    
    
    
    mutating func guessDid(char : Character){
        charGuess.append(char)
        if !word.contains(char) {
            remainGuessCount -= 1
        }
    }
}
