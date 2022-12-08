//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 2) Проработать код из видео.
protocol RouterDelegate {
    var nameID: [String] { get set }
    func saveName(name: String, text: String)
}

protocol UserProtocol {
    var name: String { get set }
    var age: Int {get set }
    
    var delegate: RouterDelegate? { get set }
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}

class Router: RouterDelegate {
    var nameID: [String] = []
    func saveName(name: String, text: String) {
        nameID.append(name)
        nameID.append(text)
    }
    
}

class User: UserProtocol {
    var name: String
    var age: Int
    
    var delegate: RouterDelegate?
    
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
    
    func sendMail(name: String, text: String ) -> Bool {
        delegate?.saveName(name: name, text: text)
        return true
    }
}

let routerDelegate = Router()
let user = User(name: "Jon", age: 23, delegate: routerDelegate)
user.sendMail(name: "Sergey", text: "Hello Sergey")
user.sendMail(name: "Mama", text: "Mama i'm ok")

routerDelegate.nameID

// 3) Создать протокол BatmanProtocol у которого свойство name.
protocol BatmanProtocol {
    var name: String { get }
}

// 4) Добавить дефолтную реализацию протоколу BatmanProtocol через экстеншен добавить свое имя.
extension BatmanProtocol {
    var name: String { "Denis" }
}

// 5) Создать класс Batman подписатся на протокол BatmanProtocol, создать обьект класса и распечатать name.
class Batman: BatmanProtocol {
}

let batman = Batman()
print(batman.name)

// 6) Создать протокол с 2 мя методами 1 из них должен быть опциональным (optional).

@objc protocol Protocol {
    func run()
    @objc optional func shot()
}

// 7) Создать протокол с ассоциативным типом и создать 2 разных класса которые реализуют этот протокол. В 1 м классе 1 тип в другом другой тип.
protocol Multiplier {
    associatedtype Number
    func multiplier(a: Number, b: Number) -> Number
}

class IntMultiplier: Multiplier {
    typealias Number = Int
    
    func multiplier(a: Number, b: Number) -> Number {
        a * b
    }
}

let multiplier = IntMultiplier()
multiplier.multiplier(a: 5, b: 5)

// 8) Создать протокол GoToShopDelegate с методом run.
protocol GoToShopDelegate {
    func goToShop()
}

// 9) Создать класс мама и класс сын. Использовать паттерн delegate что б мама отправляла сына за хлебом.
class Mother {
    var son: GoToShopDelegate?
    
    func visitToMother(son: GoToShopDelegate) {
        self.son = son
        son.goToShop()
    }
}

class Son: GoToShopDelegate {
    func goToShop() {
       print("Меня отправили за хлебом ")
    }
}

let son = Son()
let mother = Mother()
mother.visitToMother(son: son)

