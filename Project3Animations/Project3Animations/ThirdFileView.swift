//
//  ThirdFileView.swift
//  Project3Animations
//
//  Created by Zack Klopukh on 11/13/23.
//

import SwiftUI

// This code allows users the magnify the circle as its gesture. When magnifying the circle too large an animation will trigger saying that your circle is too big, and will reset the size.
struct ThirdFileView: View {
    
    let colors = Gradient(colors: [Color.yellow,
                                   Color.red, Color.yellow, Color.red, Color.red])
    @State private var magnification: CGFloat = 1
    @State private var isAnimationActive = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                
                let magnificationGesture =
                MagnificationGesture(minimumScaleDelta: 0)
                    .onChanged( { value in
                        self.magnification = value
                    })
                    .onEnded { _ in
                        print(magnification)
                        if (magnification > 3) {
                            self.magnification = 1
                            withAnimation {
                                self.isAnimationActive.toggle()
                            }
                        }
                    }
                
                //ellispe code from class with overlay
                Ellipse()
                    .stroke(style: StrokeStyle(lineWidth: 10, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: CGFloat(10)))
                    .frame(width: 125, height: 125)
                    .overlay(Ellipse()
                        .fill(RadialGradient (gradient: colors,
                                              center: .center,
                                              startRadius: CGFloat(0),
                                              endRadius: CGFloat(150)))
                            .frame(width: 120, height: 120)
                    )
                    .gesture(magnificationGesture)
                    .scaleEffect(magnification)
                Text("Magnify")
                
            }
            .padding(100)
            
            //this code makes it so when isAnimationActive is triggered, it will do the onAppear animation, then toggle to false to trigger the onDisappear animation
            if isAnimationActive {
                Text("Too Big!")
                    .font(.system(size: 20, weight: .bold))
                    .opacity(1.0)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            self.isAnimationActive.toggle()
                        }
                    }
                    .onDisappear {
                        withAnimation(.easeInOut(duration: 1.0)) {
                        }
                    }
            }
        }
    }
}

#Preview {
    ThirdFileView()
}
