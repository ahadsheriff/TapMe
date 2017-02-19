//
//  LoginViewController.swift
//  TapMe
//
//  Created by Ahad Sheriff on 2/19/17.
//  Copyright © 2017 Ahad Sheriff. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var gifView: UIImageView!
    
    @IBOutlet weak var textBox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        // Returns an animated UIImage
        let fireGif = UIImage.gifWithName(name: "fire")
        // Use the UIImage in your UIImageView
        _ = UIImageView(image: fireGif)
        self.gifView?.image = fireGif
        */
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.textBox.delegate = self
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
