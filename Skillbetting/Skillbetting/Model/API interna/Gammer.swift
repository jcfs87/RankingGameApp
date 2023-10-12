//
//  Gammer.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

import Foundation
import SwiftUI
// Definimos el modelo de datos para poder recibir la informacion desde la API mongodb o Json local
struct Gammer: Hashable, Decodable, Identifiable {
    var id: String
    var player: String
    var score: Int
    var date: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case player
        case score
        case date
        case avatar
    }
}
