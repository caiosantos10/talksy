//
//  Deck.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import Foundation

import SwiftData

@Model
class Deck {
    @Attribute(.unique) var id: UUID
    var title: String
    var details: String
    @Relationship(deleteRule: .cascade) var phrases: [Phrase]

    init(id: UUID = UUID(), title: String, details: String, phrases: [Phrase] = []) {
        self.id = id
        self.title = title
        self.details = details
        self.phrases = phrases
    }
}

