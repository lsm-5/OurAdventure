//
//  ProfileTableViewController.swift
//  OurAdventure
//
//  Created by student on 29/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    static let didUpdateName = NSNotification.Name(rawValue: "didUpdateName")
}

class ProfileTableViewController: UITableViewController {


    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    var name: String?
    var events = [Event]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.events = userEventDAO.getEvent()
        pictureImageView.image = UIImage(named: "neto")
        nameLabel.text = self.name
        bioTextView.text = "Eu gosto muito de fazer nada"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getName(_:)), name: .didUpdateName, object: nil)
    }
    
    @objc func getName(_ notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let newName = userInfo["name"] as? String {
            DispatchQueue.main.async {
                self.nameLabel.text = newName
                self.name = newName
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userEventCell", for: indexPath)
        
        if let eventCell = cell as? ProfileTableViewCell{
            
            let event = self.events[indexPath.row]
            eventCell.nameLabel.text = event.name
            eventCell.dateLabel.text = event.date
            eventCell.timeLabel.text = event.time
            eventCell.pictureImageView.image = UIImage(named: event.picture)
            
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileToEventSegue"{
            if let newEvent = segue.destination as? EventScreenViewController{
                let IndexPath = self.tableView.indexPathForSelectedRow
                let current = events[(IndexPath?.row)!]
                newEvent.package = current
            }
        }
    }

}
