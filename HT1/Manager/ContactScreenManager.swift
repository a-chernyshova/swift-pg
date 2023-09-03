//
//  ContactScreenManager.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 17.08.23.
//
import Foundation

/// Manager for providing contact list
class ContactScreenManager: ObservableObject {
    
    @Published
    var contacts: Array<ContactModel> = generateContacts(n: 25)
    @Published
    var newContact: ContactModel = ContactModel(id: UUID(),
                                               firstName: "",
                                               secondName: "",
                                               phoneNumber: "",
                                                imageName: "",
                                                isAccountBlocked: false)
    
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
            contList.append(ContactModel(id: UUID(),
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
        let index = contacts.firstIndex(where: { $0.id  == contactToDelete.id})
        if let index = index {
            contacts.remove(at: index)
        }
    }
    
//    let contactList: Array<ContactModel> = [
//        ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 630-57558", imageName: "1"),
//        ContactModel(id: UUID(), firstName: "Darya", secondName: "Chernyshova", phoneNumber: "+7 (960) 239-9161", imageName: "1"),
//        ContactModel(id: UUID(), firstName: "Mom", secondName: "", phoneNumber: "+7 (962) 208-9021", imageName: "1"),
//        ContactModel(id: UUID(), firstName: "Teacher", secondName: "", phoneNumber: "+7 (921) 318-3970", imageName: "1"),
//        ContactModel(id: UUID(), firstName: "Stiven", secondName: "Spilberg", phoneNumber: "+1 (565) 318-3970", imageName: "1")
//    ]
}
