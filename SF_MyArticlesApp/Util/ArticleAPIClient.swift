//
//  ArticleAPIClient.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import Foundation

class ArticleAPIClient: APIClient<Article> {
    override func fetchData() async -> Result<[Article], Error> {
        return .success(MockArticleProvider().articles)
    }
}
