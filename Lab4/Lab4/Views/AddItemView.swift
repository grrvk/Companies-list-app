//
//  AddItemView.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldName: String = ""
    @State var textFieldAnnotation: String = ""
    @State var textFieldItType: String = ""
    @State var textFieldVersion: String = ""
    @State var textFieldAuthor: String = ""
    @State var textFieldConditions: String = ""
    @State var textFieldPath: String = ""
    var list: ListV
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Name of program: "), content: {
                    TextField("Assign name", text: $textFieldName)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Annotation: "), content: {
                    TextField("Assign annotation", text: $textFieldAnnotation)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Type: "), content: {
                    TextField("Assign type", text: $textFieldItType)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Version: "), content: {
                    TextField("Assign version", text: $textFieldVersion)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Author: "), content: {
                    TextField("Assign author", text: $textFieldAuthor)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Conditions: "), content: {
                    TextField("Assign conditions", text: $textFieldConditions)
                        .padding(.horizontal)
                        .frame(height: 45)
                        .background(Color(#colorLiteral(red: 0.1137, green: 0.0902, blue: 0.1294, alpha: 0.1)))
                        .cornerRadius(10)
                })
                Section(header: Text("Path to ditribution: "), content: {
                    TextField("Assign path", text: $textFieldPath)
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
        let Item = Item()
        Item.setItem(name: textFieldName, annotation: textFieldAnnotation, itType: textFieldItType, author: textFieldAuthor, version: textFieldVersion, conditions: textFieldConditions, path: textFieldPath)
        list.addItem(item: Item)
        //textFieldName = textFieldName
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var list1 = ListV()
    static var previews: some View {
        AddItemView(list: list1)
    }
}
