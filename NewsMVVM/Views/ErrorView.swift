//
//  ErrorView.swift
//  NewsMVVM
//
//  Created by Sercan Burak AĞIR on 20.02.2021.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> ()
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error,
                  handler: @escaping  ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .font(.system(size: 80, weight: .heavy, design: .rounded))
                .foregroundColor(.gray)
                .padding(.bottom, 4)
            Text("Ooooopsss")
                .font(.system(size: 30, weight: .heavy, design: .default))
                .foregroundColor(.black)
            Text(error.localizedDescription)
                .font(.system(size: 15, weight: .heavy, design: .default))
                .foregroundColor(.gray)
                .padding(.vertical, 4)
                .multilineTextAlignment(.center)
            
            Button(action: {handler()}, label: {
                Text("Retry")
            })
            
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
