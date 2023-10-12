//
//  TopGammerRowView.swift
//  Skillbetting
//
//  Created by Juan carlos Faria santiago on 20/4/23.
//

import SwiftUI
import KingfisherSwiftUI

struct TopGammerRowView: View {
    @EnvironmentObject var gameviewmodel: GameViewModel
    var gammer: Gammer
    var position: Int
   
    @State var showPopup = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                KFImage(URL(string: gammer.avatar))
                
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.3)
                    .overlay(Circle().stroke(Color.white, lineWidth :2),alignment:.center)
                    .shadow(radius: 4)
                    .overlay(
                       Circle()
                        .stroke(position == 0 ? Color.gold : position == 1 ? Color.silver : position == 2 ? Color.bronze: Color.clear, lineWidth: 6), alignment: .center)
                    .onTapGesture {
                        gameviewmodel.selectGammer = gammer
                        showPopup.toggle()
                    }
                    .sheet(isPresented: $showPopup, content: {
                        GammerDetailView(showPopUp: self.$showPopup)
                    })
                    
                Text(gammer.player)
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)
                Text("\(gammer.score)")
                    .fontWeight(.bold)
                    .foregroundColor(.textColor)

            }
        }
       
    }
}

