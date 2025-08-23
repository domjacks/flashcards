//
//  HomeView.swift
//  flashcards
//
//  Created by Dom Jackson on 23/08/2025.
//

import SwiftUI

enum Tabs {
    case profile, packs
}

struct HomeView: View {
    
    @State private var selectedTab: Tabs = .packs
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            Tab("Packs", systemImage: "rectangle.3.group.fill", value: .packs) {
                PacksListView()
            }
            
            Tab("Profile", systemImage: "person.crop.circle", value: .profile) {
                ProfileView()
            }
        }
        
    }
}
