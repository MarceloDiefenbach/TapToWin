//
//  GameView.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

import SwiftUI
import SpriteKit

enum Difficulty {
    case easy, medium, hard;
}

struct GameView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    @State var difficulty: Difficulty?
    @State private var positionTop: Double = UIScreen.main.bounds.height*0
    @State private var positionBottom: Double = UIScreen.main.bounds.height*0.95
    @State private var valueChange: Double = 0
    @State private var winController: Int = 0
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        scene.viewModel = self.viewModel
        return scene
    }

    var body: some View {
        ZStack{
            SpriteView(scene: self.scene)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            VStack {
                if viewModel.points != 0 {
                    if viewModel.points >= 0 {
                        Text("You're losing")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(.white)
                            .padding(.bottom, UIScreen.main.bounds.height*0.1)
                            .rotationEffect(Angle(degrees: 180))
                        Spacer()
                    }
                    if viewModel.points <= 0 {
                        Spacer()
                        Text("You're losing")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(.white)
                            .padding(.bottom, UIScreen.main.bounds.height*0.1)
                    }
                }
            }
            VStack {
                Spacer()
                BannerAd(unitID: viewModel.AdMobBannerCode).frame(height: 50)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(difficulty: .easy)
    }
}
