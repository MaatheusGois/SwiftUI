//
//  ContentView.swift
//  move-items-ui
//
//  Created by Matheus Silva on 07/05/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var listItems = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listItems, id: \.self) { (item) in
                    Text(item)
                }.onMove { (indexSet, index) in
                    self.listItems.move(fromOffsets: indexSet, toOffset: index)
                }
            }
        .navigationBarTitle(Text("New Title"))
        .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
