//
//  SearchRepositoryView.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/09.
//

import SwiftUI


struct SearchRepositoryView: View {
    @ObservedObject private var viewModel = SearchRepositoryViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("", text: $viewModel.word)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    Task {
                        await viewModel.searchResults()
                    }
                } label: {
                    Text("検索")
                }
                // リポジトリ名を選択時に関連した内容を表示
                List(viewModel.repositoryNames, id: \.self) { repositoryName in
                    NavigationLink {
                        RepositoryDetailView(name: repositoryName["name"] ?? "", language: repositoryName["language"] ?? "")
                    } label: {
                        Text("\(repositoryName["name"] ?? "")")
                    }
                }
            }
        }
    }
}


//
//struct SearchRepositoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRepositoryView()
//    }
//}
