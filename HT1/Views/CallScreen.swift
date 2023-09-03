//
//  CallScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 14.08.23.
//

import SwiftUI

struct CallScreen: View {
    
    @EnvironmentObject
    var callScreenManager: CallScreenManager
    var contactModel: ContactModel
    
    var body: some View {
        CallPageScreen(contactModel: contactModel)
    }
}

//struct CallScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CallScreen()
//    }
//}
