//
//  EditViewController.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-04-02.
//

import UIKit

class EditViewController:UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    var titleStringViaSegue : String?
    var databasePath = String()
    
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
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
    
    @IBAction func updateEditor(_ sender: Any) {
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
                    let alertController = UIAlertController(title: "Record Saved", message: nil, preferredStyle: .alert)
                    self.present(alertController, animated: true, completion: nil)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        alertController.dismiss(animated: true, completion: nil)
                        
                        self.amount.text = ""
                        self.category.text = ""
                        self.account.text = ""
                        self.note.text = ""
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            } else {
                print("Error: \(expenseDB.lastErrorMessage())")
            }
            expenseDB.close()


    }
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
     amount.resignFirstResponder()
     category.resignFirstResponder()
     account.resignFirstResponder()
     note.resignFirstResponder()
     }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        account.inputView = pickerView
        category.text = titleStringViaSegue
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
        note.resignFirstResponder()
        return true
    }


}
