//
//  Pack.swift
//  flashcards
//
//  Created by Dom Jackson on 22/08/2025.
//

import Foundation

struct Pack: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let userId: UUID
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case userId = "user_id"
    }
}
