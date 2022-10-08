//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) Повторите то, что было в видео.
/*
 func имя_функции(принимаемые парамеиры) -> возвращаемые парамеиры {
    ...тело функции...
 }
 */

func sayFunc() {
    print("Hi")
}
print(sayFunc())

var arrayJurnal: [String] = []
func addStudent(name: String, proffesional: String) {
    arrayJurnal.append(name)
    arrayJurnal.append(proffesional)
    print(arrayJurnal)
}

addStudent(name: "Иван", proffesional: "Историк")
addStudent(name: "Никита", proffesional: "Журналист")
addStudent(name: "Роман", proffesional: "Физик")

func calculate(numberOne: Int, numberTwo: Int) -> Int {
    numberOne + numberTwo
}
let sum = calculate(numberOne: 5, numberTwo: 5)
print(sum)

var money = [1, 2, 25, 50, 100, 500, 1000]
func calculateMoney(inArray: [Int]) -> Int {
    inArray.reduce(0, +)
}
let sumMoney = calculateMoney(inArray: money)
print(sumMoney)

//func generalFunc(answer: Bool) -> () -> String {
//    func sayYes() -> String {
//        return "Yes"
//    }
//    func sayNo() -> String {
//        return "No"
//    }
//    return answer ? sayYes() : sayNo()
//}


// 3) Создать 4 функции:
// - Которая ничего не принимает и ничего не возвращает.
func greting() {
    print("Привет")
}

// – Принимает параметры но не возвращает.
func greting(textGreting: String) {
    print(textGreting)
}

// - Принимает параметры и возвращает.
func greting(textGreting: String) -> String {
    textGreting
}

// - Не принимает параметры но возвращает тюпл из 3х параметров.
func tuple () -> (name: String, password: Int, valid: Bool) {
    (name: "Ivan", password: 123456, valid: true)
}
let a = tuple()
print(a)

// 4) Создать журнал для учителя, который будет принимать имя студента , профессию и оценку и записывает это все в массив. И внесите 10 студентов туда и распечатаете через цикл for
var jornal: [String] = []
func addStudet(name: String, profissional: String, estimation: String) {
    jornal.append(name)
    jornal.append(profissional)
    jornal.append(estimation)
}

addStudet(name: "Никита", profissional: "Программист", estimation: "5")
addStudet(name: "Матвей", profissional: "Историк", estimation: "5")
addStudet(name: "Марина", profissional: "Социология", estimation: "4")
addStudet(name: "Андрей", profissional: "Строитель", estimation: "3")
addStudet(name: "Елена", profissional: "Физик", estimation: "5")

for value in jornal {
    print(value)
}

// 5) Создать функцию которая принимает имя и фамилию, потом положить это в массив и отсортировать и вывести результат в консоль.
var names: [String: String] = [:]

func addName(name: String, surname: String) {
    names.updateValue(surname, forKey: name)
}
addName(name: "Иван", surname: "Иванов")
addName(name: "Данила", surname: "Петров")
addName(name: "Полина", surname: "Гагарина")

print(names.sorted(by: <))

// 6) Создать функцию которая принимает параметры и вычисляет площадь круга.
func areaOfCircle(radius: Double) -> Double {
      3.14 * (radius * 2)
}

// 7) Создайте пустой массив кошелек, создайте функцию которая принимает массив в параметрах и в теле функции добавляет в этот массив значение 100. Далее вызовите массив и потом распечатайте значение массива.
var wallet: [Int] = []

func addCoin(coin: [Int]) {
    wallet.append(100)
}
addCoin(coin: wallet)
print(wallet)

// 8) Написать функцию в которой можно передавать в параметры каждый раз разное количество Int например иногда 1,5,9 а следующий раз 5,10, 11, 20, 50 функция все это посчитает и вернет сумму этих чисел.
func sumNumbers(arrayNumbers: [Int]) -> Int {
    arrayNumbers.reduce(0, +)
}
let sumNumbersOfArray = sumNumbers(arrayNumbers: [1, 2, 5, 10, 45])
print(sumNumbersOfArray)


// 9) Написать любую функцию которая вернет throws.
func divide(numberOne: Int, numberTwo: Int) throws -> Int {
    guard numberTwo != 0 else { throw NSError(domain: "На ноль делить нельзя", code: 1) }
    return numberOne / numberTwo
}

do {
    let result = try divide(numberOne: 3, numberTwo: 0)
} catch {
    print(error.localizedDescription)
}
