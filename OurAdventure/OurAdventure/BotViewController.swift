//
//  BotViewController.swift
//  OurAdventure
//
//  Created by student on 02/05/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import WebKit

class BotViewController: UIViewController {

    @IBOutlet weak var botWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL (string:"https://assistant-chat-us-south.watsonplatform.net/web/public/e16f213e-abd6-4c55-97e9-29aac103ea44")
        botWebView.loadRequest(URLRequest(url: url!))
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
