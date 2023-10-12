//
//  CoinListView.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

import Foundation

import SwiftUI

struct CoinListView: View {
    
    @ObservedObject private var viewModel = CoinListViewModel()
    @State private var showOnlyFavorite = false
     var body: some View {
         NavigationView {
                List(viewModel.coinViewModels.filter{ !showOnlyFavorite || $0.isFavorite}, id: \.self) {
                     coinViewModel in
                    
                        HStack {
                            Text(coinViewModel.displayText)
                            Spacer()
                            Button(action: {
                                viewModel.updateFavorite(coinViewModel: coinViewModel)
                        
                            }) {
                                if coinViewModel.isFavorite {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                } else {
                                    Image(systemName: "star")
                                }
                        }
                    }
            }
            
          .onAppear {
                 self.viewModel.fetchCoins()
             }
             .navigationTitle("navi-coin-title-key")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Toggle(isOn: $showOnlyFavorite) {
                        Text("Favorites-key")
                    }
                }
            }
             
         }
         
     }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}

