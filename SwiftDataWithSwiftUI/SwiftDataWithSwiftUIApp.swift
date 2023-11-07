//
//  SwiftDataWithSwiftUIApp.swift
//  SwiftDataWithSwiftUI
//
//  Created by Ayush Gupta on 06/11/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataWithSwiftUIApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            UserListView()
                .environmentObject(UserListViewModel(modelContext: container.mainContext))
                .modelContainer(container)
        }
    }
    
    init() {
        do {
            container = try ModelContainer(for: UserModel.self)
        } catch {
            fatalError("Failed to create ModelContainer for UserModel.")
        }
    }
}
