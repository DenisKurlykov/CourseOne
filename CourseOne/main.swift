//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

var stringArray = ["Hi", "Hello", "Good By"]
var intArray = [1, 2, 3, 4, 5, 6, 7]
var doubleArray = [1.23, 3.15, 32.43]

func printElementFromArray<T>(elements: [T]) {
    for element in elements {
        print(element)
    }
}

printElementFromArray(elements: stringArray)
printElementFromArray(elements: intArray)
printElementFromArray(elements: doubleArray)

func doNothing<T>(element: T) -> T {
    element
}

let one: () = print(doNothing(element: "Mama"))
let two: () = print(doNothing(element: 1234))

var emptyArray = [String]()

struct GenericArray<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
}

var myFriendsList = ["Vova", "Dima", "Vasya"]
var arrays = GenericArray(items: myFriendsList)
arrays.push(item: "Misha")
print(arrays)

//2) Зайти в документацию открыть тему generic и руками набрать пол главы разобраться как это работает http://swiftbook.ru/doc/swift-tour/generics


// 3) Создать любой generic для классов, структур, методов, перечислений (по 1 на каждый).
enum Cases<T> {
    case one(T)
    case two(T)
}

print(Cases.one("Один"))
print(Cases.two("Два"))

struct Steck<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.insert(contentsOf: [item], at: 0)
    }
    mutating func pop() -> T {
        items.removeFirst()
    }
}

var steck = Steck(items: [1, 2, 3, 4, 5])
print(steck.pop())

// 4) Написать функцию, которая принимает Generic объект и складывает в массив/словарь (на выбор)
func addObject<T>(_ object: T) {
    var objects = [T]()
    objects.append(object)
}

// 5) Создать класс, который сортирует массивы значений (на ваш выбор) 3 разными способами.
class Sorted<T: Comparable> {
    func sortUp<T: Comparable>(array: [T]) -> [T] {
        return array.sorted { $0 < $1 }
    }

    func sortDown<T: Comparable>(array: [T]) -> [T] {
        return array.sorted { $0 > $1 }
    }

    func randomSort<T>(array: [T]) -> [T] {
        return array.shuffled()
    }
}

let classOne = Sorted<Int>()
print(classOne.randomSort(array: [1, 5, 6, 4, 2, 3]))


// 6) Написать класс на свой вкус (любые методы, проперти) универсального типа. Используя extension, расширить класс, добавить сабскрипт.
class Gamer<T> {
    var game: T

    init(game: T) {
        self.game = game
    }

    func play<T>(game: T) {
        print("Иду играть в \(game)")
    }
}

extension Gamer {
    subscript(index: T) -> T {
        get {
            return game
        }
        set {
            game = newValue
        }
    }
}

let gamer = Gamer(game: "WoW")
gamer["CS"] = "CS"
print(gamer["CS"])
gamer.play(game: 911)

