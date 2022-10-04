//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) повторите то, что есть в видео.
var data: String?
data = "3.10.2022"

//Проверка на nil, но полученное значение в любом случае будет имет тип Optional
if data != nil {
    print("Текущая дата \(data!)")
} else {
    print("Текущая дата не была получена")
}

//Optional bunding созданному свойству присваивается не опциональный тип
if let value = data {
    print("Текущая дата \(value)")
} else {
    print("Текущая дата не была получена")
}

// Приведение строки к типу Int
let age = "20"

if Int(age) != nil {
    let ageInt = Int(age)!
    print("Ваш возраст \(ageInt)")
} else {
    print("Введенное значение не соответсвует заданному типу")
}

// 3) Создать 5 констант со СТРОКАМИ которые содержат цифры и посчитайте их используя новые инструменты.
let valueOne = "10"
let valueTwo = "20"
let valueThree = "30"
let valueFor = "40"
let valueFive = "50"

let valuesArray = [valueOne, valueTwo, valueThree, valueFor, valueFive]
var sum = 0

for value in valuesArray {
    if Int(value) != nil {
        let number = Int(value)!
        sum += number
    }
}
print(sum)

// 4) Создать 3 константы со значением nil.
/*
Язык Swift является безопасным и не позволяет создать свойство со значением nil, т.к. при обращении к nil
программа будет "падать" и выдавать фатальную ошибку. Мы можем создать опциональное совйсто без инициализации.
В данном случае мы предполагаем, что созданное свойство может принимать nil.
 */
let value: Int?

// 5) Создать 5 опциональных типов констант и установите им значения.
let name: String? = "Denis"
let surname: String? = "Kurlykov"
let telNumber: Int? = 89198000000
let array: [String]? = ["10", "23", "13"]
let dict: [String: Int]? = ["OK": 500, "Accsess forbiden": 404, "File not found": 403]

// 6) Перечислите способы извлечения опционала с примерами (guard не использовать)
   // Принудительное извлечение опционала (без проверки на nil применять нельзя!!!)
let one: Int? = 5
if one != nil {
    print(one!) //проверили на nil и убедивщись, что значение есть, принудительно извлекли
}
   // Так делать нельзя !!!.
let int = Int("42")!
print(int)

   // Прнудительное связывание Optional Binding. Опциональное свойство связывается с вновь созданым свойством. Так как значение свойства не может иметь nil, то в случае связывания мы выполняем код, если нет то можем прописать ветку else и перейти в нее.
if let two = one {
    print(two)
} else {
    print("Нет значения")
}

   // ОбЪединение с nil, Nil-Coalescing Operator. Используется операто ??
var contactName: String?
//namePhone = "Denis"
print(namePhone ?? "Значение не получено") //  В случае получения nil, после оператора ?? прописывапется значение по умолчанию

// 7) Создайте опциональный массив Int’ов с значениями от 1 до Преобразуйте в новый массив добавив к каждому элементу букву «a». Выведите получившийся массив
let arrayNumbers: [Int]? = Array(1...10)
var arrayStrings: [String] = []

if let arrayNumbersNonOpt = arrayNumbers {
    for number in arrayNumbersNonOpt {
        arrayStrings += [String(number) + "a"]
    }
}
    
// 8) Дан массив number: [Int]? = [5, 3, 6, 8, 1, 2, 4]. Найти сумму элементов массива и вывести в консоль. Для вычисления суммы использовать функцию высшего порядка.
let number: [Int]? = [5, 3, 6, 8, 1, 2, 4]
var sumNumber = 0

if let numberNonOpt = number {
  sumNumber = numberNonOpt.reduce(0, +)
}
print(sumNumber)

// 9) Создайте несколько опциональных значений. С помощью «оператора объединения с nil» извлеките значение.
var myAge: Int?
myAge = 42
print("Мой возраст \(myAge ?? 0)")

var namePhone: String?
namePhone = "Denis"
print(namePhone ?? "Значение не получено")

// 10) Дан массив numbers: [String]? = ["5", "3", "шесть"]
// Если количество элементов в массиве больше 2 тогда преобразовать данный массив в массив [Int] и вывести в консоль
let numbers: [String]? = ["5", "3", "шесть"]
var numbersInt: [Int] = []

if let numbersNonOpt = numbers, numbersNonOpt.count > 2 {
        numbersInt = numbersNonOpt.compactMap { Int($0) }
    }
print(numbersInt)


// 11) Распечатайте свое имя в цикле for.
let myName = "Denis"
for character in myName {
    print(character)
}

// 12) Создайте массив с возрастом всех членов вашей семьи и распечатайте в консоли через цикл for.
let ageFamilyMambers = [16, 42, 44, 72]
for value in ageFamilyMambers {
    print(value)
}

