//
//  PacksView.swift
//  flashcards
//
//  Created by Dom Jackson on 23/08/2025.
//

import SwiftUI

struct PackView: View {
    
    @State var pack: Pack
    @State var flashcards: [Flashcard] = []
    
    var body: some View {
        List(flashcards) { flashcard in
            Text(flashcard.title)
        }
        .navigationTitle(pack.title)
        .overlay {
            if flashcards.isEmpty {
                Text("No flashcards found")
            }
        }.task {
            await getFlashcards()
        }
    }
    
    func getFlashcards() async {
        print("Getting flashcards...")
        
        do {
            let currentUser = try await supabase.auth.session.user
            
            flashcards =
                try await supabase
                .from("flashcards")
                .select()
                .eq("pack_id", value: pack.id)
                .eq("user_id", value: currentUser.id)
                .execute()
                .value
            
            print("Flashcards:", flashcards)
        } catch {
            debugPrint(error)
        }
    }
}
