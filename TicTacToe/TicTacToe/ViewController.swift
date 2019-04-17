//
//  ViewController.swift
//  TicTacToe
//
//  Created by William Biondi on 17/04/2019.
//  Copyright © 2019 William Biondi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerTurn = 1
    var board = [0,0,0,0,0,0,0,0,0]
    var players = ["Cross", "Knot"]
    let winningCombo = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var turn = 0
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBAction func fillCell(_ sender: AnyObject) {
        //con il tag del sender identifico la cella toccata
        if board[sender.tag - 1] == 0{
            if playerTurn == 1{
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State()) //assegno l'immagine al bottone
                playerTurn = 2 //cambio turno
            }
            else{
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                playerTurn = 1
                }
            board[sender.tag - 1] = playerTurn //assegno la cella al giocatore
            turn += 1
            label.text = "It's \(players[playerTurn - 1]) turn"
        }
        else{
            label.text = "This cell is already taken, retry"
        }
        for combo in winningCombo{
            if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != 0 && board[combo[1]] != 0 && board[combo[2]] != 0{
                playerTurn -= 1 //siccome ho cambiato turno torno indietro
                label.text = "\(players[playerTurn - 1]) has won the game!"
            }
            else if turn == 8{
                label.text = "It's a draw!"
            }
        }
    }
    
    
    @IBAction func startNewGame(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "It's \(players[playerTurn - 1]) turn"

    }


}

