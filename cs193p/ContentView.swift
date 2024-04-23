//
//  ContentView.swift
//  cs193p
//
//  Created by Italo Guilherme Monte on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true, emoji: "🐴" )
            CardView(emoji: "🐥")
            CardView(isFaceUp: true, emoji: "🐙")
            CardView(emoji: "🐢")
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    var isFaceUp: Bool = false
    var emoji: String = ""
    
    var body: some View {
        ZStack (content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text(emoji).font(.largeTitle)
            } else {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.orange)
            }
        })
    }
}
#Preview {
    ContentView()
}
