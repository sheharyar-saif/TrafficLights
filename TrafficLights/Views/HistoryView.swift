//
//  HistoryView.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 28/08/2022.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: History.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \History.timestamp, ascending: true)])
    var events: FetchedResults<History>
    @State var del = Set<History>()
    
    var body: some View {
        VStack {
            List {
                ForEach(events, id: \.timestamp) {
                    EventRow(event: $0)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .refreshable {
                deleteList()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: HStack {
                Button (StringConstant.history.backbtn, action: {presentationMode.wrappedValue.dismiss()})
                Spacer()
                    .frame(width: UIScreen.main.bounds.width / 5)
                Text(StringConstant.history.title)
            }
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.green))
        }
    }
    
    func deleteList() {
        for items in events {
            managedObjectContext.delete(items)
        }
        del = Set<History>()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
