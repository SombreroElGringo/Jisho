//
//  KanjiDetailViewController.swift
//  Jisho
//
//  Created by Florent on 02/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class KanjiDetailViewController: UIViewController {

    @IBOutlet weak var queryLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var strokeLabel: UILabel!
    @IBOutlet weak var radicalLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var kunyomiLabel: UILabel!
    @IBOutlet weak var onyomiLabel: UILabel!
    @IBOutlet weak var kunyomiExamplesTextView: UITextView!
    @IBOutlet weak var onyomiExamplesTextView: UITextView!
    @IBOutlet weak var strokeDiagramImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(KanjiDetailViewController.imageTapped(_:)))
        strokeDiagramImage.addGestureRecognizer(pictureTap)
        strokeDiagramImage.isUserInteractionEnabled = true

        queryLabel.text = kanjiFetched.query
        meaningLabel.text = kanjiFetched.meaning
        strokeLabel.text = "\(kanjiFetched.strokeCount) strokes"
        radicalLabel.text = "\(kanjiFetched.radical.symbol) \(kanjiFetched.radical.meaning)"
        partLabel.text = kanjiFetched.parts.compactMap({$0}).joined(separator: ", ")
        kunyomiLabel.text = kanjiFetched.kunyomi.compactMap({$0}).joined(separator: ", ")
        onyomiLabel.text = kanjiFetched.onyomi.compactMap({$0}).joined(separator: ", ")
        
        let kunyomiEx = kanjiFetched.kunyomiExamples.compactMap({$0}).map{"• \($0.example) (\($0.reading)) - \($0.meaning)"}
        kunyomiExamplesTextView.text = kunyomiEx.compactMap({$0}).joined(separator: "\n\n")
        
        let onyomiEx = kanjiFetched.onyomiExamples.compactMap({$0}).map{"• \($0.example) (\($0.reading)) - \($0.meaning)"}
        onyomiExamplesTextView.text = onyomiEx.compactMap({$0}).joined(separator: "\n\n")
        
        if let url = URL(string: kanjiFetched.strokeOrderDiagramUri) {
           strokeDiagramImage.load(url: url)
        }
        
    }

    // Back to the previous view
    
    @objc func backAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
