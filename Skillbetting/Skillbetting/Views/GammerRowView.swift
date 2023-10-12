//
//  GammerRowView.swift
//  Skillbetting
//
//  Created by Juan carlos Faria santiago on 19/4/23.
//

import SwiftUI


struct GammerRowView: View {
    @Binding var showPopup :Bool
    var gammer: Gammer
    var body: some View {
        HStack {
            Image(systemName: "moon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    showPopup.toggle()
                }
                .sheet(isPresented: $showPopup, content: {
                    GammerDetailView(showPopUp: self.$showPopup)
                })
                 Text(gammer.usuario)
                 Text("Puntuacion: \(gammer.puntuacion)")
            
        }
    }
}
//struct GammerRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        GammerRowView()
//    }
//}
