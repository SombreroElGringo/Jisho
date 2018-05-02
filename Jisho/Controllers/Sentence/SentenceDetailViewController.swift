//
//  SentenceDetailViewController.swift
//  Jisho
//
//  Created by Florent on 02/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class SentenceDetailViewController: UIViewController {
    
    var selectedSetence: Sentence!
    
    @IBOutlet weak var sentencesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sentencesTextView.text = """
        ⛩️
        \(String(describing: selectedSetence.kanji!))
        
        💮
        \(String(describing: selectedSetence.kana!))
        
        🇬🇧
        \(String(describing: selectedSetence.english!))
        """
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
