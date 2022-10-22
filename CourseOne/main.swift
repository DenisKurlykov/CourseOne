//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) Больше практиковаться, повторите то, что есть в видео.
/*
 enum ИмяПеречисления {
 // список через case
 }
 */
enum TravelClas {
    case first, buseness, economy
}
let travel = TravelClas.first

enum Medal {
    case gold
    case silver
    case bronse
}

let medal = Medal.bronse
switch medal {
case .gold:
    print("your medal gold")
case .silver:
    print("your medal silver")
case .bronse:
    print("your medal bronse")
}

enum DayWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    enum friday {
        case day
        case night
    }
    case saturday
    case sunday
}

let friday = DayWeek.friday.day

enum Operation {
    case double(Double)
    case integer(Int)
    case float(Float)
    case string(String)
}
var dictionaty: Dictionary<String, Operation> = [
    "Double": Operation.double(25.7),
    "Integer": Operation.integer(10),
    "Float": Operation.float(24.7),
    "String": Operation.string("Строка")
]

let pr = dictionaty["String"]
print(pr!)


// 4) Создать несколько своих enum, названия какие хотите: например, анкета сотрудника - пол, возраст,ФИО, стаж. Используйте switch как в видео.
let gender = "male"
let age = "43"
let name = "Kiril"
let surname = "Ivanov"
let fullName = "\(name) \(surname)"

enum Questionnaire {
    case gender
    case age
    case fullName
}
let questionnaire = Questionnaire.fullName

switch questionnaire {
case .gender:
    print(gender)
case .age:
    print(age)
case .fullName:
    print(fullName)
}

// 5) Создать enum со всеми цветами радуги. Создать функцию, которая содержит названия разных предметов или объектов. Пример результата в консоли "apple green", "sun red" и т.д.
enum RainbowColors: Int {
    case req
    case orange
    case yellow
    case green
    case lightBlue
    case blue
    case purple
}

func printObject(color: RainbowColors) {
    let objects = ["apple", "orange", "sun", "grass", "sky", "ocean", "flower"]
    switch color {
    case let objectCollor:
        let object = objects[objectCollor.rawValue]
        print("\(object) \(objectCollor)")
    }
}
printObject(color: .green)

// 6) Создать функцию, которая выставляет оценки ученикам в школе.
enum SchoolAssessment {
    case nice
    case good
    case bad
    case worst
}
func grading(assessment: SchoolAssessment) -> Int {
    switch assessment {
    case .nice:
        return 5
    case .good:
        return 4
    case .bad:
        return 3
    case .worst:
        return 2
    }
}

// 7) Создать Enum Vehicles. Добавить в него 3 вложенных Enum: Cars, Ships, Bikes. В каждом Enum добавить по 3 значения. Каждое значение имеет 2 ассоциативных типа (String, Int).
enum Vehicles {
    enum Cars {
        case bmw(String, Int)
        case mercedes(String, Int)
        case volvo(String, Int)
        
    }
    enum Ships {
        case sailboat(String, Int)
        case boat(String, Int)
        case Catamaran(String, Int)
    }
    enum Bikes {
        case sport(String, Int)
        case chopper(String, Int)
        case cruiser(String, Int)
    }
}

// 8) Создать функцию, принимающую в качестве параметра элемент Vehicles.Cars. C помощью switch вывести для найденного кейса ассоциативные значения с припиской «Печать из switch» и вызвать closure, в который передать ассоциативные значения. Closure должен выводить на печать эти значения с припиской «Печать из Closure». После этого провалиться в следующий элемент switch и вызвать secondClosure(), которая выводить в консоль «Печать из secondClosure»
/*
    Печать из switch Black, 340
    Печать из closure color Black, speed 340
    Пчать из secondClosure, closure
*/
//если передаете элемент, который в свиче последний. Третьей строчки быть не должно.
func vihical(for car: Vehicles.Cars, closure:(String, Int) -> (), secondClosure:() -> ()) {
    var lastCase = false
    switch car {
    case let .bmw(string, int):
        lastCase = true
        print("Печать из switch \(string) \(int)")
        closure(string, int)
        fallthrough
    case let .mercedes(string, int):
        if lastCase {
            fallthrough
        } else {
            lastCase = true
            print("Печать из switch \(string) \(int)")
            closure(string, int)
            fallthrough
        }
    case let .volvo(string, int):
        if lastCase {
            secondClosure()
        } else {
            print("Печать из switch \(string) \(int)")
            closure(string, int)
        }
    }
}

vihical(for: .bmw("Black", 340)) { color, speed in
    print("Печать из closure color \(color), speed \(speed)")
} secondClosure: {
    print("Печать из secondClosure")
}

// 9) Создать enum House: Int c 5-ю case –ми и задайте им исходные значения.
    //Создать в House вычисляемое свойство houseHeight, в котором выводить текущее значение * 100
    // Создать в House функцию в которой выводить на печать значение из вычисляемого свойства.
enum House: Int {
    case parquet = 100
    case door = 50
    case window = 150
    case wallpaper = 20
    case chandelier = 200
    var houseHeight: Int { return self.rawValue * 100 }
    func getValue() {
        print(houseHeight)
    }
}
let value = House.parquet
print(value.getValue())
