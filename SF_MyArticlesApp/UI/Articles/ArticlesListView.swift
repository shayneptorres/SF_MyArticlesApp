//
//  ArticlesListView.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import SwiftUI

struct ArticlesListView: View {
    @ObservedObject var viewModel: ArticlesViewModel // view model responsible for managing data and user interactions
    
    var body: some View {
        NavigationStack {
            List {
                viewFor($viewModel.viewState)
            }
                .navigationTitle("My Articles")
        }
    }
}

// MARK: View builder methods
extension ArticlesListView {
    @ViewBuilder
    func viewFor(_ viewState: Binding<ArticleViewState>) -> some View {
        switch viewState.wrappedValue {
        case .fetchingArticles:
            HStack(spacing: 8) {
                ProgressView()
                Text("Loading views...")
            }
        case .noArticles:
            VStack {
                Text("Uh oh")
                    .font(.title2)
                    .bold()
                Text("It looks like you don't have any articles at the moment. You should search for some or write them yourself.")
            }
        case .articles:
            ForEach(viewModel.articles) { article in
                ArticleListRowView(article)
            }
        case .error:
            VStack {
                Text("Uh oh")
                    .font(.title2)
                    .bold()
                Text("It looks like there was an error fetching your articles. Please try again later.")
            }
        }
    }
}

#Preview {
    ArticlesListView(viewModel: .init(articles: MockArticleProvider().articles))
}

#Preview {
    ArticlesListView(viewModel: .init(viewState: .error))
}

#Preview {
    ArticlesListView(viewModel: .init(viewState: .fetchingArticles))
}

#Preview {
    ArticlesListView(viewModel: .init(viewState: .noArticles))
}
