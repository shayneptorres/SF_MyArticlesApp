//
//  Article.swift
//  SF_MyArticlesApp
//
//  Created by Shayne Torres on 4/11/24.
//

import Foundation

struct Article: Identifiable {
    let id: String = UUID().uuidString
    var title: String
    var text: String
}
