//
//  ItemsHeaderView.swift
//  todo-list-ui
//
//  Created by Matheus Silva on 05/05/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import SwiftUI

struct ItemsHeaderView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var str: String = ""
    @Binding var edit: Bool
    
    var body: some View {
        VStack {
            HStack {
//                Spacer()
                Text("List")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding(20)
                    
                Spacer()
                Button(action: {
                    self.edit.toggle()
                }) {
                    Text("Edit")
                        .font(.body)
                        .padding(20)
                        .foregroundColor(.black)
                        .cornerRadius(6)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 6)
//                            .stroke(black, lineWidth: 1)
//                        )
                }
            }
            HStack {
                Spacer()
                TextField("Item", text: $str)
                    .padding(0)
//                    .foregroundColor(black)
//                    .background(white)
                    .cornerRadius(20)
                Spacer()
                Button(action: {
                    self.insert()
                }) {
                    Image(systemName: "plus")
                        .font(Font.title.weight(.thin))
                        .scaleEffect(0.8)
                        .foregroundColor(.black)
                }
            }.padding()
//                .background(white)    
        }
    }
    
    func insert() {
        guard str.trimmingCharacters(in: [" "]) != "" else {
            return
        }
        let i = Item(context: managedObjectContext)
        i.itemID = UUID()
        i.itemDescription = str
        i.checked = false
        
        do {
            try managedObjectContext.save()
            str = ""
        } catch {
            print(#line, error.localizedDescription)
        }
    }
}

struct ItemsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
