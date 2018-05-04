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
                searchKanji(kanji: inputString)
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
            if let result = words, result.data.count > 0 {
                
                histories?.append(History(inputSearched: word, type: "word"))
                self.performSegue(withIdentifier: "showWords", sender: self)
            } else {
                Toast.shared.long(self.view, message: "Sumimasen! We have no results 🙇‍♂️")
            }
        }
    }
    
    func searchAllKindOfSentencesWith(word: String) {
        
        Api.init().fetchSentencesFromApi(parameter: word){
            if let result = arrayOfSentences, result.count > 0 {
                
                histories?.append(History(inputSearched: word, type: "sentence"))
                self.performSegue(withIdentifier: "showSentences", sender: self)
            } else {
                Toast.shared.long(self.view, message: "Sumimasen! We have no results 🙇‍♂️")
            }
        }
    }
    
    func searchKanji(kanji: String) {
        
        Api.init().fetchKanjiFromApi(parameter: kanji){
            if let result = kanjiFetched, result.found == true {
                
                histories?.append(History(inputSearched: kanji, type: "kanji"))
                self.performSegue(withIdentifier: "showKanjiDetail", sender: self)
            } else {
                Toast.shared.long(self.view, message: "Sumimasen! We have no results 🙇‍♂️")
            }
        }
    }
    
}

