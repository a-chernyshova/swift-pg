//
//  ContactsScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 10.08.23.
//

import SwiftUI

struct ContactsScreen: View {
    
    @EnvironmentObject var contactsManager: ContactScreenManager
    @State private var searchText = ""
    @State var currentSelection: UUID? = nil
    
    private let newContactId: UUID = UUID()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(filteredNames) { contact in
                    NavigationLink(
                        destination: ContactPageScreen(contactModel: contact)
                            .toolbar( content: { NavigationLink(
                                destination:
                                    ContactEditScreen(
                                        contact: contact,
                                        saveContact: { newContact in  contactsManager.save(contact: newContact)}
                                    )
                            ){
                                Text("Edit")
                            }
                            }),
                        tag: contact.id,
                        selection: $currentSelection
                    ){
                        Text("\(contact.firstName) \(contact.secondName)")
                    }
                }
                .onDelete { indexSet in
                    contactsManager.deleteContact(indexSet: indexSet)
                }
            }.searchable(text: $searchText, prompt: "Search a contact")
                .toolbar( content: { NavigationLink(
                    destination: CreateContact(
                        newContact: ContactModel.createNewContact(),
                        saveContact: { newContact in
                            contactsManager.create(newContact: newContact)
                            currentSelection = nil
                        }
                    ),
                    tag: newContactId,
                    selection: $currentSelection
                ){
                    Text("New")
                }
            })
            .navigationBarTitle("Contacts", displayMode: .inline)
            .navigationBarItems(leading:Button(action: {}) {Image(systemName: "magazine").imageScale(.large)})
        }
    }
    
    
    struct ListHeader: View {
        var body: some View {
            HStack {
                Image(systemName: "map")
                Text("Your contact list")
            }
        }
    }

    struct ListFooter: View {
        var body: some View {
            ContactListFooterView(action: {
//                keyPadManager.isScreenVisible = true
            })
        }
    }
    
    var filteredNames: Array<ContactModel>{
        if searchText.isEmpty {
            return contactsManager.contacts
        } else {
            return contactsManager.contacts.filter { $0.firstName.contains(searchText) || $0.secondName.contains(searchText) }
        }
    }
}

struct ContactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactsScreen()
            .environmentObject(ContactScreenManager())
    }
}
