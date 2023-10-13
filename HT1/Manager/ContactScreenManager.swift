//
//  ContactScreenManager.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 17.08.23.
//
import SwiftUI

/// Manager for providing contact list
class ContactScreenManager: ObservableObject {
    
    @Published
    var contacts: Array<ContactModel> = generateContacts(n: 5)
    
    @Published
    var favourites: Array<UUID> = []
    
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<length).map{ _ in letters.randomElement()! }).capitalized
    }
                     
    static func randomDigitString(length: Int) -> String {
        let letters = "0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    static func generateContacts(n: Int) -> Array<ContactModel> {
        var contList: Array<ContactModel> = Array()
        for _ in 1...n {
            contList.append(
                ContactModel(
                    id: UUID(),
                    firstName: randomString(length: Int.random(in: 4..<6)),
                    secondName: randomString(length: Int.random(in: 4..<9)),
                    phoneNumber: "+\(Int.random(in: 0..<9)) (\(randomDigitString(length: 3))) \(randomDigitString(length: 3))-\(randomDigitString(length: 4))",
                    imageName: "\(Int.random(in: 1..<9))",
                    isAccountBlocked: false
                )
            )
        }
        return contList
    }
    
    func save(contact: ContactModel) {
        let index = contacts.firstIndex(where: { $0.id  == contact.id})
        if let index = index {
            contacts[index] = contact
        }
    }
    
    func create(newContact: ContactModel) {
        contacts.append(newContact)
    }
    
    func deleteContact(contactToDelete: ContactModel) {
        // remove the contact from favorites first
        if let index = favourites.firstIndex(of: contactToDelete.id) {
            favourites.remove(at: index)
        }
        // remove the contact from list of all contacts
        let index = contacts.firstIndex(where: { $0.id  == contactToDelete.id})
        if let index = index {
            contacts.remove(at: index)
        }
    }
    
    func getContactByID(id: UUID) -> ContactModel? {
        let index = contacts.firstIndex(where: { $0.id  == id})
        if let index = index {
            return contacts[index]
        }
        return nil
    }
    
    func addToFavourites(toFavourites: ContactModel) {
        favourites.append(toFavourites.id)
    }
    
    func unfavoure(indexSet: IndexSet) {
        favourites.remove(atOffsets: indexSet)
        
    }
    
    func deleteContact(indexSet: IndexSet) {
        // by offset get contact id; check if this id is in favourties, remove it from there; then remove from contactList
        indexSet.forEach { (i) in
            let contactId = contacts[i].id
            if let index = favourites.firstIndex(of: contactId) {
                favourites.remove(at: index)
            }
        }
        contacts.remove(atOffsets: indexSet)
    }
    
    func changeStateLock(contact: ContactModel) {
        var updatedContact = contact
        updatedContact.isAccountBlocked = !contact.isAccountBlocked
        let index = contacts.firstIndex(where: { $0.id  == contact.id})
        if let index = index {
            contacts[index] = updatedContact
        }
    }
}
