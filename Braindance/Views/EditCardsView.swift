//
//  EditCardsView.swift
//  Braindance
//
//  Created by William Dupont on 07/10/2022.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt: String = ""
    @State private var newAnswer: String = ""
    
    private func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard !trimmedPrompt.isEmpty && !trimmedAnswer.isEmpty else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        
        newPrompt = ""
        newAnswer = ""
        
        saveData()
    }
    
    private func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    private func done() {
        dismiss()
    }
    
    private func loadCards() {
        if let data = UserDefaults.standard.data(forKey: Constants.cardsKey) {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    private func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: Constants.cardsKey)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("add a new card") {
                    TextField("Prompt...", text: $newPrompt)
                        .disableAutocorrection(true)
                    TextField("Answer...", text: $newAnswer)
                        .disableAutocorrection(true)
                    HStack {
                        Spacer()
                        Button("Add card", action: addCard)
                        Spacer()
                    }
                }
                
                Section("My cards") {
                    ForEach(0..<cards.count, id: \.self) { card in
                        VStack(alignment: .leading) {
                            Text(cards[card].prompt)
                                .font(.headline)
                            Text(cards[card].answer)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit my cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadCards)
        }
    }
}

struct EditCardsView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
