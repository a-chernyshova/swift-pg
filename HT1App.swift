//
//  HT1App.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 27.07.23.
//

import SwiftUI

@main
struct HT1App: App {
    /// Instance class CallScreenManager
    @ObservedObject
    var callScreenManager = CallScreenManager()
//    var contactList: Array<ContactModel>
    
    let contactList: Array<ContactModel> = [
        ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+45 (151) 660-55555"),
        ContactModel(id: UUID(), firstName: "Darya", secondName: "Che", phoneNumber: "+7 (960) 222-9966"),
        ContactModel(id: UUID(), firstName: "Mom", secondName: "", phoneNumber: "+7 (962) 200-9011"),
        ContactModel(id: UUID(), firstName: "Teacher", secondName: "", phoneNumber: "+7 (911) 338-3370"),
        ContactModel(id: UUID(), firstName: "Stiven", secondName: "Spilberg", phoneNumber: "+1 (565) 318-3970")
    ]
    
    init() {}
    
    var body: some Scene {
        let contactList: Array<ContactModel> = generateContacts(n: 25)
//        var contactList = [
//            ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 600-57777"),
//            ContactModel(id: UUID(), firstName: "Darya", secondName: "Chernyshova", phoneNumber: "+7 (960) 222-1166"),
//            ContactModel(id: UUID(), firstName: "Mom", secondName: "", phoneNumber: "+7 (962) 200-9001"),
//            ContactModel(id: UUID(), firstName: "Teacher", secondName: "", phoneNumber: "+7 (921) 008-3900"),
//            ContactModel(id: UUID(), firstName: "Stiven", secondName: "Spilberg", phoneNumber: "+1 (565) 318-3970")
//        ]
        WindowGroup {
            ZStack{
                ContactsScreen(contactList: contactList)
                if callScreenManager.isScreenVisible, let contact = callScreenManager.contact {
                    CallScreen(contactModel: contact)
                }
            }.environmentObject(callScreenManager)
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<length).map{ _ in letters.randomElement()! }).capitalized
    }
                     
    func randomDigitString(length: Int) -> String {
        let letters = "0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func generateContacts(n: Int) -> Array<ContactModel> {
        var contList: Array<ContactModel> = Array()
        for _ in 1...n {
            contList.append(ContactModel(id: UUID(),
                                         firstName: randomString(length: Int.random(in: 4..<6)),
                                         secondName: randomString(length: Int.random(in: 4..<9)),
                                         phoneNumber: "+\(Int.random(in: 0..<9)) (\(randomDigitString(length: 3))) \(randomDigitString(length: 3))-\(randomDigitString(length: 4))"))
        }
        return contList
    }
}
