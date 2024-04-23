//
//  ContentView.swift
//  doihavetime
//
//  Created by Ruben on 22/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var startTime: Date = .now
    
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
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.myGray)
                
                HStack {
                        
                    Text("Start Watching")
                    
                    DatePicker( "Start watching", selection: $startTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    
                }
                
            }
            .frame(height: 100)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
