//
//  User.swift
//  MVVMSample
//
//  Created by Javier Calatrava on 18/1/26.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let email: String
}
