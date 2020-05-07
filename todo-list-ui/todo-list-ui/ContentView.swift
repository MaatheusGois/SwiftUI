//
//  ContentView.swift
//  todo-list-ui
//
//  Created by Matheus Silva on 05/05/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import SwiftUI

let white: Color = Color(red:224/255,green:224/255,blue:224/255)
let black: Color = Color(red:32/255,green:32/255,blue:32/255)

struct ContentView: View {
    var body: some View {
        ItemsView()
    }
}

struct ItemsView: View {
    @State var edit: Bool = false
    var body: some View {
        VStack {
            ItemsHeaderView(edit: $edit)
            ItemsBodyView(edit: $edit)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
