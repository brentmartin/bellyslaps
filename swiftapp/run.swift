//
//  main.swift
//  Bellyslaps
//
//  Created by Brent Martin on 8/11/16.
//  Copyright © 2016 Brent Martin. All rights reserved.
//

import Foundation

system("clear")

var quitGame: Bool = false
var firstGame: Bool = true
var playCount: Int = -1
var guessCount = [Int]()
var drinkCount = [Int]()
let weekdays: Array<String> = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

while quitGame == false {
    playCount += 1
    print("\n\n")

    if firstGame == false {
        print("Tomorrow is yet another day! Should we check in on Jason again? (y) or (n) ")
    }

    if firstGame == true {
        print("It's happy hour! Should we check in on Jason and see if he would like a drink? (y) or (n) ")
        firstGame = false
    }

    if var yourResponse = readLine() {
        if yourResponse == "y" {


            system("clear")

            // Instantiating integers to randomize counts later
            var meetingsCount: Int = 0
            var reviewsCount: Int = 0
            var bugsCount: Int = 0
            var codesCount: Int = 0
            var shippedChance: Int = 0
            var deployCount: Int = 0

            // Creating arrays to push each into
            var meetings = [Int]()
            var reviews = [Int]()
            var bugs = [Int]()
            var codes = [Int]()
            var deploy = [Int]()

            // For guessing drinks later
            var drinkValue: Int = 0
            var totalValue: Int = 0
            var h = 0
            var l = 0
            var t = 0

            // To fill arrays with integers
            meetings = []
            meetingsCount = 3 + Int(arc4random() % 3)
            for m in 0...meetingsCount {
                var number: Int = 1
                meetings.append(number)
            }
            let meetingsValue = meetings.reduce(0, combine: +)


            reviews = []
            reviewsCount = 1 + Int(arc4random() % 5)
            for r in 0...reviewsCount {
                var number: Int = -1
                reviews.append(number)
            }
            let reviewsValue = reviews.reduce(0, combine: +)


            bugs = []
            bugsCount = Int(arc4random() % 5)
            for b in 0...bugsCount {
                var number = Int(arc4random() % 3)
                bugs.append(number)
            }
            let bugsValue = bugs.reduce(0, combine: +)


            codes = []
            codesCount = Int(arc4random() % 4)
            for c in 0...codesCount {
                var number = Int(arc4random() % 3) - 1
                codes.append(number)
            }
            let codesValue = codes.reduce(0, combine: +)


            deploy = []
            shippedChance = Int(arc4random() % 5)
            deployCount = 0
            if shippedChance < 1 {
                deployCount = 1
            } else {
                deployCount = 0
            }
            for d in 0...deployCount {
                var number = Int(arc4random() % 6) - 3
                deploy.append(number)
            }
            let deployValue = deploy.reduce(0, combine: +)

            totalValue = meetingsValue + reviewsValue + bugsValue + codesValue + deployValue

            if totalValue < 0 {
                drinkValue = totalValue * -1
            } else {
                drinkValue = totalValue
            }



            // Prints previous results
            if playCount >= 1 {
              print("\(weekdays[0]), Jason had \(drinkCount[0]) scotches, and it took you \(guessCount[0]) guesses.")
            }

            if playCount >= 2 {
              print("\(weekdays[1]), Jason had \(drinkCount[1]) scotches, and it took you \(guessCount[1]) guesses.")
            }

            if playCount >= 3 {
              print("\(weekdays[2]), Jason had \(drinkCount[2]) scotches, and it took you \(guessCount[2]) guesses.")
            }

            if playCount >= 4 {
              print("\(weekdays[3]), Jason had \(drinkCount[3]) scotches, and it took you \(guessCount[3]) guesses.")
            }

            if playCount >= 5 {
              print("\(weekdays[4]), Jason had \(drinkCount[4]) scotches, and it took you \(guessCount[4]) guesses.")
            }

            print("\n\n")
            // Prints what day we're on
            print("Its \(weekdays[playCount])!", terminator: " ")
            if playCount >= 4 {
              print("But tomorrow is the WEEKEND, so this is the last game!", terminator: " ")
              quitGame = false
            }
            print("How's Jason doing?", terminator: "\n\n")

            // Prints the prompts for the user
            print("Jason had \(meetingsCount) meetings today.", terminator: " ")
            print("He reviewed \(reviewsCount) codes,", terminator: " ")
            if bugsCount > 0 {
                print("and found \(bugsCount) bugs in them.", terminator: " ")
            } else {
                print("and all the codes are bug-free!.", terminator: " ")
            }
            if codesCount > 0 {
                print("Luckily, he got to write \(codesCount) codes today", terminator: " ")
            } else {
                print("Unfortunately, he got to write no codes today", terminator: " ")
            }
            print("- and we all know how much Jason loves the codes.", terminator: " ")
            if deployCount == 1 {
                print("Also, a big ole chunk of codes shipped today.")
            }
            print("So how many Scotches do you think Jason will have today?")

            // Loop for guessing how many drinks
            print("Take a guess?", terminator: " ")
            while Int(yourResponse) != drinkValue {
                print("Enter a number to guess. ")
                if var yourResponse = readLine() {

                    // Increases the missed guess count
                    if (Int(yourResponse) > drinkValue) {
                        h += 1
                    }
                    if (Int(yourResponse) < drinkValue) {
                        l += 1
                    }

                    // Guessing too high
                    if (Int(yourResponse) > drinkValue) && (h == 1) {
                        print("Nope, too much.")
                        continue
                    }
                    if (Int(yourResponse) > drinkValue) && (h == 2) {
                        print("Does Jason look like an alcoholic to you? Less.")
                        continue
                    }
                    if (Int(yourResponse) > drinkValue) && (h >= 3) {
                        print("Funny guy. Lower.")
                        continue
                    }

                    // Guessing too low
                    if (Int(yourResponse) < drinkValue) && (l == 1) {
                        print("Definitely more than that.")
                        continue
                    }
                    if (Int(yourResponse) < drinkValue) && (l == 2) {
                        print("More, Jason likes his Scotch remember?")
                        continue
                    }
                    if (Int(yourResponse) < drinkValue) && (l >= 3) {
                        print("Little more...")
                        continue
                    }

                    // Guessed right
                    if Int(yourResponse) == drinkValue {
                        print("You nailed it!")
                        t = h + l
                        guessCount.append(t + 1)
                        drinkCount.append(drinkValue)
                        break
                    }
                }
            }


            if totalValue < 0 {
                print("Jason will celebrate with \(drinkValue) Scotches today!")
            } else if totalValue > 0 {
                print("Jason will drown his sorrows with \(drinkValue) Scotches today!")
            } else {
                print("Jason will not have any Scotches today!")
            }


        } else {
            print("Cool, nvm then.")
            break
        }
    }
}
