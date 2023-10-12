//
//  GameViewModel.swift
//  Skillbetting
//
//  Created by alumne on 12/04/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var game: [Gammer] = []
    @Published var selectGammer: Gammer? = nil
    @Published var listGames: [GameModel] = []


    init() {
//        let url3 = URL(string: "http://192.168.192.51:8000/api/footballgame")!
//         getGamersData(from: url3) { gamers in
//            if let gamers = gamers {
//                DispatchQueue.main.async {
//                    let gameModel3 = GameModel(name: "Futbol", imageName: "football", gammers : gamers)
//                    self.listGames.append(gameModel3)
////                    print(self.listGames[0])
//                }
//            } else {
//                print("Error al obtener los datos.")
//        }
//    }
//        // Creamos los juegos desde la API mongodb
//        let url1 = URL(string: "http://192.168.192.51:8000/api/bugblast")!
//         getGamersData(from: url1) { gamers in
//            if let gamers = gamers {
//                DispatchQueue.main.async {
//                    let gameModel1 = GameModel(name: "Bugblast", imageName: "bugblast", gammers : gamers)
//                    self.listGames.append(gameModel1)
//
//                }
//            } else {
//                print("Error al obtener los datos.")
//        }
//    }
//        let url2 = URL(string: "http://192.168.192.51:8000/api/spacewars")!
//         getGamersData(from: url2) { gamers in
//            if let gamers = gamers {
//                DispatchQueue.main.async {
//                    let gameModel2 = GameModel(name: "SpaceWars", imageName: "spacewars", gammers : gamers)
//                    self.listGames.append(gameModel2)
//
//                }
//            } else {
//                print("Error al obtener los datos.")
//        }
//    }
      


//        Cargar juegos desde json local
         let futbolGame = loadFromJsonLocal("futbolGame.json")
        let game1 = GameModel(name: "Football", imageName: "football",gammers: futbolGame)
        listGames.append(game1)
        let bugblastGame = loadFromJsonLocal("bugblast.json")
        let game2 = GameModel(name: "Bugblast", imageName: "bugblast",gammers: bugblastGame)
        listGames.append(game2)
        let game3 = GameModel(name: "SpaceWars", imageName: "spacewars", gammers: bugblastGame)
        listGames.append(game3)
//         Cargar juegos sin datos en el gammer
        let game4 = GameModel(name: "Billar", imageName: "billar", gammers: futbolGame)
        listGames.append(game4)
        let game6 = GameModel(name: "Car", imageName: "car", gammers: futbolGame)
        listGames.append(game6)
        let game7 = GameModel(name: "Fighter", imageName: "fightert",gammers: futbolGame)
        listGames.append(game7)
        let game5 = GameModel(name: "Blackjack", imageName: "blackjack")
        listGames.append(game5)
        let game8 = GameModel(name: "Ruleta", imageName: "ruleta")
        listGames.append(game8)


    }
//    Metodo loadFromJsonLocal decodifica los datos de Json, los cuales fueron creados para poder hacer la app
//    ya que el modelo de datos del json es igual al recibido desde la API "mongoDb".
  func loadFromJsonLocal(_ filename: String) -> [Gammer]{
            
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
            }
            do {
                let data = try Data(contentsOf: file)
                let decoder = JSONDecoder()
                
                var response = try decoder.decode([Gammer].self, from: data)
                response.sort(by: {$0.score > $1.score})
                return response
            } catch {
                fatalError("Couldn't parse \(filename) as \(Gammer.self):\n\(error)")
            }
        }
//        Decodifica los datos recibidos desde la API
//    Nota: este metodo solo funciona cuando estamos conectados a la API mongodb
    func getGamersData(from url: URL, completion: @escaping ([Gammer]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                var gamersData = try JSONDecoder().decode([Gammer].self, from: data)
                gamersData.sort(by: {$0.score > $1.score})
                completion(gamersData)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

