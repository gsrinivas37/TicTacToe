//
//  ViewController.swift
//  TicTacToe
//
//  Created by Gudla Srinivas on 10/18/14.
//  Copyright (c) 2014 sgudla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 1
    
    // 0 == empty
    // 1 == circle
    // 2 == cross
    var isGameOver = false
    var boardStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[1,2,3], [4,5,6], [7,8,9],
                               [1,4,7], [2,5,8], [3,6,9],
                               [1,5,9], [3,5,7]]
    
    @IBAction func playAgain(sender: AnyObject) {
        isGameOver = false
        boardStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        count = 1
        
        gameoverlabel.center = CGPointMake(gameoverlabel.center.x-400, gameoverlabel.center.y)
        playAgainButton.alpha = 0
        
        for var i=1; i<10; i++ {
            var button = tictacview.viewWithTag(i) as UIButton
            button.setImage(UIImage(), forState:.Normal)
        }
        
    }
    
    @IBOutlet var tictacview: UIView!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var gameoverlabel: UILabel!
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        if(boardStatus[sender.tag-1]==0 && isGameOver==false){
            if(count%2==0) {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                boardStatus[sender.tag-1] = 2
            } else {
                sender.setImage(UIImage(named: "circle.png"), forState: .Normal)
                boardStatus[sender.tag-1] = 1
            }
            
            for combination in winningCombinations {
                if( (boardStatus[(combination[0] as Int)-1] == boardStatus[(combination[1] as Int)-1]) &&
                    (boardStatus[(combination[1] as Int)-1] == boardStatus[(combination[2] as Int)-1]) &&
                    (boardStatus[(combination[0] as Int)-1] != 0)) {
                        
                    if(boardStatus[(combination[0] as Int)-1] == 1) {
                        gameoverlabel.text = "Circle player has won !!"
                    } else {
                        gameoverlabel.text = "Cross player has won !!"
                    }
                    isGameOver = true;
                        
                        UIView.animateWithDuration(1, animations: {
                        self.gameoverlabel.center = CGPointMake(self.gameoverlabel.center.x+400, self.gameoverlabel.center.y)
                        self.playAgainButton.alpha = 1
                    })
                }
            }
            count++
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewDidLayoutSubviews() {
        if(isGameOver==false) {
            gameoverlabel.center = CGPointMake(gameoverlabel.center.x-400, gameoverlabel.center.y)
            playAgainButton.alpha = 0
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

