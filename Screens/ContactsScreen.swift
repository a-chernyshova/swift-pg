//
//  ContactsScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 10.08.23.
//

import SwiftUI

struct ContactsScreen: View {
    
    let contactList: Array<ContactModel>
    
    var body: some View {
        NavigationView{
            List(contactList.sorted{$0.firstName < $1.firstName}) {
                contact in
                NavigationLink(destination: ContactPageScreen(contactModel: contact, isAccountBlocked: false)) {
                    Text("\(contact.firstName) \(contact.secondName)")
                }
            }.navigationBarTitle("Contacts", displayMode: .inline)
                .navigationBarItems(leading:Button(action: {}) {Image(systemName: "magazine").imageScale(.large)})
        }
    }
}

struct ContactsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        let contactList: Array<ContactModel> = [
            ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 630-57558"),
            ContactModel(id: UUID(), firstName: "Darya", secondName: "Chernyshova", phoneNumber: "+7 (960) 239-9161"),
            ContactModel(id: UUID(), firstName: "Mom", secondName: "", phoneNumber: "+7 (962) 208-9021"),
            ContactModel(id: UUID(), firstName: "Teacher", secondName: "", phoneNumber: "+7 (921) 318-3970"),
            ContactModel(id: UUID(), firstName: "Stiven", secondName: "Spilberg", phoneNumber: "+1 (565) 318-3970")
        ]
        ContactsScreen(contactList: contactList)
            .environmentObject(CallScreenManager())
    }
}
