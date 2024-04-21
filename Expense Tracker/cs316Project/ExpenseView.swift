//
//  ExpenseView.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-28.
//

import UIKit


struct Expense {
    var id: Int
    var category: String
    var amount: String
    var date: String
}
class ExpenseView: UITableViewController {
    var databasePath = String()
    var expenses: [Expense] = []

    
    func fetchExpenses() {
        expenses.removeAll()
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("expense.db").path
     
        let expenseDB = FMDatabase(path: databasePath)

        if expenseDB.open() {
            let querySQL = "SELECT * FROM expense"
            if let results = expenseDB.executeQuery(querySQL, withArgumentsIn: []) {
                while results.next() {
                    let id = Int(results.int(forColumn: "id"))
                    let category = results.string(forColumn: "category") ?? ""
                    let amount = results.string(forColumn: "money") ?? ""
                    let date = results.string(forColumn: "date") ?? ""
                    let expense = Expense(id: id, category: category, amount: amount, date: date)
                    expenses.append(expense)
                }
            } else {
                print("Error executing query: \(expenseDB.lastErrorMessage())")
            }
            expenseDB.close()
        } else {
            print("Error opening database: \(expenseDB.lastErrorMessage())")
        }

        tableView.reloadData()
    }
    
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) {
     
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchExpenses()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            fetchExpenses()
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let expense = expenses[indexPath.row]
        
    
        cell.textLabel?.text = "\(expense.category): \(expense.amount)"
        
        cell.detailTextLabel?.text = expense.date
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath){

     performSegue(withIdentifier: "Segue3", sender: self)

     }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue3" {
            let sdest = segue.destination as? DeleteViewController
            let indexPath = tableView.indexPathForSelectedRow
            let id = expenses[indexPath!.row].id
            let titleString = String(id)
            sdest?.titleStringViaSegue = titleString
        }
    }



}
