//
//  ViewController.swift
//  app2_Barnard_Vanessa
//
//  Created by Vanessa Barnard on 9/17/20.
//

import UIKit

class ViewController: UIViewController {
    var p1Score = 0
    var p2Score = 0
    var locked = false
    var game = GameLogic()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var image1 = UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate).withTintColor(.systemBlue)
    var image2 = UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate).withTintColor(.systemBlue)
    var image3 = UIImage(named: "mark-none")?.withRenderingMode(.alwaysTemplate).withTintColor(.systemBlue)
    
    
    @IBOutlet weak var titlMain: UILabel!
    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
    @IBOutlet weak var statusL: UILabel!
    @IBOutlet var collectionOfButtons: Array<UIButton> = [] // = [UIButton]?
    @IBAction func clearButton(_ sender: UIButton) {
        for button in  collectionOfButtons {
            button.setImage(image3, for: .normal)
        }
        buttonTints(x: -2)
        game = GameLogic()
        statusL.text = "Player 1's Turn"
        statusL.textColor = .black
        locked = false
        
    }
    @IBAction func pressedButton(sender: UIButton) {
        if !locked {
            let num = sender.tag
            //if it's a valid click
            if (game.boxClicked(x: num)){
                //change box to x
                if game.currPlayer == 1 {
                    sender.setImage(image1, for: .normal)
                }
                //change box to o
                else {
                    sender.setImage(image2, for: .normal)
                }
                
                //check for winner
                let winner = game.isWinner()
                if winner != -1 {
                    buttonTints(x: winner)
                    if game.currPlayer == 1 {
                        statusL.text = "Player 1 Wins!"
                        statusL.textColor = UIColor .green;
                        p1Score += 1
                        updateScores()
                    } else {
                        statusL.text = "Player 2 Wins!"
                        statusL.textColor = UIColor .green;
                        p2Score += 1
                        updateScores()
                    }
                    
                    locked = true
                } else if game.isDraw(){
                    buttonTints(x: winner)
                    statusL.text = "Draw!"
                    locked = true
                } else {
                    game.updatePlayer()
                    statusL.text = "Player " + String(game.currPlayer) + "'s Turn"
                }
            }
        }
        
    }
    
    func updateScores() {
        scoreOne.text = "P1 Score: " + String(p1Score)
        scoreTwo.text = "P2 Score: " + String(p2Score)
    }
    
    func buttonTints(x: Int) {
        if x == -2 {
            for button in  collectionOfButtons {
                button.tintColor = .systemBlue
            }
        } else if x == -1 {
            for button in  collectionOfButtons {
                button.tintColor = .systemGray
            }
        } else if x == 1 {
            threeButtons(x: 0, y: 1, z: 2)
        } else if x == 2 {
            threeButtons(x: 3, y: 4, z: 5)
        } else if x == 3 {
            threeButtons(x: 6, y: 7, z: 8)
        } else if x == 4 {
            threeButtons(x: 0, y: 3, z: 6)
        } else if x == 5 {
            threeButtons(x: 1, y: 4, z: 7)
        } else if x == 6 {
            threeButtons(x: 2, y: 5, z: 8)
        } else if x == 7 {
            threeButtons(x: 0, y: 4, z: 8)
        } else if x == 8 {
            threeButtons(x: 2, y: 4, z: 6)
        }
    }
    
    func threeButtons(x: Int, y: Int, z: Int) {
        for button in  collectionOfButtons {
            if button.tag == x || button.tag == y || button.tag == z {
                button.tintColor = .systemYellow
            }
        }
    }
    
}

