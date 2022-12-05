//
//  ContentView.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var list: ListV
    @State var searchText = ""
    @State var sortingType: Int = 0
    @ObservedObject var helper: Helper
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Search by")
                        .padding([.trailing], 170)
                    Picker("Sortin", selection: $sortingType, content: {
                        Text("None").tag(0)
                        Text("Name").tag(1)
                        Text("Author").tag(2)
                        Text("Version").tag(3)
                    })
                }
                .searchable(text: $searchText, prompt: "Search")
                HStack{
                    Text("List")
                        .font(.system(size: 20, weight: .black, design: .serif))
                    
                }
            }
            NavigationStack{
                List {
                    ForEach(searchResults) {
                        item in ListItemRowView(item: item)
                            }
                    .onDelete(perform: helper.deleteRow)
                }
            }
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button("Deser.") {
                    helper.Deserealize(list: list)
                }
                Button("Ser.") {
                    helper.Serealize(list: list)
                }
                NavigationLink("Add", destination: AddItemView(list: list))
            }
            ToolbarItemGroup(placement: .navigationBarLeading){
                Button("Save") {
                    helper.Save(list: list)
                }
                NavigationLink("Help", destination: HelpView())
                NavigationLink("Info", destination: InfoView())
            }
        }
        .alert(isPresented: $helper.showingDeleteAlert) {
                    Alert(title: Text(""), message: Text("Do you really want to delete?"), primaryButton: .destructive(Text("Delete")) {
                        list.deleteItem(indexSet: helper.toBeDeleted!)
                        }, secondaryButton: .cancel() {

                        }
                    )
                }
    }
    
    var searchResults: [Item] {
        return helper.Sort(type: sortingType, list: list, searchText: searchText)
        }
    

}

struct ContentView_Previews: PreviewProvider {
    static var listPreview = ListV()
    static var helperPreview = Helper()
    static var previews: some View {
        NavigationView{
            ContentView(list: listPreview, helper: helperPreview)
        }
    }
}
