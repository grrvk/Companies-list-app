//
//  ItemView.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import SwiftUI

struct ItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldName: String = ""
    @State var textFieldAnnotation: String = ""
    @State var textFieldItType: String = ""
    @State var textFieldVersion: String = ""
    @State var textFieldAuthor: String = ""
    @State var textFieldConditions: String = ""
    @State var textFieldPath: String = ""
    var Item: Item
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Name of program: "), content: {
                    TextField(Item.Name, text: $textFieldName)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Annotation: "), content: {
                    TextField(Item.Annotation, text: $textFieldAnnotation)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Type: "), content: {
                    TextField(Item.ItType, text: $textFieldItType)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Version: "), content: {
                    TextField(Item.Version, text: $textFieldVersion)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Author: "), content: {
                    TextField(Item.Author, text: $textFieldAuthor)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Conditions: "), content: {
                    TextField(Item.Conditions, text: $textFieldConditions)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Path to ditribution: "), content: {
                    TextField(Item.PathToDistr, text: $textFieldPath)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
        }
    }
    func saveButtonPressed(){
        Item.setItem(name: textFieldName, annotation: textFieldAnnotation, itType: textFieldItType, author: textFieldAuthor, version: textFieldVersion, conditions: textFieldConditions, path: textFieldPath)
        presentationMode.wrappedValue.dismiss()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var item1 = Item()
    static var previews: some View {
        ItemView(Item: item1)
    }
}
