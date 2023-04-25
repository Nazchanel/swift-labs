//
//  FoodTableViewController.swift
//  mealTracker
//
//  Created by Iyer, Eshan R on 4/25/23.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var food1 = Food(name: "Pizza", description: "Yummy")
    var food2 = Food(name: "Pasta", description: "Zesty")
    var food3 = Food(name: "Tomato", description: "Juicy")
    var meals : [Meal] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meals = [Meal(name: "breakfast", food: [food1, food2, food3]), Meal(name: "lunch", food: [food1, food2, food3]), Meal(name: "dinner", food: [food1, food2, food3])]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return meals[section].food.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        _ = meals[indexPath.section]
        let food = meals[indexPath.section].food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        
        cell.contentConfiguration = content
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
    
    
}
