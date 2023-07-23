//
//  GithubApi.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/09.
//

import Foundation

struct GithubApi {
    static func fetch(word: String) async throws -> [[String: String]] {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(word)")!
        let request = URLRequest(url: url)
        // リクエスト
        let (data, response) = try await URLSession.shared.data(for: request)
        let responseStatusCode = (response as! HTTPURLResponse).statusCode
        
        guard let obj = try! JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return []
        }

        guard let items = obj["items"] as? [[String: Any]] else {
            return []
        }
        
        let result = items.compactMap { item -> [String: String]? in
            guard let name = item["name"] as? String, let language = item["language"] as? String else {
                return nil
            }
            return ["name": name, "language": language]
        }
        return result
    }
}
