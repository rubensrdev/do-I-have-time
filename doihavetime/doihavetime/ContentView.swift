//
//  ContentView.swift
//  doihavetime
//
//  Created by Ruben on 22/4/24.
//

import SwiftUI

struct ContentView: View {
    
    var defaultDurationTimes: [String] = [
        "30 min",
        "90 min",
        "100 min",
        "120 min"
    ]
    
    @State var startTime: Date = .now
    @State var duration: Date = .now
    
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
                    
                    Image(systemName: "eye")
                        .foregroundStyle(.myPurple)
                    
                    Text("Start Watching")
                        .bold()

                    
                    DatePicker( "Start watching", selection: $startTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
            }
            .frame(height: 100)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.myGray)
                
                VStack {
                    
                    HStack {
                        
                        Image(systemName: "timer")
                            .foregroundStyle(.myPurple)
                        
                        Text("Duration movie or chapter")
                            .bold()

                    }
                    .padding(.bottom)
                    
                    HStack {
                        
                        Text("Selected duration: \(duration) min")
                        
                    }
                    .padding(.bottom)
                    
                    HStack {
                        
                        ForEach(0..<defaultDurationTimes.count) { i in
                            Button("\(defaultDurationTimes[i])", action: {
                                
                            })
                        }
                        
                    }
                    .padding(.bottom)
                    
                }
                
            }
            .frame(height: 250)
            
            Spacer()
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
