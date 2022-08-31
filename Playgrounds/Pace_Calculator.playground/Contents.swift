import UIKit

// Pace Calculator

let raceDistance: Double = 5

let timeElapsed: Double = 6.25

let currentDistance: Double = 1


print("At the current pace, it will take an additional \((timeElapsed / currentDistance) * raceDistance - timeElapsed) minutes to finish the race.\n ")

print("At the current pace, the total time will be \(timeElapsed / currentDistance * raceDistance) minutes for the \(raceDistance) kilometers.\n")

// GPA Planning Calculator

let currentGPA: Double = 2.8

let targetGPA: Double = 3

let currentCredits: Double = 25

let additionalCredits: Double = 15
















// Restaurant Check Calculator

let mealTotal: Double = 142.42

let serviceDescription: String = "excellent"

var totalPrice = mealTotal

var tip : Double

// Discounts

if (totalPrice <= 50){
    
    totalPrice -= 10
}
else if(totalPrice > 50 && totalPrice < 100)
{
    totalPrice -= 20
    
}
else if (totalPrice >= 100)
{
    totalPrice *= 0.7
}

// Tip
if (serviceDescription == "bad"){
    tip = 0
}
else if (serviceDescription == "so-so"){
    tip = 0.10
}
else if (serviceDescription == "good")
{
    tip = 0.15
}
else if (serviceDescription == "excellent"){
    tip = 0.20
}
else
{
    tip = 0.25
}

tip *= totalPrice

print("Total = \(totalPrice) tip = \(tip) ")




