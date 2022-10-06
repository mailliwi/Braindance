//
//  CardView.swift
//  Braindance
//
//  Created by William Dupont on 06/10/2022.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    @State private var isShowingAnswer: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(color: .gray, radius: 6, x: 0, y: 8)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
            .onTapGesture {
                withAnimation {
                    isShowingAnswer.toggle()
                }
            }
        }
        .frame(width: 450, height: 250)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
