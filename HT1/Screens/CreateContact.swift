//
//  CreateContact.swift
//  HT1
//
//  Created by Dmitriy Matveev on 02.09.23.
//

import SwiftUI

struct CreateContact: View {
    @State
    var newContact: ContactModel
    
    let saveContact: (ContactModel) -> Void
    
    var body: some View {
        Text("Create a new contact").foregroundColor(.black)
        Form{
            Section{
                TextField("First Name", text: $newContact.firstName)
                TextField("Last Name", text: $newContact.secondName)
                TextField("Phone Number", text: $newContact.phoneNumber)
            }
        }.toolbar {
            Button(action: {saveContact(newContact)}, label: { Text("Create") })
        }
    }
}

struct CreateContact_Previews: PreviewProvider {
    static var previews: some View {
        CreateContact(newContact: ContactModel(
                                    id: UUID(),
                                    firstName: "Thomas",
                                    secondName: "Anderson",
                                    phoneNumber: "+49 (151) 630-55555",
                                    imageName: "1",
                                    isAccountBlocked: false,
                                    isFavorite: true
        ),
        saveContact: { _ in })
    }
}
