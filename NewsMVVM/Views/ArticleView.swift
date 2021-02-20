//
//  ArticleView.swift
//  NewsMVVM
//
//  Created by Sercan Burak AĞIR on 20.02.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let image = article.image {
                WebImage(url: URL(string: image))
                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                    .placeholder(Image(systemName: "photo")) // Placeholder Image
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.trailing, 5)
                    
                VStack(alignment: .leading, spacing: 4) {
                    Text(article.title ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(article.source ?? "")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
            }
        }
        .padding(5)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
