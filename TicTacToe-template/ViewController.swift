//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1
    var gamestate=[0, 0, 0, 0, 0, 0, 0, 0, 0]
var gameIsActive = true
    let combinations=[[0, 1, 2], [3, 4, 5], [2, 4, 6], [1, 4, 7], [6, 7, 8], [0, 3, 6], [0, 4, 8], [2, 5, 8] ]
    @IBAction func btnPlayAgain(_ sender: AnyObject){
        gamestate = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        btnPlayAgain.isHidden = true
        lblResult.isHidden = true

        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlayAgain.isHidden=true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnPressed(_ sender: UIButton) {
        if (gamestate[sender.tag-1] == 0 && gameIsActive == true)
        {
        if (gamestate[sender.tag-1]==0){
            gamestate[sender.tag-1] = activePlayer
            
        
        if (activePlayer==1){
        sender.setBackgroundImage(UIImage(named: "cross"), for: .normal)
            activePlayer = 2
        }
    
        else {
            sender.setBackgroundImage(UIImage(named: "nought"), for: .normal)
            activePlayer = 1
        }
    }
        for combination in combinations {
            if  gamestate[combination[0]] != 0 && gamestate[combination[0]]==gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]]
            {
            gameIsActive = false
                
            if gamestate[combination[0]] == 1
                {
                lblResult.text = "CROSS WON"
                }
                else
                {
                
                    lblResult.text = "NOUGHT WON"

                }
                btnPlayAgain.isHidden=false
                lblResult.isHidden=false
            }
            
        }
            gameIsActive=false
    for i in gamestate
            {
        if i==0
        {
            gameIsActive = true
            break
        }
    }
   if gameIsActive == false
            {
       lblResult.text = "It was a draw"
       lblResult.isHidden = false
       btnPlayAgain.isHidden = false
   }
    }
}
    @IBOutlet weak var lblResult: UILabel!
}


