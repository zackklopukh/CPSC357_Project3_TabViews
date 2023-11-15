//
//  SecondFileView.swift
//  Project3Animations
//
//  Created by Zack Klopukh on 11/13/23.
//

import SwiftUI

// This code uses a fair amount of code from class as well, combining the drag gesture with the appearing text animation. It tracks when the smiley face is dragged above the rectangualar figure to trigger the animaiton.
struct SecondFileView: View {
    
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnabled: Bool = false
    @State private var finalPosition: CGSize = .zero
    @State private var isAnimationActive: Bool = false
    
    let colors = Gradient(colors: [Color.red,
    Color.yellow, Color.green, Color.blue, Color.purple])
    
    var body: some View {
        
        let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in
                state = dragValue.translation
            } .onEnded() { dragValue in
                self.finalPosition = dragValue.translation
                print("Final Position: \(self.finalPosition)")
                
                let finalYPosition = dragValue.translation.height
                if (finalYPosition < -350) {
                    withAnimation {
                        self.isAnimationActive.toggle()
                    }
                }
            }
        VStack {
            if (isAnimationActive) {
                Text("Spooky Text")
                    .font(.system(size: 20, weight: .bold))
                    .opacity(isAnimationActive ? 1.0 : 0.0)
                    .animation(.easeInOut(duration: 1.0))
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
                .frame(width: 500, height: 20)
                .padding(200)
            Text("Drag me Above the line")
                .font(.system(size: 20, weight: .bold))
            Image(systemName: "smiley.fill")
                .resizable()
                .font(.largeTitle)
            // .gesture(magnificationGesture)
            // .scaleEffect(magnification)
                .offset(offset)
                .gesture(drag)
                .frame(width: 100, height: 90)
                    
        }
        //.offset(y: -50)
    }
}

#Preview {
    SecondFileView()
}
