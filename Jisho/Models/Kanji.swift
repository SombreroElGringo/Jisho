//
//  Kanji.swift
//  Jisho
//
//  Created by Florent on 03/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation

struct Kanji: Codable {
    
    var query: String
    var found: Bool
    var jlpt: String
    var strokeCount: Int
    var meaning: String
    
    var kunyomi: [String]
    var kunyomiExamples: [YomiExample]
    
    var onyomi: [String]
    var onyomiExamples: [YomiExample]
    
    var radical: Radical
    var parts: [String]
    var strokeOrderDiagramUri: String
}

struct YomiExample: Codable {
    
    var example: String
    var reading: String
    var meaning: String
}


struct Radical: Codable {
    
    var symbol: String
    var meaning: String
}
