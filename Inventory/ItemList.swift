//
//  ItemList.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class ItemList{
    var items = [Item]()
    let itemURL: URL = {
    let docDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    var docDirectory = docDirectories.first!
        return docDirectory.appendingPathComponent("items.inventory")
    }()
    
    init(){
        do{
            let data = try Data(contentsOf: itemURL)
            items = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
        }
        catch let e{
            print(e.localizedDescription)
        }
    }
    func saveData(){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: itemURL)
        }catch let e {
            fatalError(e.localizedDescription)
        }
    }
    
    func addItem(item: Item){
        let date = item.dateAdded
        for (index, i) in items.enumerated(){
            if date.compare(i.dateAdded) == .orderedDescending{
                items.insert(item, at: index)
                return
            }
        }
        items.append(item)
    }
    
    func deleteItem(row: Int){
        items.remove(at: row)
    }
    
    func moveItem(from: Int, to: Int){
        let itemoldplace = items[from]
        let itemnewplace = items[to]
        items[to] = itemoldplace
        items[from] = itemnewplace
    }
    
}
