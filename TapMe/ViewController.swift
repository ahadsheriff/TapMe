//
//  ViewController.swift
//  TapMe
//
//  Created by Ahad Sheriff on 2/12/17.
//  Copyright © 2017 Ahad Sheriff. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var count: Int = 0
    var seconds: Int = 0
    var timer: Timer?
    var uid: String = ""
    let username = mainInstance.name
    
    var highScore: Int = 0
    
    var rootRef = FIRDatabase.database().reference()
    var scoreRef: FIRDatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupGame()
        
        // Firebase reference
        scoreRef = rootRef.child("High Score")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        count += 1
        scoreLabel.text = "Score: \(count)"
    }
    
    func setupGame() {
        seconds = 30
        count = 0
        timerLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
        
        //timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: <#T##(Timer) -> Void#>)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.subtractTime), userInfo: nil, repeats: true)
        
    }
    
    func subtractTime() {
        seconds -= 1
        timerLabel.text = "Time: \(seconds)"
        
        if seconds == 0 {
            timer?.invalidate()
            let alert = UIAlertController(title: "Time's Up!", message: "You scored \(count) points", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction) -> Void in
            
                /*
                let itemRef = self.scoreRef.childByAutoId()
                let scoreItem = [
                    "username": self.usersname,
                    "highscore": self.highScore
                ]
                
                itemRef.setValue(scoreItem)
 */
                
                self.setupGame()
            
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        print("Global username: ", self.username)
        timer?.invalidate()
        self.viewDidLoad()
    }
    


}

