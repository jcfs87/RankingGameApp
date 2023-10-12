//
//  CoinListViewModel.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

import Foundation
import Combine

//Combine se utiliza para incluir las funcionalidades del framework Combine de Apple. Combine es un framework de programación reactiva que proporciona herramientas para trabajar con flujos de datos asíncronos y manejar eventos de forma declarativa. En este código, se utiliza para realizar solicitudes de red y manejar los valores emitidos por el editor AnyPublisher.

class CoinListViewModel: ObservableObject {
    
    private let cryptoService = CryptoService()
    
    @Published var coinViewModels = [CoinViewModel]()
    
    var cancellable: AnyCancellable?
    
    func fetchCoins() {
        cancellable = cryptoService.fecthCoins().sink(receiveCompletion: {
            _ in }, receiveValue: { cryptoContainer in
                self.coinViewModels = cryptoContainer.data.coins.map {
                    CoinViewModel($0)}
                print(self.coinViewModels)
        })
    }
    func updateFavorite(coinViewModel: CoinViewModel){
        if let index = coinViewModels.firstIndex(of: coinViewModel) {
            coinViewModels[index].isFavorite.toggle()
            saveFavorites()
        }
    }
    private func saveFavorites() {
        let favorites = coinViewModels.filter {
            $0.isFavorite}.map { $0.name}
        UserDefaults.standard.set(favorites, forKey: "favoritesCoins")
    }
}

//La estructura CoinViewModel representa un ViewModel para un objeto Coin. Contiene propiedades y métodos para formatear los datos de la moneda y proporcionar una representación de texto para su visualización.
struct CoinViewModel: Hashable {
    private let coin: Coin
    var isFavorite = false
    
    init(_ coin: Coin) {
                
    self.coin = coin
    }
            
    var name: String {
        return coin.name
    }
    var formattedPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        guard let price = Double(coin.price), let formatterPrice = numberFormatter.string(from: NSNumber(value: price)) else {return ""}
        return formatterPrice
    
    }
    
    var displayText: String {
        return name + " - " + formattedPrice
    }
}

