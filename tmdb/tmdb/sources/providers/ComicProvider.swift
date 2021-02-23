//
//  ComicProvider.swift
//  tmdb
//
//  Created by Daniel Lourenco Macedo on 26/02/20.
//  Copyright © 2020 Daniel Lourenco Macedo. All rights reserved.
//

import UIKit
class ComicProvider: BaseProvider {
    
    let baseUrl = "https://gateway.marvel.com/v1/public/comics"
    let publicKey = "f25df8f970eebca720d820a46276427c"
    let privateKey = "55706c1f3a339f1d107d43ce2d2c992109f7ca23"
    let session = URLSession.shared
    
    func getComics(comicName: String, offset: Int, completion: @escaping ([Comic])->()) {
        let timestamp = NSDate().timeIntervalSince1970
        let time : NSInteger = Int(timestamp)
        let md5Data = md5(string: "\(time)\(privateKey)\(publicKey)")
        let md5Hex = md5Data.map { String(format: "%02hhx", $0) }.joined()
        let nameParameter: String
        if (comicName != "") {
            nameParameter = "&titleStartsWith=\(comicName)"
        } else {
            nameParameter = ""
        }
        guard let url = URL(string: "\(baseUrl)?ts=\(time)&apikey=\(publicKey)&hash=\(md5Hex)&noVariants=true\(nameParameter)&offset=\(offset)&limit=99&format=comic") else { return }
        
        let task = session.dataTask(with: url){ data, response, error in
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
                    completion(res.data.results)
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getComicDetails(comicId: Int, completion: @escaping (Comic)->()) {
        let timestamp = NSDate().timeIntervalSince1970
        let time : NSInteger = Int(timestamp)
        let md5Data = md5(string: "\(time)\(privateKey)\(publicKey)")
        let md5Hex = md5Data.map { String(format: "%02hhx", $0) }.joined()
        
        guard let url = URL(string: "\(baseUrl)/\(comicId)?ts=\(time)&apikey=\(publicKey)&hash=\(md5Hex)") else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    do {
                        let res = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
                        completion(res.data.results[0])
                    } catch let error {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
