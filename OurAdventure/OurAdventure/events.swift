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
    let location: String
    let description: String
    let time: String
    let date: String
    let picture: String
    let score: Int
    
    init(name: String, location: String, description: String, time: String, date: String, picture: String, score: Int){
        
        self.name = name
        self.location = location
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
            Event(name:"Limpar a praia", location: "Av. Boa Viagem, Boa Viagem", description:"Limpar a praia de Boa Viagem, ela está toda cagada, passou um monte de chines e cunegudeses comederes de ketchup. Vamos manter a praia limpa, jogando o lixo no saquinho!", time:"8:00 a.m.", date:"30/04", picture:"praiaBV", score:0),
            Event(name:"Caminhada no Ibura", location: "Ladeira da Cohab, Ibura", description:"Caminhada em favor do desarmamento de gangues criminosas. Vamos acabar com o tráfico!!!", time:"11:00 p.m.", date:"01/05", picture:"ibura", score:0),
        ]
    }
    
}

class userEventDAO{
    static func getEvent() -> [Event]{
        let events: [Event] = [
            Event(name:"Limpar a praia", location: "Av. Boa Viagem, Boa Viagem", description:"Limpar a praia de Boa Viagem, ela está toda cagada, passou um monte de chines e cunegudeses comederes de ketchup. Vamos manter a praia limpa, jogando o lixo no saquinho!", time:"8:00 a.m.", date:"30/04", picture:"praiaBV", score:0),
            ]
        return events
    }
    var events: [Event] = userEventDAO.getEvent()
    
}
