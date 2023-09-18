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
                TabView {
                    ContactsScreen()
                        .tabItem {
                            Label("Contacts", systemImage: "person.crop.circle.fill")
                        }
                    FavoritsScreen()
                        .tabItem {
                            Label("Favourites", systemImage: "star.fill")
                        }
                    TouchPadScreen()
                        .tabItem{
                            Label("Keypad", systemImage: "keyboard")
                        }
                }
                // change need to be done here, to support calling a new number ???
                if callScreenManager.isScreenVisible, let contact = callScreenManager.contact {
                    CallScreen(contactModel: contact)
                }
            }
            .environmentObject(callScreenManager)
            .environmentObject(contactsManager)
        }
    }
}
