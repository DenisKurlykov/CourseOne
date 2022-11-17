//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1. Повторите то, что есть в видео.
class Person {
// MARK: - Public Properties
    let name: String
    
// MARK: - Initializers
    init(name: String) {
        self.name = name
        //print("\(name) Инициализирован и создан в памяти")
    }
    
    deinit {
        //print("\(name) Удален из памятии")
    }
}

var refOne: Person?
var refTwo: Person?
var refTree: Person?

refOne = Person(name: "Jack")

refTwo = refOne // При создании экземпляра класса, создается ссильная ссылка
refTree = refOne

refOne = nil
refTwo = nil
refTree = nil // Только после удаления refTree мы получим в консоль "Jack Удален из памятии"

//_____________Цикл сильных ссылок или перекрестные ссылки_________________

class Hotel {
    // MARK: - Public Properties
    let name: String
    var apartment: Apartment?
    
    // MARK: - Initializers
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) выезжает")
    }
}

class Apartment {
    // MARK: - Public Properties
    let room: String
    weak var hotel: Hotel?
    
    //MARK: - Initializers
    init(room: String) {
        self.room = room
    }
    
    deinit {
        print("Апартаменты \(room) освобождаются")
    }
}
 
var objectHotel: Hotel?
var objectApartment: Apartment?

objectHotel = Hotel(name: "Jack Smith")
objectApartment = Apartment(room: "122")

objectHotel!.apartment = objectApartment
objectApartment!.hotel = objectHotel

objectHotel = nil
objectApartment = nil //При удалении объектов ссылки остаются, т.к. перекрестные ссылки удерживаются друг другом внутри классов (ПРОИСХОДИТ УТЕЧКА ПАМЯТИ). Для того что бы это не происходило необходимо в любом классе ссвойству с перекресной ссылкой присвоить слабую ссылку weak. Слабая ссылка не удерживает объект, А наблюдает за ним.

//__________безхозная ссылка____unowned

class Country {
    let name: String
    var capitalСity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalСity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

let country = Country(name: "Россия", capitalName: "Москва")

// 2 . Описать несколько структур – любой̆ легковой̆ автомобиль и любой̆ грузовик.
    //2.1 Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный̆ объем багажника.
    //2.2 Описать перечисление с возможными действиями с автомобилем: запустить/заглушить, двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    // 2.3 Добавить в структуры метод с одним аргументом типа перечисления, который̆ будет менять свойства структуры в зависимости от действия.
enum ActionWithCar {
    case engineStatus
    case windowStatus
    case loadCargo(Int)
    case unloadCargo(Int)
}

struct Vehicle: Hashable {
    let carModel: String
    let releaseYear: Int
    var trunkVolume: Int
    var filledVolumeTrunk: Int
    var engineRun: Bool
    var windowsOpen: Bool
    
    mutating func action(with avto: ActionWithCar) {
        switch avto {
        case .engineStatus:
            engineRun.toggle()
        case .windowStatus:
            windowsOpen.toggle()
        case .loadCargo(let voluem):
            if voluem <= trunkVolume - filledVolumeTrunk {
                filledVolumeTrunk += voluem
            } else {
                print("В багажнике надостаточно места. Свободно осталось \(trunkVolume - filledVolumeTrunk) литров")
            }
        case .unloadCargo(let voluem):
            if voluem <= filledVolumeTrunk {
                filledVolumeTrunk -= voluem
            } else {
                print("В багажнике груза на \(filledVolumeTrunk) литров. Вы хотите выгрузить \(voluem) литров")
            }
        }
    }
}
    // 2.4 Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var bmw = Vehicle(carModel: "BMW", releaseYear: 2020, trunkVolume: 80, filledVolumeTrunk: 50, engineRun: true, windowsOpen: false)
bmw.action(with: .loadCargo(31))

var mazda = Vehicle(carModel: "CX-5", releaseYear: 2020, trunkVolume: 100, filledVolumeTrunk: 20, engineRun: false, windowsOpen: true)
mazda.action(with: .unloadCargo(10))

    // 2.5 Положить объекты структур в словарь как ключи! названия как строки, например:var dict = [structCar: "structCar"]
var dict: [AnyHashable: String] = [bmw: bmw.carModel, mazda: mazda.carModel]
print(dict)

// 3. Почитать о Capture List (см ссылку ниже) - и описать своими словами и сделать скрин своего примера и объяснения capture-lists-in-swift <- Ссылка
/*
 Capture List - это список захвата. Это актуально в замыканиях поскольку в замыкания передаются по ссылке value type и
 создается сильная ссылка на экземпляр класса. Что бы ослабить ссылку мы создаем область захвата в замыкании и присваиваем свойству слабуя
 ссылку
 */

class People {
    var name = "Человек"
    deinit {
        print("Объект удален")
    }
}
var closure : (() -> Void)
if true {
    let people = People()
    closure = { [unowned people] in
        print(people.name)
    }
    closure()
}
print("Программа завершена")

/*
 В примере выше в зоне видимости условного оператора создается экзкмпляр класса. В замыкании создается сильная ссылка на
 экземпляр класса. Для того что бы после завершения кода ссылка удалилась необходимо в замыкании создать область захвата
 и поместить в нее экземпляр класса со значением unowned. Тем самым мы создаем слабую ссылку.
 */

// 4. Набрать код на белом скрине, понять в чем там проблема и решить эту проблему.
    // В коде ниже используются перекрестные ссылки и при удалении экземплярув они все равно продолжают ссылаться друг на друга внутри класса, т.к. создались сильные ссылки. Для решения этой проблемы необходимо свойствам присвоить слабую ссылку weak.
class Car {
    var driver: ManOne?
    
