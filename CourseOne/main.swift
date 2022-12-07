//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) Повторить код из урока.
protocol OneProtocol {
    var name: String { get set }
    var age: String { get set }
    // mutating func hello(text: String) мутирующая потому что протокол может использоваться в стркуктрурах.
}

struct Parents: OneProtocol {
    var name: String
    var age: String
}

struct Kids: OneProtocol {
    var name: String
    var age: String
}

struct Cat: OneProtocol {
    var name: String
    var age: String
}

var parentsFather = Parents(name: "Jack", age: "28")
var parentsMother = Parents(name: "Jina", age: "25")
var kids = Kids(name: "Masha", age: "5")
var cat = Cat(name: "Cat", age: "3")

//var array: [Any] = [parentsFather, parentsMother, kids, cat]
//
//for value in array {
//    if let parent = value as? Parents {
//        print(parent.name)
//    } else if let kid = value as? Kids {
//        print(kid.name)
//    }
//}

let array: [OneProtocol] = [parentsFather, parentsMother, kids, cat]

func sortFamily(array: [OneProtocol]) {
    for value in array {
        print("\(value.name) - age = \(value.age)")
    }
}

sortFamily(array: array)

// 2) Зайти в почитать документацию на тему protocol.


// 3) Посмотреть видео о copy on write (спрашивают на собесе!) - https://www.youtube.com/watch?v=66g_pD3s7TY.


// 4) Реализовать структуру IOSCollection и создать в ней copy on write как в уроке - https://youtu.be/QsoqHGgX2rE


// 5) Обьяснить в коментах кратко что такое: a) Copy on write. #) isKnownUniquelyReferenced(). в) strong, weak, unowned ссылки.
/*
 a) Copy on write. Работает под капотом с собственными структурами (массивы, длинные строки). Создавая копию экземпляра, копии и экземпляру присваивается одна и таже ссылка на обЪект, до тех пор пока у оригинала или копии не изменятся значения. Как только они поменяются ссылки на ячейку памяти у оригинала и копии будут разные
 isKnownUniquelyReferenced() метод который возвращает логическое значение и следит за тем есть ли у объекта хоть одна сильная ссылка. Если есть, возвращает true, если нет или обЪект nil возвращает false.
 
 в) strong, weak, unowned ссылки. strong ссылка создается и удаляется автоматически.
    weak и unowned ссылки необходимо создавать вручную во избежание утечки памяти при перекрестных ссылках и
    когда ссылка передается в замыкание. weak используется при работе с опционалами, а unowned c не опционалами.
 */

// 6) Создать протокол переключатель с окончанием «able» как принято в свифт сообществе.
// 7) В протокол перключатель добавить метод «переключать».(Все названия только на английском!).
// 8) Создать enum Switcher который конформит (conform) протокол переключатель и у которого 2 кейса off, on.
protocol Switchable {
    mutating func swith()
}

enum Switcher: Switchable {
    case on
    case off
    mutating func swith() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
// 9) Создать обьект с выбраным кейсом, далее вызвать у обьекта метод переключения который меняет off на on например.
var light = Switcher.off
light.swith()

// 10) Создать протокол Movable c методом run, протокол Shootable с методом shoot.
protocol Movable {
    func run()
}

protocol Shootable {
    func shoot()
}

// 11) Создать протокол HumanProtokol у которого есть свойство name, и который комформит протоколы Movable и Shootable.
protocol HumanProtokol: Movable, Shootable {
    var name: String { get set }
}

// 12) Создать класс Human, подписаться на протокол HumanProtocol и реализовать его, в методы добавить принты.
class Human: HumanProtokol {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func run() {
        print("\(name) бежит на 30км")
    }
    
    func shoot() {
        print("\(name) стреляет с расстояния 50м")
    }
}

let sportsmen = Human(name: "Ivan")
sportsmen.run()
sportsmen.shoot()

// 13) Создать два класса и одну структуру, от каждого по одному экземпляру, и все это сложить в 1 массив. Внимание, наследование и any и AnyObject не использовать
protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Racer {
    var speed: Double { get }
}

struct Penguin: Bird {
    var name: String
    var canFly = false
}

class Motorcycle {
    var name: String
    var speed = 200.0
    
    init(name: String) {
        self.name = name
    }
}

extension Penguin: Racer {
    var speed: Double {
        42
    }
}

extension Motorcycle: Racer {}

let penguin = Penguin(name: "Albert")
let moto = Motorcycle(name: "Ivan")

let arrayProtocol: [Racer] = [penguin, moto]


//__________ Пимер copy on write
func address (of object: UnsafeRawPointer) -> String {
    let addr = Int(bitPattern: object)
    return String(format: "%p", addr)
}

func address(off value: AnyObject) -> String {
    return "\(Unmanaged.passUnretained(value).toOpaque())"
}

class SomeClass {
    var checkString: String
    init(_ checkString: String) {
        self.checkString = checkString
    }
}

// Пример копирования классов
var obj1 = SomeClass("One")
var obj2 = obj1

address(off: obj1)
address(off: obj2)

obj1.checkString = "two"
obj2.checkString

address(off: obj1)
address(off: obj2)

// Пример копирования структур
var number1 = 12345667
var number2 = number1

address(of: &number1)
address(of: &number2)

// Копирование массивов
var arr1 = [1, 2, 3, 4, 5]
var arr2 = arr1

address(of: &arr1)
address(of: &arr2)

arr1[0] = 33
address(of: &arr1)
address(of: &arr2)

// Копирование строк. Если строка короткая то ссылки будут на разные участки памяти, а если длинная, то на один участок памяти. Сработает copy on write
var oneString = "Some text Some text Some text Some text Some text Some text Some text"
var twoString = oneString
address(of: &oneString)
address(of: &twoString)

// Пример работы со своей структурой
struct SomeStruct {
    var checkString: String
}

var five = SomeStruct(checkString: "five")
var six = five
// Для кастомных структур механизм COW не работает.
address(of: &five)
address(of: &six)

// Пример реализации COW для кастомных структур
struct Identifier {
    var id = 1
}
// Класс для хранения ссылки
//class Ref<T> {
//    var value: T
//
//    init(value: T) {
//        self.value = value
//    }
//}
//
//struct Container<T> {
//    var ref = Ref<T>
//
//    init(value: T) {
//        self.ref = Ref(value: value)
//    }
//
//    var value: T {
//        get {
//            ref.value
//        }
//        set {
//            guard (isKnownUniquelyReferenced(&ref)) else {
//                ref = Ref(value: newValue)
//                return
//            }
//            ref.value = newValue
//        }
//    }
//}

class Job {
    var person: Person?
    
    deinit {
        print("Job удален из памяти")
    }
}

class Person {
    weak var job: Job?
    
    deinit {
        print("Person удален из памяти")
    }
}
var tim: Person? = Person()
var apple: Job? = Job()

tim?.job = apple
apple?.person = tim

tim = nil
apple = nil

