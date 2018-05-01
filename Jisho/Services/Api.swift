//
//  Api.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation

var words: Word!
var arrayOfSentences: [Sentence]!

struct Api {
    
    private let MY_JISHO_API_URI = "http://localhost:5000/api/v1/search"
    
    
    func fetchWordsFromApi(parameter: String, completed: @escaping () -> ()) {
        let param = parameter.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        guard let url = URL(string: MY_JISHO_API_URI + "/words/" + param!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                guard let data = data else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    let results = try? decoder.decode(Word.self ,from: data)
                    words = results
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
    
    
    func fetchSentencesFromApi(parameter: String, completed: @escaping () -> ()) {
        let param = parameter.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        guard let url = URL(string: MY_JISHO_API_URI + "/sentences/" + param!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                guard let data = data else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    let sentences = try? decoder.decode(Sentences.self ,from: data)
                    arrayOfSentences = sentences?.results
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch {
                    print("JSON Error")
                }
            }
            }.resume()
    }
    
}
