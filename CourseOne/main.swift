//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation
// Property type  Свойства типа

// 1) Повторить то, что есть в видео.
var str = "Свойства типа"

struct MyStruct {
    static var count = 0
    var name: String
    
    init(name: String) {
        self.name = name
        MyStruct.count += 1
    }
}

var struct1 = MyStruct(name: "Ivan")
var struct2 = MyStruct(name: "Piter")
var struct3 = MyStruct(name: "Max")
var struct4 = MyStruct(name: "Andrey")

print(MyStruct.count)

final class AgeBoy {
    static var naxAge = 8
    var name = ""
    var age = 8 {
        didSet {
            if age > AgeBoy.naxAge {
                age = oldValue
                print("Введите от 6 до 8 лет")
            }
        }
    }
}

let ageClass = AgeBoy()
ageClass.name = "Ivan"
ageClass.age = 15
print(ageClass.age)

// 2) Создать класс журнал с 1 массивом и 2 мя методами, удалить оценку и поставить оценку.
final class Journal {
    static var estimation: [String: Int] = [:]
    
    func addEstimate(name: String, estimate: Int) {
        Journal.estimation[name] = estimate
    }
    
    func deleteEstimate(name: String) {
        Journal.estimation[name] = nil
    }
}

let oleg = Journal()
oleg.addEstimate(name: "Oleg", estimate: 5)
print(Journal.estimation)
oleg.deleteEstimate(name: "Oleg")
print(Journal.estimation)

// 3) Создать в этом же классе метод расписание который в параметр принимает енам из 3 х кейсов утро, обед, вечер.
// 4) Внутри метода добавить свитч который смотрит на параметр в котором энам и говорит во сколько прийти в школу.

final class Journal1 {
    enum Schedule {
        case morning
        case midday
        case evening
    }
    
    func goToSchool(to schedule: Schedule) {
        switch schedule {
        case .morning:
            print("Начало уроков в 8:00")
        case .midday:
            print("Ты проспал школу")
        default:
            print("В школу не нужно идти. Если сделал уроки иди гуляй")
        }
    }
}
let schedule = Journal1()
schedule.goToSchool(to: .midday)
schedule.goToSchool(to: .evening)
