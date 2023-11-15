//
//  ContentView.swift
//  Project3Animations
//
//  Created by Zack Klopukh on 11/13/23.
//

import SwiftUI

//This view create a three seperate tabs with different figuire, animation, gesture combinations
struct ContentView: View {
    var body: some View {
        TabView {
            TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                    Text("First")
                }
            SecondFileView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Second")
                }
            ThirdFileView()
                .tabItem {
                    Image(systemName: "02.circle")
                    Text("Third")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
