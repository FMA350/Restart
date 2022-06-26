//
//  OnView.swift
//  Restart
//
//  Created by Francesco Maria Moneta on 6/10/22.
//

import SwiftUI

struct HomeView: View {
    //while not actually applied, we are going to set the variable to
    //this value, since it is the value the variable would have
    //if the app was on this screen.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        VStack (spacing: 20){
            // MARK: - HEADER
            
          
            ZStack
            {
                Spacer()
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeOut(duration: 4).repeatForever() , value: isAnimating)
                //Circles
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
            }// : Zstack
            //MARK: - Center
            Text("""
            “Without training, they lacked knowledge.
            Without knowledge, they lacked confidence.
            Without confidence, they lacked victory.”
            ― Julius Caesar
            """)
                .font(.caption)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
            
            //MARK: - Footer
            
          //  Spacer()
            Button {
                withAnimation(.easeOut) {
                    isOnboardingViewActive = true;
                }
            }
            label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } // : Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } // :VStack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct OnView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
