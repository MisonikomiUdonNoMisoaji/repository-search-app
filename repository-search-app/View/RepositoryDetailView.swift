//
//  RepositoryDetailView.swift
//  repository-search-app
//
//  Created by 佐藤来 on 2023/07/17.
//

import SwiftUI

struct RepositoryDetailView: View {
    let name: String
    let language: String
    var body: some View {
        VStack{
            Text(name)
            Text(language)
        }
    }
}

struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(name: "リポジトリ名",language: "使用言語")
    }
}
