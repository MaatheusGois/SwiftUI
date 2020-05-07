//
//  ItemsBodyView.swift
//  todo-list-ui
//
//  Created by Matheus Silva on 05/05/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import SwiftUI

struct ItemsBodyView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: Item.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.itemDescription, ascending: true)
        ]
    ) var items: FetchedResults<Item>
    
    @Binding var edit: Bool
    
    var body: some View {
        VStack {
            List {
                ForEach(items) {
                    i in
                    HStack {
                        Text(i.itemDescription)
                        Spacer()
                        if i.checked {
                            Image(systemName: "checkmark")
                                .font(Font.title.weight(.thin))
                                .scaleEffect(0.8)
                                .foregroundColor(.black)
                        }
                        
                        if self.edit {
                            Image(systemName: "trash")
                                .font(Font.title.weight(.thin))
                                .scaleEffect(0.8)
                                .foregroundColor(.black)
                                .onTapGesture {
                                    self.delete(i)
                            }
                        }
                    }.padding(.bottom, 10)
                        .padding(.top, 10)
                        .background(Color.white)
                    .cornerRadius(8)
                        .onTapGesture(count: 2) {
                            i.checked.toggle()
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(#line, #file, error.localizedDescription)
                            }
                    }
                }
            }
        }
    }
    func delete(_ i: Item) {
        managedObjectContext.delete(i)
        do {
            try managedObjectContext.save()
        } catch {
            print(#line, #file, error.localizedDescription)
        }
    }
}

struct ItemsBodyView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
