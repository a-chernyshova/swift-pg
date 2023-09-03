//
//  ContactEditScreen.swift
//  HT1
//
//  Created by Dmitriy Matveev on 02.09.23.
//

import SwiftUI

struct ContactEditScreen: View {
    @State
    var contact: ContactModel
    
    let saveContact: (ContactModel) -> Void
    
    var body: some View {
        Form {
            Section {
                TextField("First Name", text: $contact.firstName)
                TextField("Last Name", text: $contact.secondName)
                TextField("phoneNumber", text: $contact.phoneNumber)
            }
        }.toolbar {
            Button(action: {saveContact(contact)}, label: { Text("Save") })
        }
    }
}

struct ContactEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        let tempContact = ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 630-57558", imageName: "1", isAccountBlocked: false)
        ContactEditScreen(contact: tempContact, saveContact: { _ in })
    }
}
