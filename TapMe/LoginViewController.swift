//
//  LoginViewController.swift
//  TapMe
//
//  Created by Ahad Sheriff on 2/19/17.
//  Copyright © 2017 Ahad Sheriff. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var gifView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Returns an animated UIImage
        let fireGif = UIImage.gifWithName(name: "fire")
        // Use the UIImage in your UIImageView
        _ = UIImageView(image: fireGif)
        self.gifView?.image = fireGif
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
