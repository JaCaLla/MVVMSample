//
//  UserViewModel.swift
//  MVVMSample
//
//  Created by Javier Calatrava on 18/1/26.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    
    func fetchUsers() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.users = [
                User(name: "Ana SwiftUI", email: "ana@apple.com"),
                User(name: "Pedro State", email: "pedro@apple.com"),
                User(name: "Sara Binding", email: "sara@apple.com")
            ]
            self.isLoading = false
        }
    }
}
