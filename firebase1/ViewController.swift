//
//  ViewController.swift
//  firebase1
//
//  Created by KS on 2021/04/16.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!

    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sendButton.layer.cornerRadius = 10
       
    }
    
    
    
    @IBAction func send(_ sender: Any) {
        
        if let text = textField.text{
            
            db.collection("textData").addDocument(data: ["text":textField.text]) { (error) in
                
                if error != nil{
                    
                    print(error.debugDescription)
                    return
                    
                }
                
            }
            
        }
        
    }
    

    
    
    
}

