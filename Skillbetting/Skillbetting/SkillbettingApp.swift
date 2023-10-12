//
//  SkillbettingApp.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

import SwiftUI

@main
struct SkillbettingApp: App {
    @StateObject private var gameviewmodel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameviewmodel)
        }
    }
}

