//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Iyer, Eshan R on 4/3/23.
//

import Foundation

struct Athlete {
    var age : Int
    var name : String
    var league : String
    var team : String
    
    var description : String
    {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
