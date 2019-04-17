//
//  ViewController.swift
//  TicTacToe
//
//  Created by William Biondi on 17/04/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = [0,0,0,0,0,0,0,0,0]
    var players = ["Cross", "Knot"]
    let winningCombo = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var turn = 1
    var winner = -1
    var nextTurn = -1
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBAction func fillCell(_ sender: AnyObject) {
        //con il tag del sender identifico la cella toccata
        if board[sender.tag - 1] == 0{
            if turn % 2 != 0{
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State()) //assegno l'immagine al bottone
                winner = 1
                nextTurn = 1
                board[sender.tag - 1] = 1
            }
            else{
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                winner = 2
                nextTurn = 0
                board[sender.tag - 1] = 2
                }
             //assegno la cella al giocatore
        }
        else{
            label.text = "This cell is already taken, retry"
        }
        turn += 1
        label.text = "Turn \(turn) :It's \(players[nextTurn]) turn"
        for combo in winningCombo{
            if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != 0 && board[combo[1]] != 0 && board[combo[2]] != 0{
                label.text = "\(players[winner - 1]) has won the game!"
                reset.isHidden = false
                break
            }
            else if turn == 10{
                label.text = "It's a draw!"
                reset.isHidden = false
            }
        }
      
    }
    
    
    @IBAction func startNewGame(_ sender: Any) {
        board = [0,0,0,0,0,0,0,0,0]
        turn = 1
        winner = -1
        for cell in 1...9{
            let cellButton = view.viewWithTag(cell) as! UIButton
            cellButton.setImage(nil, for: UIControl.State())
        }
        label.text = "Turn:\(turn) It's\(players[winner + 1]) turn"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "Turn:\(turn) It's \(players[winner + 1]) turn"
        reset.isHidden = true

    }


}

