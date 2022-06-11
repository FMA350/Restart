//
//  OnboardingView.swift
//  Restart
//
//  Created by Francesco Maria Moneta on 6/10/22.
//

import SwiftUI

struct OnboardingView: View {
    //only applies the 'true' if onboarding is not found.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0;
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack (spacing: 20)
            {
                //MARK: - HEADER
                
                Spacer()
                VStack(spacing: 0)
                {
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                        “You have power over your mind - not outside events. Realize this, and you will find strength.”
                        """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                } // : Header
                //MARK: - CENTER
                ZStack
                {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.20)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } // : ZSTACK Center
                //MARK: - FOOTER
                Spacer()
                ZStack
                {
                    //1. Background
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    //2. Call-To-Action (static)
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 10)
                    //3. Capsule (Dynamic width)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    //4. Circle (draggable)
                    HStack {
                        ZStack
                        {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                             
                        } // : ZStack
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ _ in
                                    if buttonOffset > buttonWidth / 2{
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    }
                                    else
                                    {
                                        buttonOffset = 0;
                                    }
                                })
                        )//: GESTURE
                        
                        Spacer()

                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()

            } // : VStack
        } // : ZStack
        
        
       
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
