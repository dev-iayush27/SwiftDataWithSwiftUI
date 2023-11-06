//
//  UserListViewModel.swift
//  AsyncAwaitSwiftUI
//
//  Created by Ayush Gupta on 06/11/23.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
final class UserListViewModel: ObservableObject {
    
    var modelContext: ModelContext?
    
    init(modelContext: ModelContext?) {
        self.modelContext = modelContext
    }
    
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers() async {
        isLoading = true
        do {
            self.isLoading = false
            let users = try await WebService.getUsersData()
            users.forEach { modelContext?.insert($0) }
        } catch(let error) {
            userError = UserError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
