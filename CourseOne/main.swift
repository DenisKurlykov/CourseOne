//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) Повторить то что было в уроке.
/*
 class ИмяКласса {
    свойства класса
    методы класса
 }
 */

class ParentsClass {
    var array: [String] = []
    var name = "" // Свойство класса
    var age = 20
}

class Son: ParentsClass { // Унаследовали клас Son от ParentsClass. При наследовании нам доступны все свойства и метолы родительского класса
    func method(name: String) { // Метод класса
        print("Hello \(name)")
    }
}

let sonClass = Son() // Экземпляр класса (Это сссылка на участок памяти где хранится объект sonClass)
sonClass.name // Свойство экземпляра класса
sonClass.method(name: "Ivan") // Метод экземпляра класса

// Инициализаторы
class Car1 {
    let name: String
    let maxSpeed: Int
    
    init(name: String, maxSpeed: Int) { // В параметрах инициализатора создаются свойства с типами данных которыми они будут инициализированны
        self.name = name // Инициализируем (присваиваем) свойству класса значение параметра инициализатора. self необходим для того, чтобы компилятор понял, что мы обращаемся к свойству класса, а не к параметру init. self значит собственный.
        self.maxSpeed = maxSpeed
    }
}

let myCar = Car1(name: "BMW", maxSpeed: 320)

// Структура.
// Структура - это тип значение (Value type). При передачи экземпляра структуры от одного свойства в другое происходит его копирование
struct PersonName {
    var name: String
    let age: Int
}

var olegMuhin = PersonName(name: "Oleg", age: 20)
let olegLapin = olegMuhin
olegMuhin.name = "Ivan"
print("olegMuhin \(olegMuhin)")
print("olegLapin \(olegLapin)")

// Структура может изменять значения свойств в том случае если экземпляр структуры хранится в переменной, и свойство структуры так же является переменной

// 2) Создать класс родитель и 2 класса наследника.
class Car {
    let model: String
    let color = ""
    
    init(model: String) {
        self.model = model
    }
}

class EngineType: Car {
    let enginePower: Int
    
    init(enginePower: Int, model: String) {
        self.enginePower = enginePower
        super.init(model: model)
    }
}

class Configuration: Car {
    let colorInterior: String
    let typeTrim: String
    
    init(colorInterior: String, typeTrim: String, model: String) {
        self.colorInterior = colorInterior
        self.typeTrim = typeTrim
        super.init(model: model)
    }
}

// 3) Написать программу, в которой создать класс *House* в нем несколько свойств - *width*, *height* и несколько методов - *create*(выводит произведение свойств),*destroy*(отображает в принте что дом уничтожен).
class House {
    let wight: Int
    let height: Int
    
    init(wight: Int, height: Int) {
        self.wight = wight
        self.height = height
    }
    
    func create() {
        print(wight * height)
    }
    
    func destroy() {
        print("Этот дом уничтожен")
    }
}

let house = House(wight: 8, height: 10)
house.create()
house.destroy()

// 4) Создайте класс с методом, который сортирует массив учеников.
class Student {
    var students: [String]
    
    init(students: [String]) {
        self.students = students
    }
    
    func sorted() {
        students.sort()
        print(students)
    }
}

let students = Student(students: ["Петров", "Агафонов", "Иванов"])
students.sorted()

// 5) Написать свою структуру и класс, пояснить в комментариях - чем отличаются структуры от классов.
class Post {
    var title: String
    var body: String
    var author: String
    
    init(title: String, body: String, author: String) {
        self.title = title
        self.body = body
        self.author = author
    }
}

struct StructPost {
    var title: String
    var body: String
    var author: String
}
/*
 Класс - это referense type (ссылочный тип). При создании экземпляра класса, создвется ссылка на ячейку памяти где хранится обЪект. Структура - это value tape. При создании экземпляра структуры происходит копирование. При изменении значений в копии оригинал остается не изменным. В классае при неявном объявлении свойства класса необходимо проипасать инициализатор для свойства. В структуре инициализатор уже есть под капотом
 */


// 6) Обьяснить в коментариях есть ли у классов множественное наследование, и пояснить что это.
// Swift не поддерживает множественное наследование. Множественное наследование это наследование отдно класса одновременно от нескольких родительских классов.
    
// 7) Обьяснить может ли структуры наследоваться.
// Структура не наследуется

// 8) Выписать по 1 пример из документации, 1 из Усова, 1 из заметок профи. Примеры на свое усмотрение.
    // Swift.org
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Усов
// тип шахматной фигуры
enum ChessmanType {
    case king, castle, bishop, pawn, knight, queen
}
// цвета фигур
enum ChessmanColor {
    case black, white
}


class Chessman {
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
    }
}
var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")

struct ChessPlayer {
    var name: String
    var victories: UInt = 0
}

// Заметки профи
struct Repository {
    let identifier: Int
    let name: String
    var description: String?
}

class Dog {
    var name = ""
    var dogYearAge = 0
}
