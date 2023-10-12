//
//  GammerRowView.swift
//  Skillbetting
//
//  Created by Juan carlos Faria santiago on 19/4/23.
//

import SwiftUI
import KingfisherSwiftUI

struct GammerRowView: View {
   @State var showPopup = false
   @EnvironmentObject var gameviewmodel: GameViewModel
    var gammer: Gammer
    var body: some View {
        HStack {
            KFImage(URL(string: gammer.avatar))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .overlay(Circle().stroke(Color.white, lineWidth :2),alignment:.center)
                .shadow(radius: 4)
                .onTapGesture {
                    gameviewmodel.selectGammer = gammer
                    showPopup.toggle()

                }
                .sheet(isPresented: $showPopup, content: {
                    GammerDetailView(showPopUp: self.$showPopup)
                })
                 Text(" \(gammer.player)")
                    .foregroundColor(.textColor)
                 Spacer()
                 Text("  \(gammer.score)")
                    .foregroundColor(.textColor)
                    .padding()
                
            
        }
    }
}
