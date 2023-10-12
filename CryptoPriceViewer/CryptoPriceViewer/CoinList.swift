//
//  ContentView.swift
//  CryptoPriceViewer
//
//  Created by Juan carlos Faria santiago on 25/4/23.
//

import SwiftUI
import Combine

struct CoinList: View {
   @ObservedObject private var viewModel = CoinListViewModel()
    var body: some View {
        List(viewModel.coinViewModels, id: \.self) {
            CoinViewModel in Text(CoinViewModel.name + "-" + CoinViewModel.formattedPrice)
            
        }.onAppear {
            self.viewModel.fetchCoins()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinList()
    }
}

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
}

struct CoinViewModel: Hashable {
    private let coin: Coin
            
    var name: String {
        return coin.name
    }
    var formattedPrice: String {
        return coin.price
    }
    
    init(_ coin: Coin) {
                
    self.coin = coin
    }
}


