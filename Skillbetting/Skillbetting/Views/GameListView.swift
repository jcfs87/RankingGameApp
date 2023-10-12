//
//  GameListView.swift
//  Skillbetting
//
//  Created by alumne on 13/04/2023.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject var gameviewmodel: GameViewModel
    @State private var searchText = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    let columns = [GridItem(.adaptive(minimum: 150))]
    var filteredGames: [GameModel] {
        if searchText.isEmpty {
            return gameviewmodel.listGames
        } else {
            return gameviewmodel.listGames.filter{ $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
        var body: some View {
           NavigationView{
               
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(filteredGames, id:\.id){
                            game in NavigationLink(destination: GammerListView(game: game)){
                                GameView(game: game)
                                    
                            }
                        }
                        
                    }
                    .padding(.top, 60)
                    
                }
                .navigationBarTitle("navi-var-title-key", displayMode: .inline)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.colorGameList1, .colorGameList2]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                )
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("search-key", text: $searchText)
                }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color(.systemGray6))
                          .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    , alignment: .top
                )
            }
            
        }
    }
    
    struct GameListView_Previews: PreviewProvider {
        static var previews: some View {
            GameListView()
                .environmentObject(GameViewModel())
        }
    }

