//
//  ContentView.swift
//  Braindance
//
//  Created by William Dupont on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    let details = CardDetails.exampleDetails
    
    var body: some View {
        CardComponent(title: details.title, subtitle: details.subtitle, caption1: details.caption1, caption2: details.caption2, code: details.code)
    }
}

struct CardComponent: View {
    let title: String
    let subtitle: String
    let caption1: String
    let caption2: String
    let code: String
    
    var body: some View {
        HStack {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                        Text(caption1)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.yellow)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(subtitle)
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                        Text(caption2)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.yellow)
                    }
                }
                .padding()
                
                Spacer()
                
                Text(code)
                    .font(.system(.title2, design: .monospaced))
                    .fontWeight(.bold)
                    .padding()
                
                
                HStack {
                    Text("Bank of Northern Ireland")
                        .font(.footnote)
                        .foregroundColor(.white)
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 22)
                            .offset(x: -12)
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: 22)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                
            }
            .foregroundColor(.white)
        }
        .frame(width: 300, height: 200, alignment: .center)
        .background(Color(red: 0.2, green: 0.2, blue: 0.3, opacity: 1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(LinearGradient(colors: [.red, .clear, .yellow],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
        )
    }
}

struct CardDetails {
    let title: String
    let subtitle: String
    let caption1: String
    let caption2: String
    let code: String
    
    static var exampleDetails = CardDetails(title: "Card owner", subtitle: "Expiry date", caption1: "William Dupont", caption2: "09/24", code: "0123-4567-8910-1112")
}


