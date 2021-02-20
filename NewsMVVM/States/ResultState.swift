//
//  ResultState.swift
//  NewsMVVM
//
//  Created by Sercan Burak AĞIR on 20.02.2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
