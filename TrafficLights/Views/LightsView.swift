//
//  LightsView.swift
//  TrafficLights
//
//  Created by Sheharyar Saif on 30/08/2022.
//

import SwiftUI

struct LightsView: View {
    var lightColor: Color
    
    var body: some View {
    
        Image(StringConstant.mainview.signallight)
            .resizable()
            .renderingMode(.template)
            .foregroundColor(lightColor)
            .shadow(color: (lightColor), radius: 20)
            .blur(radius: 10)
            .frame(width: 52, height: 52, alignment: .center)
    }
}

