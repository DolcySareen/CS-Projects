//
//  EarningViewController.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-31.
//

import UIKit
struct Earning {
    var id: Int
    var category: String
    var amount: String
    var date: String
}

class EarningViewController: UITableViewController {
    
    var databasePath = String()
    var earnings: [Earning] = []


    func fetchExpenses() {
           earnings.removeAll()
           
           let filemgr = FileManager.default
           let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
           databasePath = dirPaths[0].appendingPathComponent("earning.db").path
        
           let earningDB = FMDatabase(path: databasePath)

           if earningDB.open() {
               let querySQL = "SELECT * FROM earning"
               if let results = earningDB.executeQuery(querySQL, withArgumentsIn: []) {
                   while results.next() {
                       let id = Int(results.int(forColumn: "id"))
                       let category = results.string(forColumn: "category") ?? ""
                       let amount = results.string(forColumn: "money") ?? ""
                       let date = results.string(forColumn: "date") ?? ""
                       let earning = Earning(id: id, category: category, amount: amount, date: date)
                       earnings.append(earning)
                   }
               } else {
                   print("Error executing query: \(earningDB.lastErrorMessage())")
               }
               earningDB.close()
           } else {
               print("Error opening database: \(earningDB.lastErrorMessage())")
           }

           tableView.reloadData()
       }
    
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) {
     
     }
    
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
     fetchExpenses()
 }
    
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchExpenses()
}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return earnings.count
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell1", for: indexPath)
            let earning = earnings[indexPath.row]
            
        
            cell.textLabel?.text = "\(earning.category): \(earning.amount)"
            
            cell.detailTextLabel?.text = earning.date
            
            return cell
        }
    
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath){

         performSegue(withIdentifier: "Segue4", sender: self)

         }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "Segue4" {
                let sdest = segue.destination as? EarningView
                let indexPath = tableView.indexPathForSelectedRow
                let id = earnings[indexPath!.row].id
                let titleString = String(id)
                sdest?.titleStringViaSegue = titleString
            }
        }
}
