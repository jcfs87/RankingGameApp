//
//  GammerDetailView.swift
//  Skillbetting
//
//  Created by Juan carlos Faria santiago on 20/4/23.
//

import SwiftUI
import KingfisherSwiftUI

struct GammerDetailView: View {
    @Binding var showPopUp: Bool
    @EnvironmentObject var gameviewmodel: GameViewModel
   
    
    var body: some View {
        if let gammer = gameviewmodel.selectGammer{
            NavigationView {
                ZStack{
                  KFImage(URL(string: gammer.avatar))
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .blur(radius: 10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.all)
                                                
                    VStack {
                      KFImage(URL(string: gammer.avatar))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 200, height: 200)
                                .overlay(Circle().stroke(Color.white, lineWidth :4),alignment:.center)
                                .shadow(radius: 7)
                                .offset(y: 10)
                                .padding(.bottom, 10)
                                 
                        VStack(alignment: .center){
                            Text(gammer.player)
                                .font(.title)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Capsule().foregroundColor(Color.gray.opacity(0.2)))
                                .foregroundColor(.white)
                                
                            HStack{
                                BackgroundedText(text: "Fecha \(gammer.date)")
                                    
                                BackgroundedText(text: "Score \(gammer.score)")
                                }
                                
                    }
              }
                    
         }
                
        .navigationBarItems(trailing: Button(action: {self.showPopUp = false}){
        Text("Back-key")
         })
      }
    }
  }
}
struct BackgroundedText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Capsule().foregroundColor(Color.gray.opacity(0.2)))
            .foregroundColor(.white)
    }
}


