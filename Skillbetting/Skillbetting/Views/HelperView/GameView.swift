//
//  GameView.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

import SwiftUI

struct GameView: View {
    var game: GameModel
    
    var body: some View {
//        GeometryReader {geometry in}
        VStack(alignment: .center) {
            Image(game.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 200, maxHeight: 200)
                .border(Color.customColorPodio, width:3)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10)
                .padding(5)
                
            Text(game.name)
                .foregroundColor(.textColor)
                .font(.headline)
                .padding(.top, 5)
        }
    }
}
