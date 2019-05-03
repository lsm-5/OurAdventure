//
//  ViewControllerCreateEvent.swift
//  OurAdventure
//
//  Created by student on 27/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ViewControllerCreateEvent: UIViewController {

    @IBOutlet weak var EventNameUITextFiel: UITextField!
    @IBOutlet weak var LocationUITextField: UITextField!
    @IBOutlet weak var DescriptionUITextField: UITextField!
    @IBOutlet weak var DatesDatePicker: UIDatePicker!
    var date = ""
    
    @IBAction func CriandoEvento(_ sender: Any) {
        let nome = EventNameUITextFiel.text
        let descricao = DescriptionUITextField.text
        let data = date
        let localizacao = LocationUITextField.text
        /*
        var evento: Event
        evento.name = nome
        evento.description = descricao
        evento.data = date
        evento.location = localizacao
        */
        
    }
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        //strDate é uma constante com a data e horario informado
        let strDate = dateFormatter.string(from: DatesDatePicker.date)
        date = strDate
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
