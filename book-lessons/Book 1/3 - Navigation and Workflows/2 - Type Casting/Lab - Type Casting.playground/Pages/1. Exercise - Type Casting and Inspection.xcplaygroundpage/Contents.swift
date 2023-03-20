/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var items: [Any] = [5, "Bill", 6.7, false]

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for i in items
{
    if i is Int{
        print("\(i) am an Integer!")
    }
    if i is Bool{
        print("\(i) am an Boolean!")
    }
    if i is Double{
        print("\(i) am an Double!")
    }
    if i is String{
        print("\(i) am an String!")
    }
}
print()
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let dict: [String : Any] = ["1": 12, "2": "213", "3": 1.21, "4": false, "5": "asdasdasd"]

print(dict)
print()
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total : Double = 0

for i in dict
{
    if i.value is Double{
        total += (i.value as! Double)
    }
    if i.value is Int{
        total += Double(i.value as! Int)
    }
    if i.value is String{
        total += 1
    }
    if i.value is Bool{
        if (i.value as! Bool)
        {
            total += 2
        }
        else
        {
            total -= 3
        }
    }
    
    
}
print(total)
print()
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2 : Double = 0

for i in dict
{
    if i.value is Double{
        total2 += (i.value as! Double)
    }
    if i.value is Int{
        total2 += Double(i.value as! Int)
    }
    if i.value is String{
        let str = i.value as! String

        let num : Double = Double(str) ?? 0
        
        total2 += num
    }
    
    
}
print(total2)
print()

/*:
 page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
