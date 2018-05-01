//
//  WordTableViewController.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class WordTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.register(CustomWordTableViewCell.self, forCellReuseIdentifier: "wordCell")
        tableView.rowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! CustomWordTableViewCell

        return self.initializationCustomWordCell(cell: cell, indexPath: indexPath)
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        performSegue(withIdentifier: "showWordDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WordDetailViewController {
            destination.selectedWord = words.data[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    // Functions for init the CustomWordTableViewCell
    func initializationCustomWordCell(cell: CustomWordTableViewCell, indexPath: IndexPath) -> UITableViewCell {
        cell.wordView.text = words.data[indexPath.row].japanese[0].word
        cell.readingView.text = words.data[indexPath.row].japanese[0].reading
        
        if cell.wordView.text == "" {
            cell.wordView.text = words.data[indexPath.row].japanese[0].reading
            cell.readingView.text = ""
        }
        
        cell.sensesView.text = getWordSenses(arrOfDefinitions: words.data[indexPath.row].senses[0].englishDefinitions!)
        
        var otherForms = "", y = 0
        
        for item in words.data[indexPath.row].japanese {
            
            y = y + 1
            if y == 1 { continue }
            if y >= 4 {
                otherForms += " ..."
                break
            }
            
            if otherForms == "" {
                
                if let word = item.word, word != "" {
                    otherForms += word
                    if item.reading.count > 0 { otherForms += " [\(item.reading)]" }
                } else {
                    otherForms += "\(item.reading)"
                }
            } else {
                if let word = item.word, word != "" {
                    otherForms += ", \(word)"
                    if item.reading.count > 0 { otherForms += " [\(item.reading)]" }
                } else {
                    otherForms += ", \(item.reading)"
                }
            }
        }
        
        cell.otherFormView.text = otherForms
        return cell
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
