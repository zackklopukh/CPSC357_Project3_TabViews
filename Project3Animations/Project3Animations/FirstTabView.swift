//
//  FirstTabView.swift
//  Project3Animations
//
//  Created by Zack Klopukh on 11/13/23.
//

import SwiftUI

//This is the most simple view in this project. It uses a longPress gesture and a rotating animation to make the arrow go across the circle back and fourth
//Most of this code comes from class
struct FirstTabView: View {
    @State private var isSpinning = true
    
    var body: some View {
        
        let longPress = LongPressGesture(minimumDuration: 3, maximumDistance: 100)
            .onEnded() {_ in
                print("here")
                isSpinning.toggle()
            }
        
        ZStack {
            Text("hold for 3 seconds")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .gesture(longPress)
            
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.red)
                .frame(width: 360, height: 360)
            Image(systemName: "forward.fill")
                .font(.largeTitle)
                .offset(y: -180)
                .rotationEffect(.degrees(isSpinning ? 0 : 360))
                .animation(
                    Animation.linear(duration: 3))
        } .onAppear() {
           // self.isSpinning.toggle()
        }
    }
}

#Preview {
    FirstTabView()
}
