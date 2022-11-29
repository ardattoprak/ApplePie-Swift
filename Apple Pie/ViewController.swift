//
//  ViewController.swift
//  Apple Pie
//
//  Created by Arda Toprak on 28.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var wordButtons: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    var currentGame  : Game!
    
    
    var wordList = ["elma", "kus", "buyuleyici", "parlak", "bocek",
                    "kodlama"]
    let countOfGuess = 7
    var totalTrue = 0
    var totalFalse = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newTour()
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        sender.isEnabled = false
        let wordString = sender.title(for: .normal)!
        let wordLower = Character(wordString.lowercased())
        currentGame.guessDid(char: wordLower)
        updateUI()
        updateGame()
        
    }
    
    func newTour() {
        if !wordList.isEmpty{
            let newWord = wordList.removeFirst()
            currentGame = Game(word: newWord, remainGuessCount: countOfGuess, charGuess: [])
            updateUI()
            wordButtonActivated(wordButtons != nil)
        }else{
            wordButtonActivated(wordButtons != nil)
        }
    }
    
    func updateUI(){
        var words = [String]()
        pointLabel.text = "total true : \(totalTrue) + total false : \(totalFalse)"
        treeImageView.image = UIImage(named: "Tree \(countOfGuess)")
        resultLabel.text = currentGame.formattedWord
        for word in currentGame.formattedWord{
            var wordString = String(word)
            words.append(wordString)
        }
        var wordWithSpace = words.joined(separator: " ")
        resultLabel.text = wordWithSpace
    }
    
    func updateGame(){
        if currentGame.remainGuessCount == 0 {
            totalFalse += 1
            newTour()
        }
        if currentGame.word == currentGame.formattedWord {
            totalTrue += 1
            newTour()
        }
        else{
            updateUI()
        }
        
    }
    func wordButtonActivated(_ active : Bool){
        for button in wordButtons {
            button.isEnabled = active
          }

    }
    
}
