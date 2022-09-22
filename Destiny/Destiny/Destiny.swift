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
        Story(title: "You are stranded in a forest and see a light.\n\nWhat do you want to do?", choice1: "Walk towards the light", choice1index: 1, choice2: "Walk in the opposite direction", choice2index: 3, pictureIndex: 0), // Index 0
        Story(title: "You have reached the source of the light, a cabin. You see four large figures inside chanting.\n\nWhat do you want to do?", choice1: "Knock on the door.", choice1index: 2, choice2: "Run away.", choice2index: 0, pictureIndex: 1), // Index 1
        Story(title: "You are greeted by hooded figures. They ask for you to join them.\n\nWhat do you want to do?", choice1: "Say thank you and leave.", choice1index: 4, choice2: "Join them", choice2index: 5, pictureIndex: 2), // Index 2
        Story(title: "You have died from the elements of nature.", choice1: "The", choice1index: -1, choice2: "End", choice2index: -1, pictureIndex: 3),  // Index 3 (ENDING 1) (Death)
        Story(title: "You have die from human sacrifice.", choice1: "The", choice1index: -1, choice2: "End", choice2index: -1, pictureIndex: 4),  // Index 4 (ENDING 2) (Death)
        Story(title: "You join the cult and live your live on the basis of others misery.", choice1: "The", choice1index: -1, choice2: "End", choice2index: -1, pictureIndex: 5)  // Index 5 (ENDING 3) (Survival)

    ]
    func returnTitle() -> String
    {
        if currentStory == -1
        {
            return "The End"
        }
        else
        {
        return stories[currentStory].title
        }
    }
    func returnChoiceOne() -> String
    {
        if currentStory == -1
        {
            return "The"
        }
        else
        {
            return stories[currentStory].choice1
        }
        
    }
    func returnChoiceTwo() -> String
    {
        if currentStory == -1
        {
            return "End"
        }
        else
        {
            return stories[currentStory].choice2
        }
    }
    func returnPicture() -> Int
    {
        if currentStory == -1
        {
            return 5
        }
        else
        {
        return stories[currentStory].pictureIndex
        }
    }
}
