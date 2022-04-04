//
//  Item.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class Item: NSObject, NSCoding{
    var name: String
    var SKU: String
    var descriptions: String
    var dateAdded: Date
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(SKU, forKey: "SKU")
        coder.encode(descriptions, forKey: "descriptions")
        coder.encode(dateAdded, forKey: "dateAdded")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        SKU = coder.decodeObject(forKey: "SKU") as! String
        descriptions = coder.decodeObject(forKey: "descriptions") as! String
        dateAdded = coder.decodeObject(forKey: "dateAdded") as! Date
    }
    
    
    
    init(name: String, SKU: String, description: String, dateAdded: Date){
        self.name = name
        self.SKU = SKU
        self.descriptions = description
        self.dateAdded = dateAdded
    }
}
