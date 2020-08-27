//
//  CategoryListTableViewController.swift
//  Core Data Demo
//
//  Created by Ayaz Rahman on 26/8/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit
import CoreData

class CategoryListTableViewController: UITableViewController {
    
    var categories: [Category] = []
    var container: NSPersistentContainer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get reference to the appdelegate to access the persistent container variable
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        // initialize the container with the application wide persistent container
        container = appDelegate.persistentContainer
        
        // fetch data from the core data using the persistent container
        do{
            try categories = container!.viewContext.fetch(Category.fetchRequest()) as! [Category]
        } catch {
            print("Fetch Request Failed: \(error.localizedDescription)")
        }
        
        // if application started for the first time, there would be no data in the system
        // So we set up some default data
        if categories.count == 0 {
            setDefaultData()
        }
        // Just to set the title of the navbar
        self.title = "Animal Guide"
       
    }
    
    
    
    // Set up for the cell of each row. Default cell is used here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Caution: Cell setup should not be in the view controller
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Configure the cell...
        let animal: Animal = (categories[indexPath.section].animals?.allObjects[indexPath.row])! as! Animal
        cell.detailTextLabel?.text = "Total samples: \(animal.count)\t\t\t\((animal.stamped) ? "Stamped" : "Not Stamped")"
        cell.detailTextLabel?.textColor = (animal.stamped) ? .black : .red
        cell.textLabel?.text = animal.name
        
        
        return cell
    }
    
    /* To setup the title string for each section
       You are not limited to just title string, you can even set a custom cell as a view
       Check documentation for more info
     */
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Caution: Cell setup up should not be in view controller
        let category = categories[section]
        var stamped = 0
        for item in category.animals!{
            let item = item as! Animal
            if(item.stamped){
                stamped+=1
            }
        }
        return "\(category.name!) - \(stamped) stamped out of \(category.animals!.count)"
    }
    
}

// MARK: - Table view data source
extension CategoryListTableViewController{
    
    // Returns the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categories.count
    }
    
    // Returns the number of rows in a secion
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories[section].animals?.count ?? 0
    }
}

// MARK: - CoreData Functions
extension CategoryListTableViewController{
    // Adds default data to our database
    fileprivate func setDefaultData(){
        // Create a category
        var category1 = addCategory(name: "Forest Wildlife", desc: "found in forest")
        // Add 2 animals to the category
        category1.addToAnimals(addAnimal(name: "Grizzly Bear", count: 1, stamped: true))
        category1.addToAnimals(addAnimal(name: "Whitetail Deer", count: 2, stamped: false))
        categories.append(category1)
        // Create another category
        category1 = addCategory(name: "Wetland Wildlife", desc: "found near wet area")
        // Add 2 animals to the newly created category
        category1.addToAnimals(addAnimal(name: "Aligator", count: 1, stamped: false))
        category1.addToAnimals(addAnimal(name: "Toad", count: 0, stamped: true))
        categories.append(category1)
        
        tableView.reloadData()
    }
    // Adds a new animal to the database
    fileprivate func addAnimal(name: String, count: Int16, stamped: Bool) -> Animal{
        let animal = NSEntityDescription.insertNewObject(forEntityName: "Animal", into: container!.viewContext) as! Animal
        animal.name = name
        animal.count = count
        animal.stamped = stamped
        return animal
    }
    // Adds a new category to our database
    fileprivate func addCategory(name: String, desc: String) -> Category {
        let category = NSEntityDescription.insertNewObject(forEntityName: "Category", into: container!.viewContext) as! Category
        category.name = name
        category.desc = desc
        return category
    }
}
