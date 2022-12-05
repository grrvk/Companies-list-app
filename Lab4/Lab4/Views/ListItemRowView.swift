//
//  ListItemRowView.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import SwiftUI

struct ListItemRowView: View {
    var item: Item
    var body: some View {
        HStack{
            Text(item.Name)
            NavigationLink("", destination: ItemView(Item: item))
        }
    }
}

struct ListItemRowView_Previews: PreviewProvider {
    static var item1 = Item()
    static var previews: some View {
        ListItemRowView(item: item1)
    }
}
