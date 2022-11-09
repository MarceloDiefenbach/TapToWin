//
//  Button.swift
//  TapToWin
//
//  Created by Marcelo Diefenbach on 05/11/22.
//

import Foundation

import SwiftUI

enum ButtonVariant {
    case blue, orange, red, clearWhite, white
}

struct ButtonComponent: View {
    
    @State var text: String
    @State var variant: ButtonVariant
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            if variant == .white {
                Text(text)
                    .foregroundColor(Color.black)
                    .font(.system(.largeTitle))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
                
            } else if variant == .clearWhite {
                Text(text)
                    .foregroundColor(Color.white)
                    .font(.system(.title))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                    .cornerRadius(20)
                
            } else if variant == .blue {
                Text(text)
                    .foregroundColor(Color.white)
                    .font(.system(.largeTitle))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(20)
                
            } else if variant == .orange {
                Text(text)
                    .foregroundColor(Color.white)
                    .font(.system(.largeTitle))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(20)
                
            } else if variant == .red {
                Text(text)
                    .foregroundColor(Color.white)
                    .font(.system(.largeTitle))
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(20)
            }
        })
    
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(text: "Start", variant: .orange, action: { })
    }
}
