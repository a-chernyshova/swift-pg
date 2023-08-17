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
    
    let contactList: Array<ContactModel> = [
        ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+45 (151) 660-55555"),
        ContactModel(id: UUID(), firstName: "Darya", secondName: "Che", phoneNumber: "+7 (960) 222-9966"),
        ContactModel(id: UUID(), firstName: "Mom", secondName: "", phoneNumber: "+7 (962) 200-9011"),
        ContactModel(id: UUID(), firstName: "Teacher", secondName: "", phoneNumber: "+7 (911) 338-3370"),
        ContactModel(id: UUID(), firstName: "Stiven", secondName: "Spilberg", phoneNumber: "+1 (565) 318-3970")
    ]
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContactsScreen(contactList: contactList)
                if callScreenManager.isScreenVisible, let contact = callScreenManager.contact {
                    CallScreen(contactModel: contact)
                }
            }.environmentObject(callScreenManager)
        }
    }
}
