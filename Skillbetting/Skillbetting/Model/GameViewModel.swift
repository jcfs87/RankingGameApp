//
//  GameViewModel.swift
//  Skillbetting
//
//  Created by alumne on 12/04/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var game: [Gammer]
    @Published var listGames: [GameModel] = [
        GameModel(name: "Fútbol", imageName: "futbol"),
        GameModel(name: "Bug Blast", imageName: "spider"),
        GameModel(name: "Space Wars", imageName: "spaceWar"),
        GameModel(name: "Billar", imageName: "billar"),
        GameModel(name: "Super", imageName: "billar"),
        GameModel(name: "xxxxxxx", imageName: "minecraft"),
        GameModel(name: "yyyyyyy", imageName: "billar"),
        GameModel(name: "Bug Blast", imageName: "spider")
    ]
    init() {
        self.game = GameViewModel.load("futbolGame.json")
        self.game.sort(by: { $0.puntuacion > $1.puntuacion})
    }
    
    
    
    static func load(_ filename: String) -> [Gammer]{
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let response = try decoder.decode(GammerResponse.self, from: data)
            return response.gammers
        } catch {
            fatalError("Couldn't parse \(filename) as \(GammerResponse.self):\n\(error)")
        }
    }
    
}


