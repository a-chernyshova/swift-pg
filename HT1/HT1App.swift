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
    var callScreenManager:CallScreenManager = CallScreenManager()
    @ObservedObject
    var contactsManager:ContactScreenManager = ContactScreenManager()


    var body: some Scene {
        WindowGroup {
            ZStack{
                ContactsScreen()
                if callScreenManager.isScreenVisible, let contact = callScreenManager.contact {
                    CallScreen(contactModel: contact)
                }
            }.environmentObject(callScreenManager)
        }
    }
}
