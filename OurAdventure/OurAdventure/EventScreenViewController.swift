//
//  EventScreenViewController.swift
//  OurAdventure
//
//  Created by student on 27/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit


class EventScreenViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var recebeNome: String?
    var recebeLocal: String?
    var recebeData: String?
    var recebeTempo: String?
    var recebeDescricao : String?
    var recebeImagem: String?

    
    var package: Event?
    var userEvents:[Event] = userEventDAO.getEvent()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Event"
        if(self.package != nil){
            self.pictureImageView.image = UIImage(named: (self.package?.picture)!)
            self.nameLabel.text = self.package?.name
            self.locationLabel.text = self.package?.location
            self.dateLabel.text = self.package?.date
            self.descriptionTextView.text = self.package?.description
            self.timeLabel.text = self.package?.time
        }else{
            
            self.nameLabel.text = recebeNome
            self.locationLabel.text = recebeLocal
            self.dateLabel.text = recebeData
            self.descriptionTextView.text = recebeDescricao
            self.timeLabel.text = recebeTempo
            self.pictureImageView.image = UIImage(named: "praiaBV")
            
            //
        }
    }
    @IBAction func participateButton(_ sender: UIButton) {
        var found = false
        for i in 0...userEvents.count{
            if userEvents[i].name == package?.name{
                found = true
            }
            if !found{
                
            }
        }
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
