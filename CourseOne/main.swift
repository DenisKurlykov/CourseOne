//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) Повторить то, что есть в видео.
struct Observer {
    var name: String {
        willSet { // значение будет получено
           print("Внимание значение хочет изменится на = \(newValue)")
        }
        
        didSet { // значение было получено
            print("didset = \(oldValue)")
            if name != "" {
                name = name.capitalized
            }
        }
    }
}

var observer = Observer(name: "Jack")
observer.name // срабатывает geter
observer.name = "ivan" // срабатывает setter
print(observer.name)

struct ComputerProperty {
    var firstName: String {
        didSet {
            if firstName != "" {
                firstName = firstName.capitalized
            }
        }
    }
    var lastName: String
    var fullName: String  {
            ("\(firstName)  \(lastName)")
    }
}

var compProp = ComputerProperty(firstName: "Ivan", lastName: "Ivanov")
print(compProp.fullName)
compProp.firstName = "Piter"

// 2) Создать класс "Students", добавить ему property: dateOfBirth, skills. Для тренировки. Создавайте свои структуры с разными видами свойств: сохраняемые/не сохраняемые, вычисляемые, свойства типа и т.д.
class Student {
    let firstName: String
    let lastName: String
    let dateOfBirth: Int
    let skills: String
    var fullName: String  {
        ("\(firstName) \(lastName)")
    }
    
    init(firstName: String, lastName: String, dateOfBirth: Int, skills: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.skills = skills
    }
}

struct Student1 {
    static let curentYear = 2022
    let firstName: String
    let lastName: String
    let dateOfBirth: Int
    let skills: String
    var fullName: String  {
        ("\(firstName) \(lastName)")
    }
    var age: Int {
        Student1.curentYear - dateOfBirth
    }
}

// 3) Написать структуру "CreateTriangle",с двумя свойствами - угол A, угол C. И создать 2 вычисляемых свойства - те же угол А, угол С. И если мы записываем значения в эти углы - результатом должно быть значение третьего угла. Для простоты можно взять прямоугольный треугольник, сумма углов которого равна 180 градусов.
struct CreateTriangle {
    let cornerA: Int
    let cornerC: Int
    var cornerB: Int {
        180 - cornerA - cornerC
    }
}

let triangle = CreateTriangle(cornerA: 90, cornerC: 30)
print(triangle.cornerB)

// 4) Создать структуру "Резюме", у которой есть такие свойства:
    //- Фамилия,
    //- Имя.
    //- Должность,
    //- Опыт,
    //- Контактные данные(телефон, емейл),
    //- О себе(можно записать какие-то пару предложений
    //на выбор)
struct Resume {
    let firstName: String
    let lastName: String
    let phoneNumber: Int
    let post: String
    let experience: Int
}

let resume = Resume(
    firstName: "Ivan",
    lastName: "Ivanov",
    phoneNumber: 89270000000,
    post: "Программист",
    experience: 1
)

// 5) Задание на закрепление предыдущих тем: Создать журнал, что б можно было писать имя, фамилию и оценку Поставить ограничения: имя и фамилия не выше 15 символов каждое. И оценка не выше 5. Если везде значения превышаться выдавать об этом Сообщения в консоль.

struct Journal {
    static let maxLength = 15
    static let maxEstimation = 5
    static let minEstimation = 1
    var firstName: String {
        didSet {
            if firstName.count > Journal.maxLength {
                print("Максимальное количество символов \(Journal.maxLength)")
            }
        }
    }
    var lastName: String {
        didSet {
            if lastName.count > Journal.maxLength {
                print("Максимальное количество символов \(Journal.maxLength)")
            }
        }
    }
    var estimation: Int {
        didSet {
            if estimation < Journal.minEstimation && estimation > Journal.maxLength {
                print("Минимальная оценка = \(Journal.minEstimation). Максимальная оценка \(Journal.maxEstimation)")
            }
        }
    }
}

// // 6) Написать класс, в котором есть 4 функции: -пустая, которая просто выводит сообщение через print,
                                                 //-которая принимаете параметры и выводит их в консоль,
                                                 //-которая принимает и возвращает параметры.
                                                 //-которая принимает замыкание и распечатывает результаты в консоль

class FourMethods {
    func empty() {
        print(" Пустая функция")
    }
    
    func withParametrs( name: String) {
        print("Функция принимает и выводит в консоль параметр \(name)")
    }
    
    func returnParametrs( name: String) -> String {
        print("Функция принимает и возвращает параметр \(name)")
        return name
    }
    func printClosure(closure: () -> String) {
        print(closure())
    }
}

let fourMethods = FourMethods()
fourMethods.empty()
fourMethods.withParametrs(name: "Ivan")
let returnValue = fourMethods.returnParametrs(name: "Piter")
fourMethods.printClosure { "Замыкание" }
