//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

let str: String = "Привет Мир"
let number = 5
let numberOne = 10
let numberTwo: Double = 10.123456789012345678
let numberThree: Float = 10.12345678901234
let numberFour = true

print(numberTwo)
print(numberThree)

var sum = numberOne + Int(numberTwo)

typealias myNumber = Int
let value: myNumber = 25

typealias znachenie = Double
let valueTwo: znachenie = 5.432176

sum = value + numberOne
print(sum)

var sumTwo = Double(value) - valueTwo
print(sumTwo)

sumTwo = Double(numberThree) / numberTwo
print(sumTwo)

let unicode = "\u{2665}"
print(unicode)

let smile = "\u{1F604}"
print(smile)


if numberFour == true {
    print(str)
} else {
    print("Error")
}

let numberFive = 1_234_567 //Андескор для удобства восприятия чила. На само число не влияет.



