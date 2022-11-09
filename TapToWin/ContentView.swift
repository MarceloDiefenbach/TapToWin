//
//  TapToWinApp.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

import SwiftUI

@main
struct TapToWinApp: App {
    
    @StateObject private var viewModel: GameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isPresentingView == .home {
                HomeView()
                    .environmentObject(viewModel)
                
            } else if viewModel.isPresentingView == .difficultySelector {
                DifficultySelector()
                    .environmentObject(viewModel)
                
            } else if viewModel.isPresentingView == .gameRun {
                GameView()
                    .environmentObject(viewModel)
                
            } else if viewModel.isPresentingView == .winView {
                WinView()
                    .environmentObject(viewModel)
            }
        }
    }
}
