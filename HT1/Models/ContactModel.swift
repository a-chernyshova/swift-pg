//
//  ContactModel.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 10.08.23.
//

import SwiftUI

struct ContactModel: Identifiable {
    let id: UUID
    var firstName: String
    var secondName: String
    var phoneNumber: String
    var imageName: String
    var isAccountBlocked: Bool
}

extension ContactModel {
    // creatin a new empty contact
    static func createNewContact() -> ContactModel {
        ContactModel(
            id: UUID(),
            firstName: "",
            secondName: "",
            phoneNumber: "",
            imageName: "",
            isAccountBlocked: false
        )
    }
}
