//
//  Word.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation

struct Word: Codable {
    
    var data: [Datas]
}

struct Datas: Codable {
    
    var japanese: [Japanese]
    var senses: [Sense]
    
    private enum CodingKeys: String, CodingKey {
        case japanese
        case senses
    }
}


struct Japanese: Codable {
    
    var word: String?
    var reading: String
    
    private enum CodingKeys: String, CodingKey {
        case word
        case reading
    }
}


struct Sense: Codable {
    var englishDefinitions: [String]?
    var partOfSpeech: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case englishDefinitions = "english_definitions"
        case partOfSpeech = "part_of_speech"
    }
}

