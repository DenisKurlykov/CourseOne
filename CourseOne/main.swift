//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// a).Найти информацию что такое наследование в Google, перефразировать эту информацию своими словами и вставить это в плейграунд в закомментировано" виде.
/*
 Наследование - это возможность наделять вновь созданные объекты свойствами и методами уже существующих.
 */

// b).Сделать то же самое с понятием Инкапсуляция.
/*
 Инкапсуляция - это возможность ограничения доступа к свойсвам и методам класса. Инкапсулированные свойства и методы
 решают внутреннюю логику класса.
 */

// c).И так же с понятием полиморфизм.
/*
 Полиморфизм - это объединение объектов по одному типу не взирая на содержимое этих объектов
 */

//1) Создать класс "люди", в этом классе 4 property - "имя", "рост", "вес", "пол", а также будет иметь метод "say(говорит)". 2) Создать subСlass (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)" в каждом из этих классов.
class People {
    enum Gender {
        case male
        case female
    }
    
    let name: String
    let height: Int
    let weight: Int
    let gender: Gender
    
    init(name: String, height: Int, weight: Int, gender: Gender) {
        self.name = name
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
    func say() {
        print("Привет меня зовут '\(name)")
    }
}

class Cook: People {
    override func say() {
        print("Привет я повар \(name)")
    }
}

class Manager: People {
    override func say() {
        print("Привет я менеджер \(name)")
    }
}

class Wrestler: People {
    override func say() {
        print("Привет я борец \(name)")
    }
}

// 3) Создать по одному объекту(экземпляру) каждого класса и объединить их в массив.
let human = People(name: "Иван", height: 175, weight: 80, gender: .male)
let cook = Cook(name: "Яна", height: 170, weight: 45, gender: .female)
let manager = Manager(name: "Дима", height: 170, weight: 90, gender: .male)
let wrestler = Wrestler(name: "Федя", height: 195, weight: 130, gender: .male)

var peoples = [human, cook, manager, wrestler]

// 4) В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)".
for people in peoples {
    print(people.name, people.height, people.weight, people.gender, people.say())
}

// 5) Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People.
// 6) Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People.
class Driver: People {
    enum DriverLicense {
        case A
        case B
        case C
    }
    
    let experience: Int
    let categoryDriverLicense: DriverLicense
    
    init(name: String, height: Int, weight: Int, gender: Gender, experience: Int, categoryDriverLicense: DriverLicense) {
        self.experience = experience
        self.categoryDriverLicense = categoryDriverLicense
        super.init(name: name, height: height, weight: weight, gender: gender)
    }
    override func say() {
        print("\(super.say()) Я водитель со стажем \(experience)")
    }
}

let driver = Driver(name: "Петя",
                    height: 160,
                    weight: 80,
                    gender: .male,
                    experience: 20,
                    categoryDriverLicense: .B)
peoples += [driver]

print("__________________________")

for people in peoples {
    if let driver = people as? Driver {
        print(driver.name,
              driver.height,
              driver.weight,
              driver.gender,
              driver.experience,
              driver.categoryDriverLicense,
              driver.say())
    } else {
        print(people.name,
              people.height,
              people.weight,
              people.gender,
              people.say())
    }
}


// 7) Вывести все это в обратном порядке(Google в помощь).
print("__________________________")

for people in peoples.reversed() {
    if let driver = people as? Driver {
        print(driver.name,
              driver.height,
              driver.weight,
              driver.gender,
              driver.experience,
              driver.categoryDriverLicense,
              driver.say())
    } else {
        print(people.name,
              people.height,
              people.weight,
              people.gender,
              people.say())
    }
}


// 8) Создать класс "Марсианин" (не наследник класса people!) со своими собственными property (отличными от people) и методом "say" (отличным от people).
class Martian {
    let rassa: String
    
    init(rassa: String) {
        self.rassa = rassa
    }
    
    func say() {
        print("Приветствую тебя представитель другой планеты")
    }
}

// 9) Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".
class Gumanoid: Martian {
    override func say() {
        print("Привет, Я гуманоид")
    }
}

let martian = Martian(rassa: "Марсианин")
let gumanoid = Gumanoid(rassa: "Гуманоид")

// 10) Объединить всех people и Марсианинов) в один массив.
let array: [Any] = [human, cook,manager, wrestler ,martian, gumanoid]


