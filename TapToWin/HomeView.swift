//
//  ContentView.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds
import SpriteKit
import FirebaseAnalytics

struct HomeView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    @State var isShowingOtherApps: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Spacer()
                    Image(systemName: "hand.tap.fill")
                        .resizable()
                        .foregroundColor(Color.blue)
                        .frame(width: UIScreen.main.bounds.width*0.3, height: UIScreen.main.bounds.width*0.3)
                        .padding(.bottom, UIScreen.main.bounds.height*0.03)
                    Text("Tap To Win")
                        .font(.system(size: 40, weight: .black))
                        .foregroundColor(.white)
                        .padding(.bottom, UIScreen.main.bounds.height*0.2)
                    ButtonComponent(text: "Start", variant: .blue, action: {
                        viewModel.isPresentingView = .difficultySelector
                    }).padding(.horizontal, 20)
                    .padding(.bottom, UIScreen.main.bounds.height*0.02)
                    HStack {
                        Image(systemName: "app.gift")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color.white)
                        Text("More games")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color.white)
                        
                    }
                    .padding(.all, 4)
                    .onTapGesture {
                        Analytics.logEvent("MoreGames", parameters: ["app": "more games"])
                        isShowingOtherApps = true
                    }
                    .padding(.bottom, UIScreen.main.bounds.height*0.05)
                    BannerAd(unitID: viewModel.AdMobBannerCode)
                        .frame(height: 90)
                    .padding(.bottom, UIScreen.main.bounds.height*0.03)
                }.padding(.horizontal, 20)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $isShowingOtherApps, content: {
            OtherApps()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
