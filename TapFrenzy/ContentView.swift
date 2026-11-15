//
//  ContentView.swift
//  TapFrenzy
//
//  Created by Shamal Rathnayake on 2026-11-15.
// 

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 24 ){
            Text("Tap Frenzy")
                .font(.system(size: 36, weight: .bold))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
    }
}

#Preview {
    ContentView()
}
