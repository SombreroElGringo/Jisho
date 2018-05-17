//
//  SentenceTableViewController.swift
//  Jisho
//
//  Created by Florent on 02/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class SentenceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.register(CustomSentenceTableViewCell.self, forCellReuseIdentifier: "sentenceCell")
        tableView.rowHeight = 120
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
    }
    
    // Back to the previous view
    
    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSentences.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sentenceCell", for: indexPath) as! CustomSentenceTableViewCell

        let sentence = arrayOfSentences[indexPath.row]

        cell.kanjiView.text = "⛩️ \(String(describing: sentence.kanji!))"
        cell.kanaView.text = "💮 \(String(describing: sentence.kana!))"
        cell.englishView.text = "🇬🇧 \(String(describing: sentence.english!))"
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSentenceDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SentenceDetailViewController {
            destination.selectedSetence = arrayOfSentences[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
