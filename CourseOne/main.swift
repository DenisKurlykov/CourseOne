//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation


// 1) Повторите что было в уроке.
var dic = ["key": "value"]
print(dic["key"] ?? "")

var array = ["name", "surname"]
print(array[0])

struct Table {
    var multi: Int
    
    subscript(index: Int) -> Int {
        return multi * index
    }
}

var tableResult = Table(multi: 3)
 print(tableResult[10])

struct Man {
    var manOne = "manOne: Hello"
    var manTwo = "manTwo: Im good"
    var manThree = "manThree: Hi"
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0: return manOne
            case 1: return manTwo
            case 2: return manThree
                
            default: return ""
            }
        }
        
        set {
            let value = newValue ?? ""
            
            switch index {
            case 0: manOne = value
            case 1: manTwo = value
            case 2: manThree = value
                
            default: break
            }
        }
    }
}

var say = Man()
print(say[5] ?? "")
say[0] = "Hi Bob"
print(say[0] ?? "")

// 2) Зайти в документацию и Выпишите окло 5 примеров.
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
 
let threeTimesTable = TimesTable(multiplier: 3)
print("шесть умножить на три будет \(threeTimesTable[6])")



// 3) Создать класс в котором будет массив в котором – «мама» «папа» и «дети». Создать sabscript для этого класса что б у класса был доступ как у массива по индексу.
final class Famaly {
    var array = ["Мама", "Папа", "Ребенок"]
    
    subscript(index: Int) -> String {
        get {
            return array[index]
        }
        
        set {
            array[index] = newValue
        }
    }
}

let famaly = Famaly()
print(famaly[0])
famaly[0] = "Бабушка"
print(famaly[0])

// 4) Создать сабскрипт который будет принимать число умножать его на 100 и делить на 2.
final class Mathematic {
    private var formula = 100 / 2
    
    subscript(number: Int) -> Int {
        number * formula
    }
}

// 5) Создать свой subscript у которого внутри есть оператор if else.
class StatementValidator {

    var name = "Oleg"

    subscript(statement: Bool) -> String {
        if statement {
           return "\(name), ты прав"
        } else {
           return "ложь"
        }
    }
}

// 6) Создать класс Human и в нем 3 проперти имя , возраст пол. 7) Создать ещё 2 класса которые наследуются от класса Human и переопределить методы и свойства .
class Human {
    enum Gender {
        case male
        case female
    }
    
    let name: String
    let age: Int
    let gender: Gender
    var full: String {
        return ("\(name), \(age), \(gender)")
    }
    
    init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func greating() {
        print("Привет \(name)")
    }
}

final class Player: Human {
    override func greating() {
        print("Игрок, ваше имя \(name)")
    }
}

let player = Player(name: "Ivan", age: 35, gender: .male)
player.greating()

// 8) Создать дикшинари который хранит все типы данных которые вы знаете, а ключ должен быть только строка.
enum DataType {
    case string(String)
    case int(Int)
    case double(Double)
    case float(Float)
    case bool(Bool)
    case array(Array<Any>)
    case `struct`(Man)
    case `class`(Famaly)
    
}

var dict: [String: Any] = [:]

func value(key: String, value: DataType) {
    dict[key] = value
}

value(key: "Array", value: .array([1, 2]))
value(key: "Int", value: .int(5))
value(key: "Double", value: .double(5.4567))
value(key: "Structura", value: .struct(Man()))
value(key: "Class", value: .class(Famaly()))

print(dict)
