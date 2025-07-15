//
//  Phrase.swift
//  talksy
//
//  Created by Caio Santos on 05/07/25.
//


import Foundation

import SwiftData

@Model
class Phrase {
    @Attribute(.unique) var id: UUID
    var english: String
    var portuguese: String

    init(id: UUID = UUID(), english: String, portuguese: String) {
        self.id = id
        self.english = english
        self.portuguese = portuguese
    }
}

