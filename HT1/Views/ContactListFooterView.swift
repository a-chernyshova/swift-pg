//
//  ContactListFooterView.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 18.08.23.
//

import SwiftUI

struct ContactListFooterView: View {
    
    let action: () -> Void
    
    var body: some View {
        HStack{
            VStack{
                Button(action: action){
                    ZStack{
                        Rectangle()
                            .frame(width: 85, height: 85)
                            .foregroundColor(.gray)
                            .cornerRadius(8.0)
                        VStack{
                            Image(systemName: "star")
                            Text("Favorites")
//                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .padding(1)
                                .foregroundColor(.white)
                        
                        }
                    }
                }
            }.padding(15)
            VStack{
                Button(action: action){
                    ZStack{
                        Rectangle()
                            .frame(width: 85, height: 85)
                            .foregroundColor(.gray)
                            .cornerRadius(8.0)
                        VStack{
                            Image(systemName: "keyboard")
                            Text("Keypad")
//                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .padding(1)
                                .foregroundColor(.white)
                    
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContactListFooterView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListFooterView(action: {})
    }
}
