//
//  HT1App.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 27.07.23.
//

import SwiftUI

@main
struct HT1App: App {
    let neo = ContactModel(id: UUID(), firstName: "Thomas", secondName: "Anderson", phoneNumber: "+49(151)630-57558")
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContactPageScreen(contactModel: neo, isAccountBlocked: false)
        }
    }
}
