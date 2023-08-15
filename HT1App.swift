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
        ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49 (151) 630-57558"),
        ContactModel(id: UUID(), firstName: "Darya", secondName: "Chernyshova", phoneNumber: "+7 (960) 239-9161"),
        ContactModel(id: UUID(), firstName: "Mom", secondName: "", phoneNumber: "+7 (962) 208-9021"),
        ContactModel(id: UUID(), firstName: "Teacher", secondName: "", phoneNumber: "+7 (921) 318-3970"),
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
