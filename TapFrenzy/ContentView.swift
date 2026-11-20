//
//  ContentView.swift
//  TapFrenzy
//
//  Created by Shamal Rathnayake on 2026-11-15.
//

public import Combine
import SwiftUI

struct ContentView: View {

    @State private var score = 0
    @State private var maxTime: Double = 10.0
    @State private var spentTime: Double = 0.0
    @State private var isPlaying: Bool = false
    @State private var isGameOver: Bool = false
    private var progress: Double {
        guard maxTime > 0 else { return 0 }

        let timeLeft = maxTime - spentTime
        return min(max(timeLeft / maxTime, 0), 1)
    }

    private var barColor: Color {
        if !isPlaying { return Color.green }
        if progress > 0.6 { return Color.green }
        if progress > 0.3 { return Color.yellow }
        return Color.red
    }

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    func tap() {
        guard !isGameOver else { return }
        if !isPlaying { isPlaying = true }

        score += 1
    }

    func gameOver() {
        guard isPlaying else { return }
        isPlaying = false
        isGameOver = true
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
                        Capsule().fill(barColor.opacity(1)).frame(
                            width: max(0, ceil(geo.size.width * progress))
                        )
                    }
                }
                .frame(height: 10)
                .padding(.horizontal, 30)
                .animation(.linear(duration: 0.1), value: progress)

                Text(
                    isPlaying
                        ? "\(Int(ceil(maxTime - spentTime)))s left"
                        : "tap to start"
                ).font(.system(.body, design: .monospaced)).foregroundColor(
                    .gray
                )

                Spacer()

                Button {
                    tap()
                } label: {
                    Text("TAP").padding(75).background(.green).clipShape(
                        Circle()
                    )
                    .font(.system(size: 36, weight: .bold)).foregroundStyle(
                        .black
                    )
                }

                Spacer()

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .background(.black)
            .foregroundColor(.white)
        }
        .onReceive(timer) { _ in
            guard isPlaying else { return }
            spentTime += 0.1
            if spentTime >= maxTime {
                gameOver()
            }
        }
    }
}

#Preview {
    ContentView()
}
