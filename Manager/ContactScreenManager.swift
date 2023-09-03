//
//  ContactScreenManager.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 17.08.23.
//
import Foundation

/// Manager for controlling call screen
class ContactScreenManager: ObservableObject {
    /// Model for a contact
    @Published
    var contact: ContactModel? = nil
    
    @Published
    var isScreenVisible: Bool = false
    
}
