//
//  ArticleListRowView.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import SwiftUI

struct ArticleListRowView: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(article.title)
                .font(.title3)
                .bold()
            Text(article.text)
                .font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

extension ArticleListRowView {
    // extra init to allow ignoring parameter name
    init(_ article: Article) {
        self.article = article
    }
}

#Preview {
    ArticleListRowView(article: MockArticleProvider().articles.first ?? .init(title: "No article", text: "There were no articles found"))
}
