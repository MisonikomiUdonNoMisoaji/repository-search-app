//
//  SearchRepositoryViewModel.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/09.
//
import Foundation

@MainActor
class SearchRepositoryViewModel: ObservableObject{
    @Published private(set) var repositoryNames: [[String:String]] = [[:]]
    @Published public var word: String = ""
    // 検索結果に応じてデータを取得する(データ内容はレポジトリ名と使用言語)
    func searchResults() async {
        do {
            let searchResultsValues = try await GithubApi.fetch(word: self.word)
            repositoryNames = searchResultsValues
        } catch {
            
        }
    }
}
