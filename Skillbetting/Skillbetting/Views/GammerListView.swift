//
//  GammerListView.swift
//  Skillbetting
//
//  Created by Juan carlos Faria santiago on 19/4/23.
//

import SwiftUI

struct GammerListView: View {
    @EnvironmentObject var gameviewmodel: GameViewModel
    @State private var showPopup = false
    var game: GameModel
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .foregroundColor(Color.clear)
                    .background(Color.GammerListColor2)
                    
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.customColorPodio)
                            .edgesIgnoringSafeArea(.bottom)
                        
                        VStack {
                            Text("Leader-key")
                                .foregroundColor(.textColor)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 20)
                            HStack(spacing: 30) {
                                if game.gammers.count >= 3 {
                                    TopGammerRowView(gammer: game.gammers[1], position: 1)
                                        .offset(x: 10, y: 20)
                                    TopGammerRowView(gammer: game.gammers[0], position: 0)
                                        .offset(x: 5, y: -20)
                                    TopGammerRowView(gammer: game.gammers[2], position: 2)
                                        .offset(x: 10, y: 20)
                                } else if game.gammers.count == 2 {
                                    TopGammerRowView(gammer: game.gammers[1], position: 1)
                                        .offset(x: 0, y: 0)
                                    TopGammerRowView(gammer: game.gammers[0], position: 0)
                                        .offset(x: 0, y: 0)
                                } else if game.gammers.count == 1 {
                                    TopGammerRowView(gammer: game.gammers[0], position: 0)
                                        .offset(x: 0, y: 0)
                                } else {
                                    Text("No gammer data available")
                                }
                            }
                            .frame(height: geometry.size.height * 0.4)
                        }
                        
                    }
                    .clipShape(CustomShape())
                        VStack {
                            ScrollView{
                                LazyVGrid(columns: columns, spacing: 10){
                                    ForEach(game.gammers.dropFirst(3).indices, id: \.self) {
                                        index in
                                        HStack {
                                        Text("\(index + 1)")
                                            .foregroundColor(.textColor)
                                            .padding()
                                        GammerRowView(gammer:
                                    game.gammers[index])
                                    }
                                  }
                                    .listStyle(PlainListStyle())
                                }
                            }
                           
//                            .background(Color.GammerListColor2)
                        .frame(height: geometry.size.height * 0.6)
                               
                    }
                }
            }
                
        }
    }
}



struct CustomShape: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let path = Path {
            path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY - rect.height * 0.3))
            path.closeSubpath()
        }
        return path
    
   }

}