    deinit {
        print("Машина удажена из памяти")
    }
}

class ManOne {
    weak var myCar: Car?
    
    deinit {
        print("Мужчина удален из памяти")
    }
}

var car: Car? = Car()
var manOne: ManOne? = ManOne()

car?.driver = manOne
manOne?.myCar = car

car = nil
manOne = nil

// 5. У нас есть класс мужчины и его паспорт. Мужчина может родиться и не иметь паспорта, но паспорт выдается конкретному мужчине и не может выдаваться без указания владельца. Чтобы разрешить эту проблему, ссылку на паспорт у мужчины сделаем обычной опциональной, а ссылку на владельца у паспорта – константой. Также добавим паспорту конструктор, чтобы сразу определить его владельца. Таким образом, человек сможет существовать без паспорта, сможет его поменять или выкинуть, но паспорт может быть создан только с конкретным владельцем и никогда не может его сменить. Повторить все, что на черном скрине и решить проблему соблюдая все правила!
class Man {
    var passport: Passport? // По заданию weak и unowned сюда запрещено ставить
    
    deinit {
        print("Мужчина удален из памяти")
    }
}

class Passport {
    unowned let man: Man
    
    init(man: Man) {
        self.man = man
    }
    
    deinit {
        print("Паспорт удален из памяти")
    }
}

var man: Man? = Man()
var passport: Passport? = Passport(man: man!)
man?.passport = passport
passport = nil
man = nil

// 6. Создать класс «Ученик».
    //Добавить свойство класса, в котором будет текущая дата.
    //Добавить метод класса, которое выводит текст этого задания в виде многострочного литерала.
class Student {
    let curentDate: String
    
    init(curentDate: String) {
        self.curentDate = curentDate
    }
    
    func taskText() {
        print(/*
               Создать класс «Ученик».
               Добавить свойство класса, в котором будет текущая дата.
               Добавить метод класса, которое выводит текст этого задания в виде многострочного литерала.
               */)
    }
}


// 7. Создать класс «FlowСontrol». Добавить в класс 5 функций, каждая из которых будет использовать отдельный оператор управления потоком. (В одной массив прогоняется через цикл for, в другой через while, в третьей через repeat while) и т.д. Каждая функция возвращает результат своей работы. Создать enum c кейсами под каждую функцию. Создать экземпляр класса и продемонстрировать работу каждой функции используя значения перечисления. Функции напрямую управления потоком должны быть недоступными для вызова вне класса.

class FlowControl {

    func flowControll(flowType: FlowFunctions, array: [String], number: Int, times: Int, parameter: Int, method: ActionWithCar) -> Any {
        switch flowType {
        case .forIn: return forInCycle(array: array )
        case .ifElse: return ifElseFlow(number: number )
        case .repeatWhile: return repeatWhileCycle(times: times )
        case .repeatt: return whileCycle(parameter: parameter)
        case .switchflow: return switchFlow(method: method)
        }
    }

    private func forInCycle(array: [String]) -> String {
        var result = String()
        for string in array {
            result += string
        }
        return result
    }

    private func whileCycle(parameter: Int) -> Int {
        var parameter = parameter
        while parameter < 10 {
            parameter += 1
        }
        return parameter
    }

    private func repeatWhileCycle(times: Int) -> String {
        var result = ""
        var counter = 0
        repeat {
            result += "a"
            counter += 1
        } while counter != times
        return result
    }

    private func ifElseFlow(number: Int) -> Int {
        return number % 2 == 0 ? number : number * 2
    }

    private func switchFlow(method: ActionWithCar) -> String {
        switch method {
        case .engineStatus: return "Изменение статуса двигателя"
        default: return "Иное"
        }
    }
}

enum FlowFunctions {
    case forIn
    case repeatt
    case repeatWhile
    case ifElse
    case switchflow
}

let flowControlelr = FlowControl()

var paramter: Int? = nil

//print(flowControlelr.flowControll(flowType: .forIn, array: ["String", "Array"], number: , times: nil, parameter: &paramter, method: nil))
print(flowControlelr.flowControll(flowType: .repeatWhile, array: ["String", "Array"], number: 50, times: 20, parameter: 56, method: .engineStatus))

