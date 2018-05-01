//
//  ViewController.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchData(_ sender: UIButton) {
        
        if let inputString = textField.text, inputString != "" {
            Api.init().fetchWordsFromApi(parameter: inputString){
            
                print("finish \(words.data.count)")
                
                self.performSegue(withIdentifier: "showWords", sender: self)
            }
        } else {
            print("no input")
        }
    }
    
}

