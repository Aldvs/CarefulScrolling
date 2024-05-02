//
//  ContentView.swift
//  CarefulScrolling
//
//  Created by admin on 01.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    var computedHeight: CGFloat {
        50
    }
    
    var body: some View {
        TabView {
            ExtractedScrollView(height: computedHeight)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("First")
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedScrollView: View {
    var height: CGFloat
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach(0..<101) {
                        Text("\($0)")
                            .font(.monospaced(.title2)())
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .contentMargins(.bottom, height, for: .scrollContent)
            .contentMargins(.bottom, height, for: .scrollIndicators)
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: height)
                    .foregroundStyle(.red)
                    .opacity(0.4)
            }
        }
    }
}
