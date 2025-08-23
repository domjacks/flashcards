//
//  Flashcard.swift
//  flashcards
//
//  Created by Dom Jackson on 22/08/2025.
//

import Foundation

struct Flashcard: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let packId: Int
    let userId: UUID
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case packId = "pack_id"
        case userId = "user_id"
    }
}
