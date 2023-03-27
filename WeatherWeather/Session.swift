//
//  Session.swift
//  WeatherWeather
//
//  Created by Ольга on 27.03.2023.
//

import Foundation

final class Session: CustomStringConvertible {
    static let shared = Session()
    private init() {}
    
    var id: Int = 0
    var userName: String = ""
    var balance: Int = 0
    
    var description: String {
        return "id: \(id), userName: \(userName), balance: \(balance)$"
    }
}
