//
//  Destiny.swift
//  Destiny
//
//  Created by Iyer, Eshan R on 9/12/22.
//

import Foundation

struct Destiny
{
    var currentStory : Int = 0
    
    let stories = [ //construct Story objects inside the list
    Story(title: "this is the first story text (room) that will display", choice1: "first path choice", choice1index: 1, choice2: "second path choice", choice2index: 2), //Story object at index 0
    Story(title: "second room text", choice1: "third choice", choice1index: 0, choice2: "fourth choice", choice2index: 1),
    Story(title: "final room", choice1: "the", choice1index: -1, choice2: "end", choice2index: -1)  //Story object at index 1
    ]
    func returnTitle() -> String
    {
        return stories[currentStory].title
    }
    func returnChoiceOne() -> String
    {
        return stories[currentStory].choice1
    }
    func returnChoiceTwo() -> String
    {
        return stories[currentStory].choice2
    }
}
