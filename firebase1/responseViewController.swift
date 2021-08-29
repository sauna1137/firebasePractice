//
//  TableViewController.swift
//  firebase1
//
//  Created by KS on 2021/04/16.
//

import UIKit
import Firebase

class responseViewController: UIViewController{
    
    @IBOutlet weak var textLabel: UILabel!
    
    let db = Firestore.firestore()
    var texts:[Texts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData(){
        
        db.collection("textData").document("Dc7XjyL8gyTK0PQ0I7Lf").getDocument { [self] (snap, error) in

            if error != nil{
                
                print(error.debugDescription)
                return
            }
            
            guard let data = snap?.data() else { return }
            
            if let text = data["text"] as? String{
                
                let newTexts = Texts(texts: text)
                self.texts.append(newTexts)
                textLabel.text = String(text)
            }
        }
    }

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
