//
//  SearchRepositoryViewModel.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/09.
//
import Foundation

class SearchRepositoryViewModel: ObservableObject{
    //Viewからの検索内容
    @Published var keyWord: GithubApi = GithubApi(word: "")
    //検索結果に応じてデータを取得する(データ内容はレポジトリ名と使用言語)
    func searchResults(word: String) async -> [[String:String]] {
        do {
                let searchResultsValues = try await GithubApi.fetch(word: word)
                return searchResultsValues
                //return getValueDictionaryType(nameValues: searchResultsValues)
        } catch  {
            return []
        }
    }
}




