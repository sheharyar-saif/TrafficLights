//
//  MainView.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 26/08/2022.
//
import Foundation
import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var signalState : SignalState = .go
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text(StringConstant.mainview.title)
                    .font(.system(size: 46, weight: .bold, design: .rounded))
                    .foregroundColor(.green)
                Spacer()
                VStack (spacing: 4) {
                    // Three Different Views to display a different simulation of lights. 
                    LightsView(lightColor: (signalState == .stop ? .red : .clear))
                    LightsView(lightColor: (signalState == .ready ? .yellow : .clear))
                    LightsView(lightColor: (signalState == .go ? .green : .clear))
                }
                .padding()
                .frame(width: 140, height: 250)
                .background(Image(StringConstant.mainview.offsignal)
                    .resizable()
                    .scaledToFit())
                Spacer()
                
                VStack {
                    Button(StringConstant.mainview.resetbtn) {
                        setLight(state: .go, event: StringConstant.mainview.restartpress)
                    }
                    .frame(width: 140, height: 60, alignment: .center)
                    .background(.red)
                    .opacity(0.6)
                    .cornerRadius(16)
                    
                    NavigationLink(destination: HistoryView()) {
                        Text(StringConstant.mainview.histbtn)
                    }
                    .frame(width: 140, height: 60, alignment: .center)
                    .background(.green)
                    .opacity(0.6)
                    .cornerRadius(16)
                }
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                Spacer()
            }.onReceive(timer) { time in
                counter+=1
                if counter == 5 && signalState == .go {
                    setLight(state: .ready, event: StringConstant.mainview.yellow)
                }
                else if counter == 2 && signalState == .ready {
                    setLight(state: .stop, event: StringConstant.mainview.red)
                }
                else if counter == 4 && signalState == .stop {
                    setLight(state: .go, event: StringConstant.mainview.green)
                }
            }
        }
    }
    
    func setLight(state: SignalState, event: String) {
        counter = 0
        signalState = state
        saveInDb(eventName: event, timeStamp: Date())
    }
    
    func saveInDb(eventName: String, timeStamp: Date) {
        let event = History(context: managedObjectContext)
        event.eventname = eventName
        event.timestamp = timeStamp
        saveContext()
    }

    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print(StringConstant.mainview.err ,(error))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
