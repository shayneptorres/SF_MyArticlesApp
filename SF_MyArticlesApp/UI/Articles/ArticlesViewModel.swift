//
//  ArticlesViewModel.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import Foundation

/// Enum to represent the state of the view using this viewModel
enum ArticleViewState {
    case fetchingArticles
    case noArticles
    case articles
    case error
}

class ArticlesViewModel: ObservableObject {
    @Published var articles: [Article] = [] // Articles to be displayed
    @Published var viewState: ArticleViewState = .fetchingArticles // State of the view using view model
    var articleAPI: ArticleAPIClient? // API client to handle fetching articles
    
    /// Test initializer for mocking or instantiating view model with specific articles
    /// - Parameter articles: Articles to initialize the view model with
    init(articles: [Article]) {
        self.articles = articles
        viewState = .articles
    }
    
    /// Test initilizer for forcing specific view states
    /// - Parameter viewState: The forced view state to be used by the viewModels
    init(viewState: ArticleViewState) {
        self.viewState = viewState
    }
    
    /// Initializer to inject a specific API client into the view model
    /// - Parameter api: The APIClient to be used for this viewModel
    init(api: ArticleAPIClient) {
        self.articleAPI = api
        viewState = .fetchingArticles
        fetchArticles()
    }
    
    /// Makes the request to fetch the articles from the API client and handles updating view state
    func fetchArticles() {
        guard let api = articleAPI else {
            viewState = .error // if we are fetching
            return
        }
        Task {
            let fetchResult = await api.fetchData()
            
            await MainActor.run {
                switch fetchResult {
                case .success(let fetchedArticles):
                    if fetchedArticles.isEmpty {
                        viewState = .noArticles
                    } else {
                        self.articles = fetchedArticles
                        viewState = .articles
                    }
                case .failure(_):
                    viewState = .error
                }
            }
        }
    }
}
