//
//  ListModel.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import Foundation

class ListV: ObservableObject, Identifiable, Codable {
    @Published var itemsList: [Item] = []
    init(){
        getItems()
    }
    func getItems(){
        let item: [Item] = []
        let newItems = item
        itemsList.append(contentsOf: newItems)
    }
    func addItem(item: Item){
        itemsList.append(item)
    }
    func deleteItem(indexSet: IndexSet){
        itemsList.remove(atOffsets: indexSet)
    }
    
    enum CodingKeys: CodingKey {
      case itemsList
    }

    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.itemsList = try container.decode([Item].self, forKey: .itemsList)
   }
}

extension ListV {
    
   func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(self.itemsList, forKey: .itemsList)
   }

}


