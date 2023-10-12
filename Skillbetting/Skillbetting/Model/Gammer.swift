//
//  Gammer.swift
//  Skillbetting
//
//  Created by alumne on 14/04/2023.
//

import Foundation
import SwiftUI

struct Gammer: Hashable, Decodable, Identifiable {
    var id: String
    var usuario: String
    var puntuacion: Int
    var fecha: Date
    var foto: String
    
}
