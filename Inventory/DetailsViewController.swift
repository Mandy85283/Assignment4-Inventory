//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    var itemList: ItemList!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
        if let sku = item?.SKU{
            SKUField.text = String(sku)
        }
        if let desc = item?.descriptions{
            descField.text = String(desc)
        }
        dateField.date = item.dateAdded
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameField.text, let sku = SKUField.text, let desc = descField.text else
        {
            return
        }
        
        let item = Item(name: name, SKU: sku, description: desc, dateAdded: dateField.date)
        itemList.addItem(item: item)
        self.navigationController?.popViewController(animated: true)
            
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

