//
//  CallScreenManager.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 14.08.23.
//

import Foundation

/// Manager for controlling call screen
class CallScreenManager: ObservableObject {
    
    enum State{
        case contact(ContactModel)
        case phoneNumber(String)
        case empty
    }
    
    @Published
    var state: State = .empty
    
    /// Model for a contact
    @Published
    var contact: ContactModel? = nil
    @Published
    var phoneNumber: String? = nil
    
//    @Published
    var isScreenVisible: Bool {
        switch state {
            case .empty:
                return false
            default:
                return true
        }
    }
    
}
