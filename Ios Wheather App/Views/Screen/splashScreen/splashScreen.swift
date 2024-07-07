//
//  ContentView.swift
//  Ios Wheather App
//
//  Created by Bholanath Barik on 06/07/24.
//

import SwiftUI

struct splashScreen: View {
    @State private var isActive = false;
    
    var body: some View {
        VStack {
            if self.isActive {
                Home(searchViewModel: SearchViewModel())
        } else {
                ZStack {
                        // Background Color
                        Color.primary3
                            .edgesIgnoringSafeArea(.all)
                            
                        // Your content
                        VStack {
                            Image(.mainIcon)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .foregroundColor(.white)
                        }
                    }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    splashScreen()
}
