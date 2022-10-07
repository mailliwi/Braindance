//
//  Card.swift
//  Braindance
//
//  Created by William Dupont on 06/10/2022.
//

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Qu'est-ce qui est jaune et qui attend ?", answer: "Jonathan")
}
