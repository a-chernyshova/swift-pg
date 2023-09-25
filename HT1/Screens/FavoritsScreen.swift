//
//  FavoritsScreen.swift
//  HT1
//
//  Created by Anastasia Chernyshova on 15.09.23.
//

import SwiftUI

struct FavoritsScreen: View {
    
    @EnvironmentObject var contactsManager: ContactScreenManager
    @State private var searchText = ""
    @State var currentSelection: UUID? = nil
    
    private let newContactId: UUID = UUID()
    
    var body: some View {
            NavigationView{
                List {
                    ForEach(contactsManager.favourites, id: \.self) { favouriteId in
                        NavigationLink(
                            destination: ContactPageScreen(contactModel: contactsManager.getContactByID(id: favouriteId)!)
                        ){
                            Text("\(contactsManager.getContactByID(id: favouriteId)!.firstName) \(contactsManager.getContactByID(id: favouriteId)!.secondName)")
                        }
                    }
                    .onDelete { indexSet in
                        contactsManager.unfavoure(indexSet: indexSet)
                    }
                }
                    .navigationBarTitle("Favourites", displayMode: .inline)
                    .navigationBarItems(leading:Button(action: {}) {Image(systemName: "magazine").imageScale(.large)})
            }
        }
}
    
struct FavoritsScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritsScreen()
            .environmentObject(CallScreenManager())
    }
}
