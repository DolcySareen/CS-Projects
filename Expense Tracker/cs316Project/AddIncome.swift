//
//  AddIncome.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-24.
//

import UIKit

class AddIncome: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var databasePath = String()
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    let options1 = ["Allowance", "Salary", "Petty Cash", "Bonus", "Other"]
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
    
    
    
    @IBAction func save(_ sender: Any) {
        let earningDB = FMDatabase(path: databasePath)
                if earningDB.open() {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let selectedDate = dateFormatter.string(from: date.date)
                    
                    let insertSQL = "INSERT INTO EARNING (money, category, account, note, date) VALUES ('\(amount.text!)', '\(category.text!)', '\(account.text!)','\(note.text!)', '\(selectedDate)')"
                    
                    let result = earningDB.executeUpdate(insertSQL, withArgumentsIn: [])
                    if !result {
                        print("Error: \(earningDB.lastErrorMessage())")
                    } else {
                        print("Record Saved")
                    }
                    
                    earningDB.close()
                    
                    if let tabBarController = presentingViewController as? UITabBarController,
                       let viewController = tabBarController.viewControllers?.first(where: { $0 is ViewController }) as? ViewController {
                        if let incomeText = viewController.income.text,
                           let incomeValue = Double(incomeText),
                           let amountText = amount.text,
                           let amountValue = Double(amountText) {
                            let newIncomeValue = incomeValue + amountValue
                            viewController.income.text = String(newIncomeValue)
                            
                           
                            let expenseValue = calculateTotalExpense()
                            
                           
                            let newBalance =  newIncomeValue - expenseValue
                            let formattedBalance = String(format: "%.2f", newBalance)
                            viewController.balance.text = String(formattedBalance)
                            
                        }
                    }
                    
                    dismiss(animated: true, completion: nil)
                } else {
                    print("Unable to open EARNING database")
                }

              

        }

     
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func checkFieldNamesInTable(tableName: String) {
        let earningDB = FMDatabase(path: databasePath)
        if earningDB.open() {
            let querySQL = "PRAGMA table_info(\(tableName))"
            if let results = earningDB.executeQuery(querySQL, withArgumentsIn: []) {
                if results.next() {
                    repeat {
                        if let columnName = results.string(forColumn: "name") {
                            print("Field Name: \(columnName)")
                        }
                    } while results.next()
                } else {
                    print("Table \(tableName) doesn't exist or has no columns.")
                }
            } else {
                print("Error executing query: \(earningDB.lastErrorMessage())")
            }
            earningDB.close()
        } else {
            print("Error opening database: \(earningDB.lastErrorMessage())")
        }
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
        databasePath = dirPaths[0].appendingPathComponent("earning.db").path
        
        if !filemgr.fileExists(atPath: databasePath) {
            let earningDB = FMDatabase(path: databasePath)
            if earningDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS EARNING (ID INTEGER PRIMARY KEY AUTOINCREMENT, MONEY TEXT, CATEGORY TEXT, ACCOUNT TEXT, NOTE TEXT, DATE TEXT)"
                if !earningDB.executeStatements(sql_stmt) {
                    print("Error \(earningDB.lastErrorMessage())")
                } else {
                    print("EARNING table created successfully")
                }
                earningDB.close()
            } else {
                print("Error \(earningDB.lastErrorMessage())")
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

