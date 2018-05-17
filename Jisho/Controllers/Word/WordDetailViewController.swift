//
//  WordDetailViewController.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class WordDetailViewController: UIViewController {
    
    var selectedWord: Datas!
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var sensesTextView: UITextView!
    @IBOutlet weak var otherFormsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDetailView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initDetailView() {
        wordLabel.text = selectedWord.japanese[0].word
        readingLabel.text = selectedWord.japanese[0].reading
       
        if wordLabel.text == nil {
            wordLabel.text = selectedWord.japanese[0].reading
            readingLabel.text = ""
        }
        
        var senses = ""
        for sense in selectedWord.senses {
            senses += getWordSenses(arrOfDefinitions: sense.englishDefinitions!)
            senses += "\n"
        }
        sensesTextView.text = senses
        
        var otherForms = "", y = 0
        
        for item in selectedWord.japanese {
            
            y = y + 1
            if y == 1 { continue }
            if y >= 6 {
                otherForms += " ..."
                break
            }
            
            if otherForms == "" {
                
                if let word = item.word, word != "" {
                    otherForms += word
                    if let reading = item.reading, reading != "" { otherForms += " [\(reading)]" }
                } else {
                    if let reading = item.reading, reading != "" { otherForms += "\(reading)" }
                }
            } else {
                if let word = item.word, word != "" {
                    otherForms += ", \(word)"
                    if let reading = item.reading, reading != "" { otherForms += " [\(reading)]" }
                } else {
                    if let reading = item.reading, reading != "" { otherForms += ", \(reading)" }
                }
            }
        }
        otherFormsTextView.text = otherForms
    }
    
    func getWordSenses(arrOfDefinitions: [String]) -> String {
        var senses = "", i = 1
        
        for definition in arrOfDefinitions {
            if i < 3 {
                senses += "\(i)° \(definition)\n"
                i = i + 1
            } else { break }
        }
        return senses
    }
}
