//
//  UserViewModel.swift
//  MVVMSample
//
//  Created by Javier Calatrava on 18/1/26.
//

import Foundation
import Combine

class UserListViewModel {
    // @Published emite automáticamente el nuevo valor cada vez que cambia
    @Published private(set) var users: [User] = []
    
    func fetchUsers() {
        // Simulamos una demora de red
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.users = [
                User(name: "Ana Combine", email: "ana@apple.com"),
                User(name: "Pedro Publisher", email: "pedro@apple.com"),
                User(name: "Sara Subscriber", email: "sara@apple.com")
            ]
        }
    }
}
