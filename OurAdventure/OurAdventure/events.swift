//
//  events.swift
//  OurAdventure
//
//  Created by student on 27/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
class Event{
    
    let name: String
    let description: String
    let time: String
    let date: String
    let picture: String
    let score: Int
    
    init(name: String, description: String, time: String, date: String, picture: String, score: Int){
        
        self.name = name
        self.description = description
        self.time = time
        self.date = date
        self.picture = picture
        self.score = score
    }
    
}

class EventDAO{
    
    static func getEvent() -> [Event]{
        return [
            Event(name:"Limpar a praia", description:"Limpar a praia de Boa Viagem", time:"8:00 a.m.", date:"30/04", picture:"praiaBV", score:0),
        ]
    }
    
}
