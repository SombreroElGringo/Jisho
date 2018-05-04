//
//  History.swift
//  Jisho
//
//  Created by Florent on 04/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation

var histories: [History]?

struct History {
    var inputSearched: String
    var type: String
}


func saveHistory(histories: [History]) {
    UserDefaults.standard.set(histories, forKey: "histories")
}


func fetchHistories() -> [History]? {
    if let history = UserDefaults.standard.array(forKey: "histories") as? [History] {
        return history
    } else {
        return nil
    }
}
