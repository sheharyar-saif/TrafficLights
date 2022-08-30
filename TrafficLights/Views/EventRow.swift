//
//  EventRow.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 30/08/2022.
//

import SwiftUI

struct EventRow: View {
      let currentDate: DateFormatter = {
      let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d yyyy HH:mm:ss Z"
        formatter.timeZone = TimeZone(abbreviation: "GMT+5")

      return formatter
    }()
    @ObservedObject var event: History
    var body: some View {
        HStack (spacing: 4) {
            event.eventname.map(Text.init)
                .font(.system(size: 11, weight: .light, design: .rounded))
            event.timestamp.map{ Text(currentDate.string(from: $0)) }
                .font(.system(size: 11, weight: .light, design: .rounded))
        }
        .frame(alignment: .leading)
    }
}
