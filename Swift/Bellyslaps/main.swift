//
//  main.swift
//  Bellyslaps
//
//  Created by Brent Martin on 8/11/16.
//  Copyright © 2016 Brent Martin. All rights reserved.
//

import Foundation

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
            guessValue = totalValue * -1
        } else {
            guessValue = totalValue
        }
