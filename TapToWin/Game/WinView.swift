//
//  WinView.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 06/11/22.
//

import SwiftUI

struct WinView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            if viewModel.winColor == "Green" {
                Color.green.ignoresSafeArea()
            } else {
                Color.blue.ignoresSafeArea()
            }
            VStack (spacing: UIScreen.main.bounds.height*0.02) {
                Spacer()
                
                Text(viewModel.winnerText())
                    .font(.system(size: 80, weight: .black))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                ButtonComponent(text: "Restart", variant: .white, action: {
                    viewModel.difficulty = .medium
                    viewModel.isPresentingView = .difficultySelector
                })
                .padding(.top, UIScreen.main.bounds.height*0.3)
                
                ButtonComponent(text: "Back to menu", variant: .clearWhite, action: {
                    viewModel.difficulty = .hard
                    viewModel.isPresentingView = .home
                })
                           
            }
            .padding(.horizontal, 20)
        }
    }
    
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView()
    }
}
