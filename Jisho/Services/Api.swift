//
//  Api.swift
//  Jisho
//
//  Created by Florent on 01/05/2018.
//  Copyright © 2018 Florent. All rights reserved.
//

import Foundation

var words: Word!

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
    
    /*func fetchWordsFromApi(parameter: String) {
        // Need to encode kanji, hiragana & katakana or URL throw a err
        let param = parameter.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        guard let myJishoApiURI = URL(string: MY_JISHO_API_URI + "/words/" + param!) else { return }
        URLSession.shared.dataTask(with: myJishoApiURI) {
            
            (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                /*
                 if let jsonString = String(data: data, encoding: .utf8) {
                 print(jsonString)
                 }
                 */
                let wordData = try? decoder.decode(Word.self, from: data)
                
                meaningsOfTheWord = wordData
                
                //print(wordData!.data[0].japanese[0].reading)
                
            } catch let err {
                print("Err", err)
            }
            }.resume()*/
}
