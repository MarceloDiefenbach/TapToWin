//
//  GameViewModel.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

import Foundation

enum PresentingViews {
    case home, difficultySelector, gameRun, winView;
}

class GameViewModel: ObservableObject {
    
    @Published var AdMobBannerCode: String = "ca-app-pub-7490663355066325/2189993229"
    
    @Published var isPresentingGameView: Bool = false
    @Published var isPresentingView: PresentingViews = .home
    @Published var difficulty: Difficulty = .easy
    @Published var winColor: String?
    @Published var points: Int = 0
    
    
    func winnerText() -> String {
        if winColor == "Green" {
            return "GREEN WIN"
        } else {
            return "BLUE WIN"
        }
    }
    
}
