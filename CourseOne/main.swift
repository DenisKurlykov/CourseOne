//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

var hello = String()

extension String {
    func sayHello() {
        print("Hello")
    }
}

hello = "Hi"
hello.sayHello()
 
extension Int {
    var squared: Int {
        self * self
    }
}

var value = 30
print(value.squared)

extension Int {
    func funcSquared() -> Int {
        self * self
    }
}

var valueTwo = 3
print(valueTwo.funcSquared())

class Vova {
    var nick = "The swift dev"
}

let realVova = Vova()
print(realVova.nick)

extension Vova {
    func allSelf() -> String {
        "My name is Vova, my nick - \(nick)"
    }
}

let secondVova = Vova()
print(secondVova.allSelf())

// 3) Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
extension String {
    subscript(indexes: ClosedRange<Int>) -> String {
        get {
            var result = String()
            var string = self
            indexes.forEach { _ in
                result += String(string.removeFirst())
            }
            return result
        }
        set {
            var result = self
            indexes.forEach { index in
                result.removeFirst()
                result.insert(contentsOf: newValue, at: String.Index(encodedOffset: index))
            }
            self = result
        }
    }
}

var subscriptString = "123123123"
print(subscriptString[0...4])
subscriptString[1...3] = "1"
print(subscriptString)

// 4) Расширить Int и добавить 3 метода: возведение в квадрат, в куб, в степень
extension Int {
    func squaring() -> Int {
        self * self
    }
    
    func cube() -> Int {
        self * self * self
    }
    
    func power(degree: Int) -> Int {
        var counter = degree
        var result = self
        if counter == 0 {
            return 0
        }
        if counter == 1 {
            return self
        }
        while counter > 1 {
            result *= self
            counter -= 1
        }
        return result
    }
}

var numberOne = 3
print(numberOne.squaring())

print(numberOne.cube())
print(numberOne.power(degree: 1))

// 5) Расширить еще 3 структуры (написать свои, либо взять на свой вкус и в комментах обосновать для чего это было сделано
extension Bool {
    var description: String {
        return self ? "Правда!" : "Ложь!"
    }
}

// 6) Добавьте проперти, которое возвращает количество символов в числе
extension Int {
    var numberOfCharacters: Int {
        String(self).count
    }
}

numberOne = 6543
print(numberOne.numberOfCharacters)

// 7) Добавить метод, который говорит, что число положительное или отрицательное
extension Int {
    func positiveOrNegative() {
        self % 2 == 0 ? print("число  \(self) - положительное") : print("число  \(self) - отрицательное")
    }
}

let numberTwo = 5
numberTwo.positiveOrNegative()

