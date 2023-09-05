//
//  ContactsScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 10.08.23.
//

import SwiftUI

struct ContactsScreen: View {
    
    @State
    private var searchText = ""
    
    @EnvironmentObject
    var contactsManager: ContactScreenManager
    
    var body: some View {
        NavigationView{
            List {
                Section(header: ListHeader(), footer: ListFooter()) {
                    ForEach(filteredNames) { contact in
                        NavigationLink(
                            destination: ContactPageScreen(contactModel: contact)
                                .toolbar{
                                    NavigationLink(
                                        destination: ContactEditScreen(
                                            contact: contact,
                                            saveContact: { contact in  contactsManager.save(contact: contact)})
                                    ){
                                        Text("Edit")
                                    }
                                }
                        ){
                            Text("\(contact.firstName) \(contact.secondName)")
                        }
                    }
                }
               
                
            }.searchable(text: $searchText, prompt: "Search a contact")
                .toolbar{
                    NavigationLink(
                        destination: CreateContact(
                            newContact: contactsManager.newContact,
                            saveContact: { newContact in contactsManager.create(newContact: newContact) })
                    ) {
                        Text("New")
                    }
                }
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
                return contactsManager.contacts.filter { $0.firstName.contains(searchText) ||  $0.secondName.contains(searchText) }
            }
        }
}

struct ContactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactsScreen()
            .environmentObject(ContactScreenManager())
    }
}
