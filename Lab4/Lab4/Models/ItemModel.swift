//
//  ItemModel.swift
//  Lab4
//
//  Created by Vika Granadzer on 03.12.2022.
//

import Foundation

class Item : ObservableObject, Identifiable, Codable{
    init(){
        self.Name = "No name assigned"
        self.Annotation = "No annotation assigned"
        self.ItType = "No type assigned"
        self.Author = "No author assigned"
        self.Version = "No version assigned"
        self.Conditions = "No conditions assigned"
        self.PathToDistr = "No conditions assigned"
    }
    var Name: String;
    var Annotation: String;
    var ItType: String;
    var Version: String;
    var Author: String;
    var Conditions: String;
    var PathToDistr: String
    func setItem(name: String, annotation: String, itType: String, author: String, version: String, conditions: String, path: String){
        if (name != ""){
            Name = name
        }
        if (annotation != ""){
            Annotation = annotation
        }
        if (itType != ""){
            ItType = itType
        }
        if (author != ""){
            Author = author
        }
        if (version != ""){
            Version = version
        }
        if (conditions != ""){
            Conditions = conditions
        }
        if (path != ""){
            PathToDistr = path
        }
    }
    
    enum CodingKeys: CodingKey {
      case Name, Annotation, ItType, Version, Author, Conditions, PathToDistr
    }
    
    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      Name = try container.decode(String.self, forKey: .Name)
      Annotation = try container.decode(String.self, forKey: .Annotation)
      ItType = try container.decode(String.self, forKey: .ItType)
      Author = try container.decode(String.self, forKey: .Author)
      Version = try container.decode(String.self, forKey: .Version)
      Conditions = try container.decode(String.self, forKey: .Conditions)
      PathToDistr = try container.decode(String.self, forKey: .PathToDistr)
    }
}



