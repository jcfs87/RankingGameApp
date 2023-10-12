//
//  GameModel.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

import Foundation
import SwiftUI

//Aqui definimos el modelo de datos para crear los juegos
struct GameModel: Identifiable {
    var id = UUID()
    var name: String
    var imageName : String
    var gammers : [Gammer]
    
    init(name: String, imageName: String, gammers: [Gammer]) {
        self.name = name
        self.imageName = imageName
        self.gammers = gammers
    }
    // Creamos un constructor con array gammers vacio para poder crear juegos adicionales, y asi darle una vista
    // mas agradable al usuario, y de como podria quedar la aplicacion en un futuro
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
        self.gammers = []
    }
}
