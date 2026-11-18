//
//  ContentView.swift
//  TapFrenzy
//
//  Created by Shamal Rathnayake on 2026-11-15.
//

import SwiftUI

struct ContentView: View {

    @State private var score = 0
    var progress: Double { 1 }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Tap Frenzy")
                .font(.system(size: 36, weight: .bold))
            Text("score").padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
            Text("\(score)").padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                .font(.system(size: 68, weight: .bold))

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.white.opacity(0.075))
                    Capsule().fill(Color.black.opacity(1)).frame(width: geo.size.width * progress)
                }
            }
            .frame(height: 10)
            .padding(.horizontal, 30)
            .animation(.linear(duration: 0.1), value: 5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    ContentView()
}
