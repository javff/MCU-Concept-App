//
//  ContentView.swift
//  mcu-concept-app
//
//  Created by Juan vasquez on 22-01-22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPlaying = false
    @State var activePage = 0
    
    var body: some View {
        
        VStack {
            HeaderView()
            VerticalTabView(activeTab: $activePage) {
                MainView(isPlayging: $isPlaying, onTappedFooter: {
                    withAnimation {
                        activePage = 1
                    }
                })
                MoreInfoView()
            }
            .onDraggingChanged { value in
                print(value)
            }
        }
        .background(getBackground())
    }
    
    func getBackground() -> some View {
        if activePage == 0 {
            return AnyView(BackgroundView(skinName: "doctor-strange"))
        }
        
        let defaultBackgroundView = Color.black
            .ignoresSafeArea()
        return AnyView(defaultBackgroundView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


