//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 2) Повторить то, что есть в видео. По возможности используем в заданиях Optional chaining


// 3) Сделать класс Люди, у класса будут проперти родственники, соседи и т.д. (все опциональные).
    //3.1) Создать нужно от 15 человек.
class People {
    // MARK: - Public Properties
    let name: String
    var mother: People?
    var father: People?
    var brothers: [People]?
    var sisters: [People]?
    var uncle: People?
    var grandfather: People?
    var grandmother: People?
    
    // MARK: - Initializers
    init(name: String) {
        self.name = name
    }
}

let ivan = People(name: "Ivan")

let piter = People(name: "Piter")
piter.father = piter

let sveta = People(name: "Sveta")
sveta.mother = sveta

let misha = People(name: "Misha")
let pasha = People(name: "Pasha")
ivan.brothers = [misha, pasha]

let yana = People(name: "Yana")
let dasha = People(name: "Dasha")
ivan.sisters = [yana, dasha]

    //3.2) Посчитать, сколько у этого человека двоюродных братьев, троюродных сестёр, теть, дядь, и т.д.
if let brothers =  ivan.brothers?.count {
    print("\(ivan.name) имеет \(brothers) братьев")
}

if let sisters = ivan.sisters?.count {
    print("\(ivan.name) имеет \(sisters) сестер")
}



// 4) Создать класс животные и проперти - корова, коза, собака и т.д. Создать класс растения и проперти - трава, цветы и т.д.
final class Animal {
    enum AnimalType {
        case dog
        case cat
    }
    
    // MARK: - Public Properties
    let name: String
    let type: AnimalType
    
    // MARK: - Initializers
    init(name: String, type: AnimalType) {
        self.name = name
        self.type = type
    }
}

final class Plant {
    enum PlantType {
        case grass
        case flower
    }
    
    // MARK: - Public Properties
    let name: String
    let type: PlantType
    
    // MARK: - Initializers
    init(name: String, type: PlantType) {
        self.name = name
        self.type = type
    }
}

let rose = Plant(name: "Роза", type: .flower)
let fialka = Plant(name: "Фиалка", type: .flower)
let romashka = Plant(name: "Ромашка", type: .grass)

let mursik = Animal(name: "Мурзик", type: .cat)
let muhtar = Animal(name: "Мухтар", type: .dog)

// 5) Положить все классы в массив и отсортировать по алфавиту и по классу - Люди - животные - растения
var array: [AnyObject] = [rose, fialka, romashka, ivan, piter, sveta, misha, pasha, yana, dasha, mursik, muhtar]
// Вариант 1
array.sort { (nameOne, nameTwo) in
    if let sortedPeople = nameOne as? People,
       let sortedPeopleTwo = nameTwo as? People {
        return sortedPeople.name < sortedPeopleTwo.name
    } else if let sortedAnimals = nameOne as? Animal,
              let sortedAnimalsTwo = nameTwo as? Animal {
        return sortedAnimals.name < sortedAnimalsTwo.name
    } else if let sortedFlowers = nameOne as? Plant,
              let sortedFlowersTwo = nameTwo as? Plant {
        return sortedFlowers.name < sortedFlowersTwo.name
    }
    return true
}


for index in array {
    if let people = index as? People {
        print(people.name)
    } else if let animals = index as? Animal {
        print(animals.name)
    } else if let flowers = index as? Plant {
        print(flowers.name)
    }
}

// Вариант 2
var peopls: [String] = []
var animals: [String] = []
var plants: [String] = []

let sorted: [()] = array.map { name in
    if let people = name as? People {
        peopls.append(people.name)
    } else if let animal = name as? Animal {
        animals.append(animal.name)
    } else if let plant = name as? Plant {
        plants.append(plant.name)
    }
}
print("Класс люди содержит \(peopls.sorted())")
print("Класс животные содержит \(animals.sorted())")
print("Класс растения содержит \(plants.sorted())")


// 6) Создать 3 класса Rectangle, Circle, Radius
    //Класс Rectangle свойства: circle: Circle?
    //Класс Radius свойства: radiusName: String
    //Класс Circle свойства: area = [Radius]()

// 6.1 Для класса Circle добавить вычисляемое свойство, выводящее количество элементов в area
    //6.2 Для класса Circle добавить сабскрипт геттер возвращает запрашиваем элемент сеттер добавляет новый элемент в area
    //6.3 Для класса Circle добавить функцию выводящую количество элементов в area
    //6.4 Создать метод класса, для каждого из 3 классов, который описывает для чего этот класс предназначен.
    //Создать экземпляры классов
    //Показать различные опциональные цепочки используя экземпляры классов, их методы и функции.
    //Перед выводом в консоль результатов избавляемся от опционала.

class Rectangle {
    // MARK: - Public Properties
    var circle: Circle?
    
    // MARK: - Public methods
    func aboutRctangle() {
        print("Описание прямоугольника")
    }
}

class Circle {
    // MARK: - Public Properties
    var area = [Radius]()
    var count: Int {
        area.count
    }
    
    subscript(index: String) -> Radius? {
        get {
            return area.first { $0.radiusName == index }
        }
        set {
            area += [Radius(radiusName: index)]
        }
    }
    // MARK: - Public methods
    func areaCount() {
        print(area.count)
    }
    
    func aboutCircle() {
        print("Описывает окружность")
    }
}

class Radius {
    // MARK: - Public Properties
    let radiusName: String
    
    // MARK: - Initializers
    init(radiusName: String) {
        self.radiusName = radiusName
    }
    
    // MARK: - Public methods
    func aboutRadius() {
        print("Описывает радиус")
    }
}

let rectangle = Rectangle()
let circle = Circle()
let radius = Radius(radiusName: "First Radius")

rectangle.circle = circle
rectangle.circle?.aboutCircle()

rectangle.circle?.area += [radius]
if let radius = rectangle.circle?["First Radius"] {
    print(radius.radiusName)
}

rectangle.circle?["Second radius"] = Radius(radiusName: "Secoond radius")
if let radius = rectangle.circle?["Second radius"] {
    print(radius.radiusName)
}
