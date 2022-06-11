//
//  ContentView.swift
//  Restart
//
//  Created by Francesco Maria Moneta on 6/9/22.
//

import SwiftUI

struct ContentView: View {
    //Creates a new variables in UserDefaults (called insOnBoar...) and sets
    //it to true.
    
    //Prop wrap| user def key | actual prop name in swift  | value
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    var body: some View {
        ZStack{
            if isOnBoardingViewActive
            {
                OnboardingView()
            }
            else
            {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone13")
    }
}
