//
//  ContentView.swift
//  TapFrenzy
//
//  Created by Shamal Rathnayake on 2026-11-15.
// 

import SwiftUI

struct ContentView: View {
    
    @State private var score = 0
    
    var body: some View {
        VStack (alignment: .leading, spacing: 24 ){
            Text("Tap Frenzy")
                .font(.system(size: 36, weight: .bold))
            Text("score").padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
            Text("\(score)").padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 0))
                .font(.system(size: 68, weight: .bold))
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
    }
}

#Preview {
    ContentView()
}
