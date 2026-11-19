//
//  ContentView.swift
//  TapFrenzy
//
//  Created by Shamal Rathnayake on 2026-11-15.
//

import SwiftUI

struct ContentView: View {

    @State private var score = 0
    @State private var maxTime: Double = 10.0
    @State private var spentTime: Double = 0.0
    private var progress: Double {
        guard maxTime > 0 else { return 0 }

        let timeLeft = maxTime - spentTime
        return min(max(timeLeft / maxTime, 0), 1)
    }

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 24) {
                Text("Tap Frenzy")
                    .font(.system(size: 36, weight: .bold))

                Spacer()

                Text("score").foregroundStyle(.gray)
                Text("\(score)")
                    .font(.system(size: 68, weight: .bold))
                    .foregroundStyle(.green)

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule().fill(Color.white.opacity(0.9))
                        Capsule().fill(Color.green.opacity(1)).frame(
                            width: max(0, ceil(geo.size.width * progress))
                        )
                    }
                }
                .frame(height: 10)
                .padding(.horizontal, 30)
                .animation(.linear(duration: 0.1), value: progress)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .background(.black)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
