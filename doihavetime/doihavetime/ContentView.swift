//
//  ContentView.swift
//  doihavetime
//
//  Created by Ruben on 22/4/24.
//

import SwiftUI

struct ContentView: View {
    
    var defaultDurationTimes: [Int] = [
        30,
        90,
        100,
        120
    ]
    
    @State var startTime: Date = .now
    @State var duration: Int = 90
    @State var finishTime: Date = Date.now
    
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
                        .onChange(of: startTime, perform: { value in
                            calculateFinishTime()
                        })
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
                        
                        Button("", systemImage: "minus.circle", action: {
                            duration -= 1
                            calculateFinishTime()
                        })
                            .labelsHidden()
                            .foregroundStyle(.myPurple)
                        Button("", systemImage: "plus.circle", action: {
                            duration += 1
                            calculateFinishTime()
                        })
                            .labelsHidden()
                            .foregroundStyle(.myPurple)
                        
                    }
                    .padding(.bottom)
                    
                    HStack {
                        
                        ForEach(0..<defaultDurationTimes.count) { i in
                            let defaultDurationSelected = defaultDurationTimes[i]
                            Button("\(defaultDurationSelected) min", action: {
                                duration = defaultDurationSelected
                                print("Changed duration to \(defaultDurationSelected) min")
                                calculateFinishTime()
                            })
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .foregroundStyle(.myPurple)
                            .bold()
                            
                        }
                        
                    }
                    
                }
                
            }
            .frame(height: 150)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.black)
                
                VStack {
                    Text(finishTime, style: .time)
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .fontDesign(.serif)
                    
                    HStack {
                        Text(startTime, style: .time)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                        Text("+ \(duration) min")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                }
                
            }
            .frame(height: 100)
            
            Spacer()
        }
        .padding()
    }
    
    /*
     This function calculate the  the finish time for the movie based in the duration  chosed and  the start watching
     */
    func calculateFinishTime() {
        finishTime = startTime.addingTimeInterval(TimeInterval(duration * 60))
    }
    
}

#Preview {
    ContentView()
}
