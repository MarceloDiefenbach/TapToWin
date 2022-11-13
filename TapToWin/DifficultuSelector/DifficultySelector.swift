//
//  DifficultySelector.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

import SwiftUI
import FirebaseAnalytics

struct DifficultySelector: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    @State var isPresentingGameView: Bool = false
    @State var difficultySelected: Difficulty = .easy
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ButtonComponent(text: "Easy", variant: .blue, action: {
                    viewModel.difficulty = .easy
                    viewModel.isPresentingView = .gameRun
                    Analytics.logEvent("easy", parameters: ["selected": "easy"])
                })
                ButtonComponent(text: "Medium", variant: .orange, action: {
                    viewModel.difficulty = .medium
                    viewModel.isPresentingView = .gameRun
                    Analytics.logEvent("medium", parameters: ["selected": "medium"])
                })
                ButtonComponent(text: "Hard", variant: .red, action: {
                    viewModel.difficulty = .hard
                    viewModel.isPresentingView = .gameRun
                    Analytics.logEvent("hard", parameters: ["selected": "hard"])
                })
                ButtonComponent(text: "Back", variant: .clearWhite, action: {
                    viewModel.difficulty = .hard
                    viewModel.isPresentingView = .home
                })
                .padding(.bottom, UIScreen.main.bounds.height*0.01)
                           
            }.padding(.horizontal, 20)
            
            VStack {
                Spacer()
                BannerAd(unitID: viewModel.AdMobBannerCode)
                    .frame(height: 50)
            }
        }.preferredColorScheme(.dark)
    }
}

struct DifficultySelector_Previews: PreviewProvider {
    static var previews: some View {
        DifficultySelector()
    }
}
