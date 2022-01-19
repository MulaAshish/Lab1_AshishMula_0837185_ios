//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var crosswon=0
    var noughtwon=0
    private let swipeableView: UIView = {
          // Initialize View
          let view = UIView(frame: CGRect(origin: .zero,
                                          size: CGSize(width: 400, height: 100)))

          // Configure View
          view.backgroundColor = .blue
          view.translatesAutoresizingMaskIntoConstraints = false

          return view
      }()
    @IBOutlet weak var lblNought: UILabel!
    @IBOutlet weak var lblCross: UILabel!
    var currentPlayer = 1
var gameIsActive = true
var combinations=winningCombinations()
var intialstatus=winningCombinations()
    @IBAction func btnPlayAgain(_ sender: AnyObject){
        _playAgain()
         
    }
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(swipeableView)
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizerDown.direction = UISwipeGestureRecognizer.Direction.down
        btnPlayAgain.isHidden=true
        swipeableView.addGestureRecognizer(swipeGestureRecognizerDown)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnPressed(_ sender: AnyObject) {
        if (combinations.intialstatus[sender.tag-1] == 0 && gameIsActive == true)
        {
        if (combinations.intialstatus[sender.tag-1] == 0){
            combinations.intialstatus[sender.tag-1] = currentPlayer
            
        
        if (currentPlayer==1){
        sender.setImage(UIImage(named: "cross"), for: .normal)
            currentPlayer = 2
        }
    
        else {
            sender.setImage(UIImage(named: "nought"), for: .normal)
            currentPlayer = 1
        }
    }
            for combination in combinations.combinations {
            
            
                if  combinations.intialstatus[combination[0]] != 0 && combinations.intialstatus[combination[0]]==combinations.intialstatus[combination[1]] && combinations.intialstatus[combination[1]] == combinations.intialstatus[combination[2]]
            {
            gameIsActive = false
                
                    if combinations.intialstatus[combination[0]] == 1
                {
                lblResult.text = "CROSS WON"
                        crosswon+=1
                        lblCross.text = ("cross:\(crosswon)")
                }
                else
                {
                
                    lblResult.text = "NOUGHT WON"
                    noughtwon+=1
                    lblNought.text = ("nought:\(noughtwon)")

                }
                btnPlayAgain.isHidden=false
                lblResult.isHidden=false
            }
            
        }
            gameIsActive=false
    for i in combinations.intialstatus
            {
        if i==0
        {
            gameIsActive = true
            break
        }
    }
   if gameIsActive == false
            {
       lblResult.text = "Draw"
       lblResult.isHidden = false
       btnPlayAgain.isHidden = false
   }
    }
    }
    @IBOutlet weak var lblResult: UILabel!
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
       // print("hello")
        _playAgain()

    }
    func _playAgain(){
        gameIsActive = true
       currentPlayer = 1
       
       btnPlayAgain.isHidden = true
       lblResult.isHidden = true

       for i in 1...9
       {
           let button = view.viewWithTag(i) as! UIButton
           button.setImage(nil, for: UIControl.State())
       }
    }
}

