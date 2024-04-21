//
//  ViewController.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-24.
//

import UIKit

class ViewController: UIViewController,UITabBarControllerDelegate {

    var databasePath = String()
    
    @IBOutlet weak var income: UILabel!
    
    @IBOutlet weak var expense: UILabel!
    
    
    @IBOutlet weak var balance: UILabel!
    
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) {
     
     }
    func calculateTotalExpense() -> Double {
            var totalExpense: Double = 0
            
            let filemgr = FileManager.default
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
            databasePath = dirPaths[0].appendingPathComponent("expense.db").path
            
            let expenseDB = FMDatabase(path: databasePath)
            if expenseDB.open() {
                let querySQL = "SELECT money FROM EXPENSE"
                if let results = expenseDB.executeQuery(querySQL, withArgumentsIn: []) {
                    while results.next() {
                        if let amount = results.string(forColumn: "money"), let amountValue = Double(amount) {
                            totalExpense += amountValue
                        }
                    }
                } else {
                    print("Error: \(expenseDB.lastErrorMessage())")
                }
                expenseDB.close()
            } else {
                print("Error: \(expenseDB.lastErrorMessage())")
            }
            
            return totalExpense
        }
    
    
    func calculateTotalIncome() -> Double {
            var totalIncome: Double = 0
            
            let filemgr = FileManager.default
            let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
            databasePath = dirPaths[0].appendingPathComponent("earning.db").path
            
            let earningDB = FMDatabase(path: databasePath)
            if earningDB.open() {
                let querySQL = "SELECT money FROM EARNING"
                if let results = earningDB.executeQuery(querySQL, withArgumentsIn: []) {
                    while results.next() {
                        if let amount = results.string(forColumn: "money"), let amountValue = Double(amount) {
                            totalIncome += amountValue
                        }
                    }
                } else {
                    print("Error: \(earningDB.lastErrorMessage())")
                }
                earningDB.close()
            } else {
                print("Error: \(earningDB.lastErrorMessage())")
            }
            
            return totalIncome
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        reloadData()
    }

    func reloadData() {
           let totalExpense = calculateTotalExpense()
           let totalIncome = calculateTotalIncome()
           
           let formattedExpense = String(format: "%.2f", totalExpense)
           expense.text = formattedExpense
           
           let formattedIncome = String(format: "%.2f", totalIncome)
           income.text = formattedIncome
           
           let newBalance = totalIncome - totalExpense
           let formattedBalance = String(format: "%.2f", newBalance)
           balance.text = formattedBalance
          
       }
       
      
       func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
           
           reloadData()
       }


}

