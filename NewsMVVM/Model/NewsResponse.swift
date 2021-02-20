//
//  NewsResponse.swift
//  NewsMVVM
//
//  Created by Sercan Burak AĞIR on 20.02.2021.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    
    static var dummyData: Article {
        .init(author: "Robyn Dixon",
              url: "https://www.washingtonpost.com/world/europe/russia-navalny-court-putin/2021/02/19/0985c016-706a-11eb-8651-6d3091eac63f_story.html",
              source: "The Washington Post",
              title: "In a Russian court, Alexei Navalny is caged and angry but far from silent - Washington Post",
              articleDescription: "The opposition leader is using the stage his trials provide to ram home the message that the Russian justice system is a sham.",
              image: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/KPZFMFDS3MI6XBP24DGLGZQDLA.jpg&amp;w=1440",
              date: Date())
    }
    
}
