//
//  SearchRepositoryView.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/09.
//

import SwiftUI


struct SearchRepositoryView: View {
    @State var repositoryNames: [[String:String]] = [[:]]
    @ObservedObject var viewModel = SearchRepositoryViewModel()
    @State var word: String = ""
    
    var body: some View {
        
            NavigationView {
                    VStack{
                        TextField("", text: $word)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                Button {
                    Task {
                        repositoryNames =  await viewModel.searchResults(word: word)
                    }
                } label: {
                    Text("検索")
                }
                // リポジトリ名を選択時に関連した内容を表示
                List(repositoryNames, id: \.self) { repositoryName in
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
//表示用リスト
//List(0 ..< testData.count){
//    Text(self.testData[$0])
//}


//
//struct SearchRepositoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchRepositoryView()
//    }
//}
