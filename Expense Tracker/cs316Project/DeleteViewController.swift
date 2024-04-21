//
//  DeleteViewController.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-28.
//

import UIKit

class DeleteViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    var titleStringViaSegue : String?
    var databasePath = String()
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var account: UITextField!
    let options = ["Cash", "Accounts", "Card"]
        
    var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
               return options.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
               return options[row]
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
               account.text = options[row]
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let expenseDB = FMDatabase(path: databasePath)
        if let titleString = titleStringViaSegue, let id1 = Int(titleString) {
            if expenseDB.open() {
                let querySQL = "SELECT money, category, account, id FROM EXPENSE WHERE id = \(id1)"
                let results: FMResultSet? = expenseDB.executeQuery(querySQL, withArgumentsIn: [])
                
                if results?.next() == true {
                    amount.text = results?.string(forColumn: "money")
                    category.text = results?.string(forColumn: "category")
                    account.text = results?.string(forColumn: "account")
                    
                } else {
                   
                }
                expenseDB.close()
            } else {
                print("Error: \(expenseDB.lastErrorMessage())")
            }
        } else {
            
        }
    }

    
    @IBAction func deleteRecord(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this expense?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                let expenseDB = FMDatabase(path: self.databasePath)
                if let titleString = self.titleStringViaSegue, let id1 = Int(titleString) {
                    if expenseDB.open() {
                        let querySQL = "DELETE FROM EXPENSE WHERE id = \(id1)"
                        let result = expenseDB.executeUpdate(querySQL, withArgumentsIn: [])
                        if !result {
                            print("Error: \(expenseDB.lastErrorMessage())")
                        } else {
                            let alertController = UIAlertController(title: "Record Deleted", message: nil, preferredStyle: .alert)
                            self.present(alertController, animated: true, completion: nil)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                alertController.dismiss(animated: true, completion: nil)
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.navigationController?.popViewController(animated: true)
                            }
                        }
                        expenseDB.close()
                    } else {
                        print("Error: \(expenseDB.lastErrorMessage())")
                    }
                }
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    

    
    @IBAction func updateRecord(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Update", message: "Are you sure you want to update this expense?", preferredStyle: .alert)
                
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
                let expenseDB = FMDatabase(path: self.databasePath)
                if let titleString = self.titleStringViaSegue, let id1 = Int(titleString) {
                    if expenseDB.open() {
                        let querySQL = "UPDATE EXPENSE set money = '\(self.amount.text!)', category ='\(self.category.text!)' , account = '\(self.account.text!)' WHERE id = \(id1)"
                        let result = expenseDB.executeUpdate(querySQL, withArgumentsIn: [])
                        if !result {
                            print("Error: \(expenseDB.lastErrorMessage())")
                        } else {
                            let alertController = UIAlertController(title: "Expense Updated", message: nil, preferredStyle: .alert)
                            self.present(alertController, animated: true, completion: nil)
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            alertController.dismiss(animated: true, completion: nil)
                                
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.navigationController?.popViewController(animated: true)
                                }
                            }
                        }
                        expenseDB.close()
                    } else {
                        print("Error: \(expenseDB.lastErrorMessage())")
                    }
                }
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
                
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        account.inputView = pickerView
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("expense.db").path
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        category.resignFirstResponder()
        account.resignFirstResponder()
        amount.resignFirstResponder()
        return true
    }
}
