//
//  GithubApi.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/09.
//

import Foundation

struct GithubApi {
    init(word: String) {
        self.word = word
    }
    
    var word: String
    
    static func fetch(word: String) async throws -> [[String: String]] {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(word)")!
        let request = URLRequest(url: url)
        // リクエスト
        let (data, response) = try await URLSession.shared.data(for: request)
        let responseStatusCode = (response as! HTTPURLResponse).statusCode
        
        if let obj = try! JSONSerialization.jsonObject(with: data) as? [String: Any] {
            if let items = obj["items"] as? [[String: Any]] {
                let result = items.compactMap { item -> [String: String]? in
                    guard let name = item["name"] as? String, let language = item["language"] as? String else {
                        return nil
                    }
                    return ["name": name, "language": language]
                }
                return result
            }
        }
        
        return []
    }
}
