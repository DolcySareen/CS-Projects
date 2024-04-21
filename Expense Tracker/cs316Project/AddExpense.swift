//
//  AddExpense.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-24.
//

import UIKit

class AddExpense: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var databasePath = String()
    
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var backbutton: UIButton!
    
    let options1 = ["Food", "Social Life","Pets", "Culture", "Household","Apparel","Beauty","Health","Education","Gift","Other"]
    let options2 = ["Cash", "Accounts", "Card"]
    
    var pickerView1: UIPickerView!
    var pickerView2: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerView1 {
            return options1.count
        } else {
            return options2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerView1 {
            return options1[row]
        } else {
            return options2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerView1 {
            category.text = options1[row]
        } else {
            account.text = options2[row]
        }
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
    
    @IBAction func save(_ sender: Any) {
            let expenseDB = FMDatabase(path: databasePath)
            if expenseDB.open() {
               
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let selectedDate = dateFormatter.string(from: date.date)
                
                let insertSQL = "INSERT INTO EXPENSE (money, category, account, note, date) VALUES ('\(amount.text!)', '\(category.text!)', '\(account.text!)','\(note.text!)', '\(selectedDate)')"
                
                let result = expenseDB.executeUpdate(insertSQL, withArgumentsIn: [])
                if !result {
                       
                       print("Error: \(expenseDB.lastErrorMessage())")
                       } else {
                           print("Record Saved")
                      }
                       
                }
                    expenseDB.close()
                
                
        if let tabBarController = presentingViewController as? UITabBarController,
               let viewController = tabBarController.viewControllers?.first(where: { $0 is ViewController }) as? ViewController {
                if let expenseText = viewController.expense.text,
                   let expenseValue = Double(expenseText),
                   let amountText = amount.text,
                   let amountValue = Double(amountText) {
                    let newExpenseValue = expenseValue + amountValue
                    viewController.expense.text = String(newExpenseValue)
                    
                    let incomeValue = calculateTotalIncome()
                    
                    let newBalance = incomeValue - newExpenseValue
                    let formattedBalance = String(format: "%.2f", newBalance)
                    viewController.balance.text = String(formattedBalance)
                }
            }
                   
                dismiss(animated: true, completion: nil)
        }

     
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView1 = UIPickerView()
        pickerView1.delegate = self
        pickerView1.dataSource = self
        category.inputView = pickerView1
        
        pickerView2 = UIPickerView()
        pickerView2.delegate = self
        pickerView2.dataSource = self
        account.inputView = pickerView2
        
        let filemgr = FileManager.default
         let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)

         databasePath = dirPaths[0].appendingPathComponent("expense.db").path

         if !filemgr.fileExists(atPath: databasePath as String) {

         let expenseDB = FMDatabase(path: databasePath as String)

         if (expenseDB.open()) {
             let sql_stmt = "CREATE TABLE IF NOT EXISTS EXPENSE (ID INTEGER PRIMARY KEY AUTOINCREMENT, MONEY TEXT, CATEGORY TEXT, ACCOUNT TEXT, NOTE TEXT, DATE TEXT)"
         if !(expenseDB.executeStatements(sql_stmt)) {
         print("Error: \(expenseDB.lastErrorMessage())")
         }
         expenseDB.close()
         } else {
         print("Error: \(expenseDB.lastErrorMessage())")
         }
         }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        category.resignFirstResponder()
        account.resignFirstResponder()
        amount.resignFirstResponder()
        note.resignFirstResponder()
        return true
    }
}

