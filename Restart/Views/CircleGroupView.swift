//
//  CircleGroupView.swift
//  Restart
//
//  Created by Francesco Maria Moneta on 6/11/22.
//

import SwiftUI

struct CircleGroupView: View {
    //State property wrapper, allow us to set values in elements
    //managed by swiftUI
    @State var ShapeColor : Color
    @State var ShapeOpacity : Double
    @State private var isAnimating : Bool = false
    var body: some View {
        ZStack
        {
            Circle()
                .stroke(ShapeColor .opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 230, height: 230, alignment: .center)
            Circle()
                .stroke(ShapeColor .opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 230, height: 230, alignment: .center)
        }// : ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1.0),value: isAnimating)
        .onAppear(perform: {
            isAnimating = true})
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
