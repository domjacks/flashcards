//
//  Profile.swift
//  flashcards
//
//  Created by Dom Jackson on 22/08/2025.
//

struct Profile: Codable {
  let username: String?
  let fullName: String?

  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
  }
}
