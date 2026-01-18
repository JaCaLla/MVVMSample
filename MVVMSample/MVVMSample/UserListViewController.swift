//
//  ViewController.swift
//  MVVMSample
//
//  Created by Javier Calatrava on 18/1/26.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando usuarios...")
                } else {
                    List(viewModel.users) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Usuarios")
            .onAppear {
                // Llamamos a la carga cuando la vista aparece
                viewModel.fetchUsers()
            }
        }
    }
}
