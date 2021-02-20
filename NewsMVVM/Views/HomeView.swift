//
//  HomeView.swift
//  NewsMVVM
//
//  Created by Sercan Burak AĞIR on 20.02.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModel(service: NewsService())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    viewModel.getArticles()
                }
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                    }
                    .navigationTitle("News")
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
