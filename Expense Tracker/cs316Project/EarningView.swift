//
//  EarningView.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-31.
//

import UIKit

class EarningView: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
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
        
        let earningDB = FMDatabase(path: databasePath)
        if let titleString = titleStringViaSegue, let id1 = Int(titleString) {
            if earningDB.open() {
                let querySQL = "SELECT money, category, account, id FROM EARNING WHERE id = \(id1)"
                let results: FMResultSet? = earningDB.executeQuery(querySQL, withArgumentsIn: [])
                
                if results?.next() == true {
                    amount.text = results?.string(forColumn: "money")
                    category.text = results?.string(forColumn: "category")
                    account.text = results?.string(forColumn: "account")
                    
                } else {
                   
                }
                earningDB.close()
            } else {
                print("Error: \(earningDB.lastErrorMessage())")
            }
        } else {
            
        }
    }

    
    @IBAction func deleteRecord(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this income?", preferredStyle: .alert)
                   
                   // Add a delete action
                   alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                       let earningDB = FMDatabase(path: self.databasePath)
                       if let titleString = self.titleStringViaSegue, let id1 = Int(titleString) {
                           if earningDB.open() {
                               let querySQL = "DELETE FROM EARNING WHERE id = \(id1)"
                               let result = earningDB.executeUpdate(querySQL, withArgumentsIn: [])
                               if !result {
                                   print("Error: \(earningDB.lastErrorMessage())")
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
                               earningDB.close()
                           } else {
                               print("Error: \(earningDB.lastErrorMessage())")
                           }
                       }
                   }))
                   
                   alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                   
                   self.present(alert, animated: true, completion: nil)
    }
    

    
    @IBAction func updateRecord(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm Update", message: "Are you sure you want to update this income?", preferredStyle: .alert)
                       
                   alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
                       let earningDB = FMDatabase(path: self.databasePath)
                       if let titleString = self.titleStringViaSegue, let id1 = Int(titleString) {
                           if earningDB.open() {
                               let querySQL = "UPDATE EARNING set money = '\(self.amount.text!)', category ='\(self.category.text!)' , account = '\(self.account.text!)' WHERE id = \(id1)"
                               let result = earningDB.executeUpdate(querySQL, withArgumentsIn: [])
                               if !result {
                                   print("Error: \(earningDB.lastErrorMessage())")
                               } else {
                                   let alertController = UIAlertController(title: "Income Updated", message: nil, preferredStyle: .alert)
                                   self.present(alertController, animated: true, completion: nil)
                                   
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                       alertController.dismiss(animated: true, completion: nil)
                        
                                       DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                           self.navigationController?.popViewController(animated: true)
                                       }
                                   }
                               }
                               earningDB.close()
                           } else {
                               print("Error: \(earningDB.lastErrorMessage())")
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
        databasePath = dirPaths[0].appendingPathComponent("earning.db").path
        
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
