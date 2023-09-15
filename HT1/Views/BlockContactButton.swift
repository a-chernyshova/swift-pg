//
//  BlockContactButton.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 07.08.23.
//

import SwiftUI

struct BlockContactButton: View {
    @State
    var contact: ContactModel
    
    
    var body: some View {
        Button(action: { contact.isAccountBlocked.toggle() }, label: {
            ZStack{
                if contact.isAccountBlocked {
                    Rectangle()
                        .cornerRadius(8.0)
                        .foregroundColor(.gray)
                    Text("Unblock")
                        .foregroundColor(.green)
                } else {
                    Rectangle()
                        .cornerRadius(8.0)
                        .foregroundColor(.red)
                    Text("Block this caller")
                        .foregroundColor(.black)
                }
            }
            .frame(height: 36)
        })
    }
}

struct BlockContactButton_Previews: PreviewProvider {
    static var previews: some View {
        let neo = ContactModel(
            id: UUID(), firstName: "Anastasia", secondName: "Che", phoneNumber: "+49 (111) 630-11111", imageName: "1", isAccountBlocked: false, isFavorite: true
        )
        BlockContactButton(contact: neo)
            .padding(20)
    }
}
