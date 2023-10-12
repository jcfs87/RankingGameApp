//
//  Game.swift
//  Skillbetting
//
//  Created by alumne on 12/04/2023.
//

import Foundation
import SwiftUI

struct Game: Hashable, Decodable, Identifiable {
    var id: Int
    var usuario: String
    var puntuacion: Int
    var fecha: Date
    
}
