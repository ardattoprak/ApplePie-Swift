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
    
    
    var wordList = ["elma", "kuş", "büyüleyici", "parlak", "böcek",
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
        
    }
    
    func newTour() {
        let newWord = wordList.removeFirst()
        currentGame = Game(word: newWord, remainGuessCount: countOfGuess, charGuess: [])
        updateUI()
        
    }
    
    func updateUI(){
        var words = [String]()
        pointLabel.text = "total true : \(totalTrue) + total false : \(totalFalse)"
        treeImageView.image = UIImage(named: "Tree \(countOfGuess)")
        for word in currentGame.formattedWord{
            var wordString = String(word)
            words.append(wordString)
        }
        let wordWithSpace = words.joined(separator: " ")
        resultLabel.text = wordWithSpace
    }
}

