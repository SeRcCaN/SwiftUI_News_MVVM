//
//  NewsViewModel.swift
//  NewsMVVM
//
//  Created by Sercan Burak AĞIR on 20.02.2021.
//

import Foundation
import Combine

protocol NewsViewModelProtocol {
    func getArticles()
}


class NewsViewModel: ObservableObject, NewsViewModelProtocol {
    
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    break
                }
            } receiveValue: { (response) in
                self.articles = response.articles
            }
        self.cancellables.insert(cancellable)
    }
    
}
