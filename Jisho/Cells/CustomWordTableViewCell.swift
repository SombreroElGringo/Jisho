//
//  CustomWordTableViewCell.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class CustomWordTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var wordView: UITextView = {
        var textView = UITextView()
        textView.text = "犬"
        textView.font = .systemFont(ofSize: 40)
        textView.textColor = UIColor.black
        textView.backgroundColor = .red
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var readingView: UITextView = {
        var textView = UITextView()
        textView.text = "いぬ"
        textView.font = .systemFont(ofSize: 20)
        textView.textColor = UIColor.black
        textView.backgroundColor = .green
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var sensesView: UITextView = {
        var textView = UITextView()
        textView.text = "1° Dog"
        textView.font = .systemFont(ofSize: 16)
        textView.textColor = UIColor.black
        textView.backgroundColor = .yellow
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var otherFormLabel: UILabel = {
        var label = UILabel()
        label.text = "Other forms"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.backgroundColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var otherFormView: UITextView = {
        var textView = UITextView()
        textView.text = "狗 (いぬ)、イヌ"
        textView.font = .systemFont(ofSize: 16)
        textView.textColor = UIColor.black
        textView.backgroundColor = .cyan
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        super.addSubview(wordView)
        super.addSubview(readingView)
        super.addSubview(sensesView)
        super.addSubview(otherFormLabel)
        super.addSubview(otherFormView)
        
        // Our constraints for the custom cell
        
        wordView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        wordView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        wordView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        wordView.widthAnchor.constraint(equalTo: wordView.widthAnchor).isActive = true
        
        readingView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        readingView.topAnchor.constraint(equalTo: wordView.bottomAnchor, constant: 8).isActive = true
        readingView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        readingView.widthAnchor.constraint(equalTo: readingView.widthAnchor).isActive = true
        
        sensesView.leftAnchor.constraint(equalTo: wordView.rightAnchor, constant: 10).isActive = true
        sensesView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sensesView.topAnchor.constraint(equalTo: self.topAnchor, constant: 32).isActive = true
        sensesView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        sensesView.widthAnchor.constraint(equalTo: sensesView.widthAnchor).isActive = true
        
        otherFormLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        otherFormLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
        otherFormLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        otherFormLabel.widthAnchor.constraint(equalTo: otherFormLabel.widthAnchor).isActive = true
        
        otherFormView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        otherFormView.topAnchor.constraint(equalTo: otherFormLabel.bottomAnchor, constant: 4).isActive = true
        otherFormView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        otherFormView.widthAnchor.constraint(equalTo: otherFormView.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
