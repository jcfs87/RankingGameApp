//
//  ContentView.swift
//  Skillbetting
//
//  Created by alumne on 31/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            GameListView()
                .tabItem({
                    Image(systemName: "gamecontroller")
                        .resizable()
                })
            CoinListView()
                .tabItem({
                    Image(systemName: "bitcoinsign.square")
                        .resizable()
                       
                        
                        
                    
                })
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameViewModel())
    }
}
extension Color {
    static let gold = Color(red: 1.0, green: 0.84, blue: 0.0)
    static let silver = Color(red: 0.75, green: 0.75, blue: 0.75)
    static let bronze = Color(red: 0.8, green: 0.5, blue: 0.2)
    static let textColor = Color( red: Double(0xe6) / 255.0,green: Double(0xe5) / 255.0,blue: Double(0xe5) / 255.0)
    static let customColorPodio = Color(red: Double(0x8b) / 255.0, green: Double(0x00) / 255.0,blue: Double(0xff) / 255.0)
    static let colorGameList1 = Color(red: 94/255, green: 94/255, blue: 159/255)
    static let colorGameList2 = Color(red: 63/255, green: 63/255, blue: 95/255)
    static let GammerListColor1: Color = Color(red: 28/255, green: 28/255, blue: 30/255)
    static let GammerListColor2: Color = Color(red: 53/255, green: 53/255, blue: 56/255)
}
