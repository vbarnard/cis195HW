//
//  GameLogic.swift
//  app2_Barnard_Vanessa_2
//
//  Created by Vanessa Barnard on 9/22/20.
//

import Foundation

struct GameLogic {
    
    var currPlayer = 1
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    func isDraw() -> Bool {
        for button in gameBoard {
            if button == 0 {
                return false
            }
        }
        return true
    }
    
    mutating func boxClicked(x:Int) -> Bool {
        if x >= 0 && x < 9 && gameBoard[x] == 0{
            gameBoard[x] = currPlayer
            return true
        } else {
            return false
        }
    }
    
    func isWinner() -> Int {
        //first row
        if gameBoard[0] == gameBoard[1] && gameBoard[1] == gameBoard[2] && gameBoard[0] != 0  {
            return 1
        }
        
        //second row
        if gameBoard[3] == gameBoard[4] && gameBoard[4] == gameBoard[5] && gameBoard[3] != 0  {
            return 2
        }
        
        //third row
        if gameBoard[6] == gameBoard[7] && gameBoard[7] == gameBoard[8] && gameBoard[6] != 0  {
            return 3
        }
        
        //first column
        if gameBoard[0] == gameBoard[3] && gameBoard[3] == gameBoard[6] && gameBoard[6] != 0  {
            return 4
        }
        
        //second column
        if gameBoard[1] == gameBoard[4] && gameBoard[4] == gameBoard[7] && gameBoard[7] != 0  {
            return 5
        }
        
        //third column
        if gameBoard[2] == gameBoard[5] && gameBoard[5] == gameBoard[8] && gameBoard[8] != 0  {
            return 6
        }
        
        //first diagonal
        if gameBoard[0] == gameBoard[4] && gameBoard[4] == gameBoard[8] && gameBoard[8] != 0  {
            return 7
        }
        
        //second diagonal
        if gameBoard[2] == gameBoard[4] && gameBoard[4] == gameBoard[6] && gameBoard[6] != 0  {
            return 8
        }
        
        //no winner
        return -1
    }
    
    mutating func updatePlayer() {
        if self.currPlayer == 1 {
            self.currPlayer = 2
        } else {
            self.currPlayer = 1
        }
    }
    
    func getCurrPlayer() -> Int {
        return self.currPlayer
    }

}
