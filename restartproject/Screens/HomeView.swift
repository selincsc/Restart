//
//  HomeView.swift
//  restartproject
//
//  Created by Selin Çağlar on 9.11.2022.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var isAnimating: Bool = false
    
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 20){
            
            // MARK: - HEADER
            
            Spacer()
            ZStack{
                CircleGroupView(ShapeColor: .secondary, ShapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y : isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                        ,value: isAnimating
                    )
            }
            Spacer()
            
            // MARK: - CENTER
            
            
            Text ("""
                    The time that leads to mastery is dependent on the intensity of our focus.
                    """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
            
            
            // MARK: - FOOTER
            Spacer()
            
            Button(action: {
                withAnimation{
                    isOnboardingViewActive = true
                    playSound(sound: "success", type: "m4a")
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text ("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//:button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            
        }//:VStack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}



// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
