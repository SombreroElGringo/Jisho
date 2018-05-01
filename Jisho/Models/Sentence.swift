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
    
    private enum CodingKeys: String, CodingKey {
        case results
        case found
    }
}


struct Sentence: Codable {
    var english: String?
    var kanji: String?
    var kana: String?
    
    private enum CodingKeys: String, CodingKey {
        case english
        case kanji
        case kana
    }
}
