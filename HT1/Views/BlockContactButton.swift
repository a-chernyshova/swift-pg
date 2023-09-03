//
//  BlockContactButton.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 07.08.23.
//

import SwiftUI

struct BlockContactButton: View {
    @State
    var isAccountBlocked: Bool
    
    var body: some View {
        Button(action: { isAccountBlocked.toggle() }, label: {
            ZStack{
                if isAccountBlocked {
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
        BlockContactButton(isAccountBlocked: false)
            .padding(20)
    }
}
