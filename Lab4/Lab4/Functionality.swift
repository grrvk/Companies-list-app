//
//  Functionality.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import Foundation
import SwiftUI

class Helper : ObservableObject{
    @Published var toBeDeleted: IndexSet?
    @Published var showingDeleteAlert = false
    init(){
        serealizer = Serealizer()
        deserealizer = Deserealizer()
        sorter = Sorter()
        saver = FileSaver()
    }
    var serealizer: Serealizer
    var deserealizer: Deserealizer
    var sorter: Sorter
    var saver: FileSaver
    
    func Serealize(list: ListV){
        let start = CFAbsoluteTimeGetCurrent()
        serealizer.Serealize(list: list)
        let diff = CFAbsoluteTimeGetCurrent() - start
    }
    
    func Deserealize(list: ListV){
        let start = CFAbsoluteTimeGetCurrent()
        list.itemsList += deserealizer.Deserealize()
        let diff = CFAbsoluteTimeGetCurrent() - start
    }
    
    func Sort(type: Int, list: ListV, searchText: String) -> [Item]{
        return sorter.Sorting(type: type, list: list, searchText: searchText)
    }
    
    func deleteRow(at indexSet: IndexSet) {
        self.toBeDeleted = indexSet
        self.showingDeleteAlert = true
    }
    
    func Save(list: ListV){
        saver.Save(list: list)
    }
}



class Sorter : ObservableObject{
    init(){
        sortingType = 0
    }
    var sortingType: Int
    func Sorting(type: Int, list: ListV, searchText: String) -> [Item]{
        if searchText.isEmpty || type == 0 {
            return list.itemsList
        }
        else {
            if (type == 1){
                return list.itemsList.filter { $0.Name.contains(searchText) }
            }
            else if (type == 2){
                return list.itemsList.filter { $0.Author.contains(searchText) }
            }
            else if (type == 3){
                return list.itemsList.filter { $0.Version.contains(searchText) }
            }
            else{
                return list.itemsList.filter { $0.Version.contains(searchText) }
            }
        }
    }
}

class Serealizer : ObservableObject{
    init(){
        file = "Lab4Serealizer.txt"
        filePath = "/Users/vika/Desktop/Lab4/Lab4/Lab4Serealizer.txt"
        if FileManager.default.fileExists(atPath: filePath) {
            do{
                try FileManager.default.removeItem(atPath: filePath)
            }
            catch{
                print("error file")
            }
        }
        FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL = documentDirectory.appendingPathComponent(filePath)
    }
    var filePath: String
    var file: String
    var fileURL: URL
    func Serealize(list: ListV){
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let jsonData = (try? jsonEncoder.encode(list.itemsList))!
        if FileManager.default.fileExists(atPath: filePath) {
            if let fileHandle = try? FileHandle(forWritingTo: URL(string: filePath)!) {
                        fileHandle.seekToEndOfFile()
                        fileHandle.write(jsonData)
                        }
                    }
    }
}

class FileSaver : ObservableObject{
    init(){
        file = "List.txt"
        filePath = "/Users/vika/Desktop/Lab4/Lab4/List.txt"
        if FileManager.default.fileExists(atPath: filePath) {
            do{
                try FileManager.default.removeItem(atPath: filePath)
            }
            catch{
                print("error file")
            }
        }
        FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        fileURL = documentDirectory.appendingPathComponent(filePath)
    }
    var filePath: String
    var file: String
    var fileURL: URL
    func Save(list: ListV){
        var text = ""
        for item in list.itemsList{
            text = "Name: \(item.Name)\nAnnotation: \(item.Annotation)\nType: \(item.ItType)\nVersion: \(item.Version)\nAuthor: \(item.Version)\nConditions: \(item.Conditions)\n\n"
            let data = Data(text.utf8)
            if FileManager.default.fileExists(atPath: filePath) {
                if let fileHandle = try? FileHandle(forWritingTo: URL(string: filePath)!) {
                            fileHandle.seekToEndOfFile()
                            fileHandle.write(data)
                            }
                        }
        }
    }
}

class Deserealizer: ObservableObject  {
    
    func Deserealize() -> [Item] {
        guard let url = Bundle.main.url(forResource: "Lab4Deserealizer", withExtension: "json")
            else {
                print("Json file not found")
                return []
            }
        
        let data = try? Data(contentsOf: url)
        let list = (try? JSONDecoder().decode([Item].self, from: data!)) ?? []
        return list
    }
     
}

