//
//  ConfigViewController.swift
//  OurAdventure
//
//  Created by student on 02/05/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func BotaoAlterar(_ sender: Any) {
        NotificationCenter.default.post(name: .didUpdateName, object: self, userInfo: ["name": nameTextField.text!])
        //ProfileTableViewController.name = nameTextField.text
        /*
        let myVC = storyboard?.instantiateViewController(withIdentifier: "profile") as! ProfileTableViewController
        myVC.name = nameTextField.text!
        navigationController?.pushViewController(myVC, animated: true)
    */
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
