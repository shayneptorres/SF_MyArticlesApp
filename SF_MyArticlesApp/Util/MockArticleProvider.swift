//
//  MockArticleProvider.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import Foundation

/// Test provider for reusing mock data
final class MockArticleProvider {
    let articles: [Article] = [
        .init(title: "Man walks on moon!", text: "Ladies and gentlemen, you won't believe it but we did it, we walked on the moon"),
        .init(title: "Sheep cloned", text: "For the first time ever we have cloned a living organism. Mary now has two little lambs")
    ]
}
