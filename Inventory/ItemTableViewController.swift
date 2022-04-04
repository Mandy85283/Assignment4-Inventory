//
//  ItemTableViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class ItemTableViewController: UITableViewController{

   var itemList = ItemList()
   // @IBAction func toggleEditMode(_ sender: UIBarButtonItem){
     //   if isEditing{
       //     sender.title = "Edit"
         //   setEditing(false, animated: true)
        //}else{
          //  sender.title = "Done"
            //setEditing(true, animated: true)
              //          }
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)

        // Configure the cell...
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-mm-dd"
        
        let item = itemList.items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = dateformatter.string(from: item.dateAdded)
        
        return cell
    }

   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.deleteItem(row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        itemList.moveItem(from: fromIndexPath.row, to: to.row)
        tableView.reloadData()
        
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dst = segue.destination as! DetailsViewController
        dst.itemList = itemList
        var item: Item = Item(name: "", SKU: "", description: "", dateAdded: Date())
        
        if segue.identifier == "edit"{
            if let index = tableView.indexPathForSelectedRow{
                item = itemList.items[index.row]
            }
        }
        dst.item = item 
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }

}

