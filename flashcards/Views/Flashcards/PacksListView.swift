//
//  PacksList.swift
//  flashcards
//
//  Created by Dom Jackson on 22/08/2025.
//

import SwiftUI


struct PacksListView: View {
    
    @State var packs: [Pack] = []
    
    var body: some View {
        NavigationStack {
            List(packs) {pack in
                NavigationLink(pack.title, value: pack)
            }
            .navigationDestination(for: Pack.self) { pack in
                PackView(pack: pack)
                
            }
        }
        .overlay {
            if packs.isEmpty {
                Text("No packs found")
            }
        }
        .task {
            await getPacks()
        }
    }
    
    func getPacks() async {
        print("Getting packs...")
        
        do {
            let currentUser = try await supabase.auth.session.user
            
            packs =
                try await supabase
                .from("packs")
                .select()
                .eq("user_id", value: currentUser.id)
                .execute()
                .value
            
            print("Packs:", packs)
        } catch {
            debugPrint(error)
        }
    }
}
