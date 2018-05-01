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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchData(_ sender: UIButton) {
        
        if let inputString = textField.text, inputString != "" {
            
            if segmentedControl.selectedSegmentIndex == 0 {
                searchTheMeaningOfTheWord(word: inputString)
            } else if segmentedControl.selectedSegmentIndex == 1 {
                print("Kanji")
            } else {
                searchAllKindOfSentencesWith(word: inputString)
            }
           
        } else {
            Toast.shared.long(self.view, message: "Please! tap a search 🙇‍♂️")
        }
    }
    
    // Search functions
    
    func searchTheMeaningOfTheWord(word: String) {
        
        Api.init().fetchWordsFromApi(parameter: word){
            print("Finish! Number of result => \(words.data.count)")
            self.performSegue(withIdentifier: "showWords", sender: self)
        }
    }
    
    func searchAllKindOfSentencesWith(word: String) {
        
        Api.init().fetchSentencesFromApi(parameter: word){
            print("Finish! Number of result => \(arrayOfSentences.count)")
            //self.performSegue(withIdentifier: "showSentences", sender: self)
        }
    }
    
}

