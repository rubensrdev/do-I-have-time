//
//  ContentView.swift
//  doihavetime
//
//  Created by Ruben on 22/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Do I Have Time?")
                .font(.title2)
                .bold()
                .foregroundStyle(.myPurple)
                .padding()
            
            Text("I help you know if you will have time to watch that movie or episode of your favorite series")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
