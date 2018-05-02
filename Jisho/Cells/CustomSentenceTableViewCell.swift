//
//  CustomSentenceTableViewCell.swift
//  Jisho
//
//  Created by Florent on 02/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import UIKit

class CustomSentenceTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var kanjiView: UILabel = {
        var labelView = UILabel()
        labelView.numberOfLines = 1
        labelView.lineBreakMode = .byTruncatingTail
        labelView.adjustsFontSizeToFitWidth = false
        labelView.text = "チューたろうは田中さんの犬です"
        labelView.font = .systemFont(ofSize: 20)
        labelView.textColor = UIColor.black
        labelView.backgroundColor = .red
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    var kanaView: UILabel = {
        var labelView = UILabel()
        labelView.numberOfLines = 1
        labelView.lineBreakMode = .byTruncatingTail
        labelView.adjustsFontSizeToFitWidth = false
        labelView.text = "チューたろうは田中さんのいぬです"
        labelView.font = .systemFont(ofSize: 20)
        labelView.textColor = UIColor.black
        labelView.backgroundColor = .yellow
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    var englishView: UILabel = {
        var labelView = UILabel()
        labelView.numberOfLines = 1
        labelView.lineBreakMode = .byTruncatingTail
        labelView.adjustsFontSizeToFitWidth = false
        labelView.text = "Chewtarou is Mrs Tanaka's dog."
        labelView.font = .systemFont(ofSize: 20)
        labelView.textColor = UIColor.black
        labelView.backgroundColor = .orange
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        super.addSubview(kanjiView)
        super.addSubview(kanaView)
        super.addSubview(englishView)
        
        // Our constraints for the custom cell
        
        kanjiView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        kanjiView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        kanjiView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        kanjiView.heightAnchor.constraint(equalTo: kanjiView.heightAnchor).isActive = true
        kanjiView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        kanaView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        kanaView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        kanaView.topAnchor.constraint(equalTo: kanjiView.bottomAnchor, constant: 8).isActive = true
        kanaView.heightAnchor.constraint(equalTo: kanaView.heightAnchor).isActive = true
        kanaView.widthAnchor.constraint(equalTo: kanaView.widthAnchor).isActive = true
        
        englishView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        englishView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 8).isActive = true
        englishView.topAnchor.constraint(equalTo: kanaView.bottomAnchor, constant: 8).isActive = true
        englishView.heightAnchor.constraint(equalTo: englishView.heightAnchor).isActive = true
        englishView.widthAnchor.constraint(equalTo: englishView.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
