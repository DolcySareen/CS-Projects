//
//  TableViewController.swift
//  cs316Project
//
//  Created by Dolcy Sareen on 2024-03-24.
//


import UIKit
struct Headline {
 var id : Int
 var title : String
 var image : String
}

class TableViewController: UITableViewController {

    
    var headlines = [
     Headline(id: 1, title: "Food", image: "food"),
     Headline(id: 2, title: "Social Life", image: "social life"),
     Headline(id: 3, title: "Pets", image: "pets"),
     Headline(id: 4, title: "Transport", image: "transport"),
     Headline(id: 5, title: "Culture", image: "culture"),
     Headline(id: 6, title: "Household", image: "household"),
     Headline(id: 7, title: "Apparel", image: "apparel"),
     Headline(id: 8, title: "Beauty", image: "beauty"),
     Headline(id: 9, title: "Health", image: "heath"),
     Headline(id: 10, title: "Education", image: "education"),
     Headline(id: 11, title: "Gifts", image: "gift"),
     Headline(id: 12, title: "Other", image: "other")
     ]
     
    
    
    
     
     override func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
     return  headlines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
               let headline = headlines[indexPath.row]
               cell.textLabel?.text = headlines[indexPath.row].title
               
               cell.imageView?.image = UIImage(named: headline.image)
               return cell
     }
    @IBAction func exitToHere(_ sender: UIStoryboardSegue) {
     
     }
    

     override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath){

          performSegue(withIdentifier: "Segue2", sender: self)

    }

    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Segue2" {
            let sdest = segue.destination as? EditViewController
            let indexPath = tableView.indexPathForSelectedRow
            let titleString = headlines[(indexPath?.row)!].title
            sdest?.titleStringViaSegue = titleString
        }
    }
}
