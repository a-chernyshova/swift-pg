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

extension ContactModel: Equatable {
    static func == (lhs: ContactModel, rhs: ContactModel) -> Bool {
        lhs.firstName == rhs.firstName &&
        lhs.secondName == rhs.secondName &&
        lhs.phoneNumber == rhs.phoneNumber &&
        lhs.isAccountBlocked == rhs.isAccountBlocked &&
        lhs.imageName == rhs.imageName
    }
}
