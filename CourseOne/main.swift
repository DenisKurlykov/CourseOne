//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 3 - Создать массив из чисел, числа это купюры в долларах посчитать количество денег и вывести в консоль.
let banknotes = [10, 25, 100, 5, 1]
var amountOfMoney = 0
banknotes.forEach {banknote in
    amountOfMoney += banknote
}
print("Сумма в $ составила \(amountOfMoney)")
print("")

//4.1 - Создать массив "дни в месяцах" используя цикл for вывести колличество дней в каждом мес.
let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for days in daysInMonths {
    print(days)
}
print("")

// 4.2 - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней.
let namesOfMonths = [
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь"
]
print("")

var enumiration = 0
for days in daysInMonths {
    print("\(namesOfMonths[enumiration]) - \(days)")
    enumiration += 1
}
print("")

// 4.3 - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней).
let daysAndMonths = [
    ("Январь", 31),
    ("Февраль", 28),
    ("Март", 31),
    ("Апрель", 30),
    ("Май", 31),
    ("Июнь", 30),
    ("Июль", 31),
    ("Август", 31),
    ("Сентябрь", 30),
    ("Октябрь", 31),
    ("Ноябрь", 30),
    ("Декабрь", 31)
]
print("")

for day in daysAndMonths {
    print("\(day.0) - \(day.1)")
}
print("")

// 4.4 - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется).
for day in daysAndMonths.reversed() {
    print("\(day.0) - \(day.1)")
}
print("")

// 5 - Создайте массив из 30 повторяющихся элементов.(не руками)
let autoCreating = Array(repeating: 25, count: 30)
print(autoCreating)
print("")

// 6 - Создайте массив из разных типов д. (String, Int, Bool и т.д.)
let someArray: [Any] = ["Привет", 25, "Мир", true, false, 15.234]

// 7 - Сформируйте новый массив состоящий только из Sting из предыдущего массива.
var arrayTypeString: [String] = []

for value in someArray {
    if let str = value as? String {
        arrayTypeString.append(str)
    }
}
print(arrayTypeString)

// 8 - Преобразуйте 2D массив (двумерный) в одномерный [["Hello", "Hi"], ["Привет"], [".", "Как","твои"], ["дела?"]].
let twoDimensionalArray = [["Hello", "Hi"], ["Привет"], [".", "Как","твои"], ["дела?"]]
let newArray = Array(twoDimensionalArray.joined())
print(newArray)

// 9 - проверить на пустоту преобразованный массив и вывести в консоль содержит ли он элемент "Привет".
if newArray.isEmpty {
    print("Массив пустой")
} else {
    for value in newArray {
        if value == "Привет" {
            print(value)
        }
    }
}

// 10 - Создайте массив типа Int из 10 элементов используя Range новый массив с элементами под индексами от 3 до 8.
var array = Array(1...10)
let newRangeArray = array[3...8]
print(newRangeArray)

// 11 - Создайте массив типа Int из 10 элементов используя Slice новый массив с элементами под индексами от 3 до 8.


// 12 - Создайте массив типа String из 8 элементов с помощью sorted() и sort() отсортируйте и в коментах напишите в чем разница этих двух методов.
var str = ["Привет", "Мир", "Swift", "XCode", "Подшипник"]
let sortedStr = str.sorted()
print(sortedStr)

str.sort()
print(str)
// Метод sorted() создает отсортированную копию массива, а метод sort() сортирует и изменяет массив к которому применяется метод sort(). Если для нас вежен порядок массива к которому мы обращаемся, то мы должны применить sorted().


// 13 - Дан массив [22, 41, 23, 80, 33, 83, 56, 42, 11, 98, 120, 6, 84, 1] выведите максимальный и минимальный элемент. выведите первый и последний элемент. Удалите первый и последний элемент. Опишите в чем разница dropFirst() dropLast() от removeFirst() и removeLast().
var intArray = [22, 41, 23, 80, 33, 83, 56, 42, 11, 98, 120, 6, 84, 1]

print("Максимальное число массива \(intArray.max() ?? 0)")
print("Минимальное число массива \(intArray.min() ?? 0)")

print("Первый элемент массива \(intArray.first ?? 0)")
print("Последний элемент массива \(intArray.last ?? 0)")

// Метод dropFirst() и dropLast() возвращают копию массива без количества элементов указанных в () при методе dropFirst() создается коппия массива без n первых элементов массива и n последних при использовании dropLast()
print(intArray.dropFirst(2))
print(intArray.dropLast(6))

// Метод removeFirst() и removeLast() изменяют существующий массив и возврвщвют удаленный элемент.
print(intArray.removeFirst())
print(intArray.removeLast())

