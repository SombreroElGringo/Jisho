//
//  Sentence.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation

struct Sentences: Codable {
    
    var results: [Sentence]!
    var found: Bool?
}


struct Sentence: Codable {
    
    var english: String?
    var kanji: String?
    var kana: String?
}
