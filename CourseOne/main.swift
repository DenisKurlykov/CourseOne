//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 2) Повторить то, что есть в видео.
/*
 Замыкания являются анонимными функциями, которые можно передавать в качестве аргументов другим функциям
 {
    (парамеиры) -> возврвщвемый_тип in
        операторы
 }
 */

var names = ["Максим", "Сергей", "Николай", "Артем", "альберт", "Том"]
let s = names.sorted()

// (String, String) -> Bool

let t1 = names.sorted { (s1: String, s2: String) -> Bool in
    s1 < s2
}
// Сокращаем запись
let t2 = names.sorted {  (s1, s2) -> Bool in
    s1 < s2
}
// Сокращаем запись
let t3 = names.sorted { s1, s2 in s1 < s2 }

// Сортировка в обратном порядке
let t4 = names.sorted { s1, s2 in s2 < s1 }

// Сортировка по длине символов
let t5 = names.sorted { s1, s2 in s1.count < s2.count }
print(t5)

// Автоматические имена аргументов
let p1 = names.sorted { $0 < $1 }
print(p1)

// Захват значений
func makeTranslator(stroka: String) -> (String) -> (String) {
    
    return { (name: String) -> String in return (stroka + " " + name) }
}

var englishWelcom = makeTranslator(stroka: "Привет")
print(englishWelcom("Jack"))

//
var wallet = [10, 50, 100, 100, 5000, 100, 50, 50, 500, 100]
// проверка массива на содержание купюры номинали 100 и вывести в отделный массив
func handle100(_ wallet: [Int]) -> [Int] {
    var returnWallet: [Int] = []
    for banknote in wallet where banknote == 100 {
        returnWallet.append(banknote)
    }
    return returnWallet
}


// проверка массива на купюры равные или больше 1000
func handleMore1000(_ wallet: [Int]) -> [Int] {
    var returnWallet: [Int] = []
    wallet.forEach { banknote in
        if banknote >= 1000 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

// объединение двух функций в одну
func handleWallet(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet: [Int] = []
    wallet.forEach { banknote in
        if closure(banknote) {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}
let result = handleWallet(wallet: wallet) { $0 == 100 }
print(result)

// Сравнение массива с разрешенными купюрами (100 и 500) и вынос их в отдельный массив
let result2 = handleWallet(wallet: wallet) { banknote in // берем элемент из массива wallet и помещаем в замыкание
    for number in Array(arrayLiteral: 100, 500) { // создаем массив с проверяемыми числами и извлекаем число из этого массивва
        if number == banknote { // если извлеченное число равно элементу массива wallet то это true
            return true // по условию замыкания, если выражение true, то элемент массива wallet добавдяем в массив и вовращаем массив
        }
    }
    return false
}

// сокращенная запись
let result3 = handleWallet(wallet: wallet) { [100, 500].contains($0) }
print(result3)
//____________________________________________________________________________________________________



// 3) Написать сортировку массива с помощью замыкания, сначала в одну сторону, затем в другую. Вывести всё в консоль.
let arrayNumbers = [1, 44, 81, 4, 277, 50, 101, 51, 8]
let sortedArray1 = arrayNumbers.sorted { $0 < $1 }
let sortedArray2 = arrayNumbers.sorted { $1 < $0 }
print(sortedArray1)
print(sortedArray2)
print("")

// 4) Создать метод который запрашивает имена друзей, после этого имена положить в массив.
func getNames(names: [String]) -> [String] {
    names
}
let namesFriends = getNames(names: ["Олег", "Александр", "Дмитрий", "Михаил"])
    //Массив отсортировать по количеству букв в имени.
let sortedNames = namesFriends.sorted { $0.count < $1.count }
print(sortedNames)
print("")

// 5) Что такое closure
/*
 Замыкание, это анонимная функция, которую можно передавать в качестве аргумента другим функциям
 Замыкание, это ссылочный тип данных и передается не копированием, а ссылкой на область памяти где хранится
 */

// 6) Написать что такое хвостовое замыкание. Привести пример.
/*
 Это замыкание которое выносится за скобки функции и располагается в конце функции
 */
let result4 = handleWallet(wallet: wallet) { banknote in
    for number in Array(arrayLiteral: 100, 500) {
        if number == banknote {
            return true
        }
    }
    return false
}

// 7) Написать что такое сбегающее замыкание. Привести пример.
// Сбегающее, или @escaping замыкание. Это когда замыкание может выйти за пределы области его определения
var arraysOfClosures: [() -> Int] = []

func addNewClosure(closure: @escaping () -> Int) {
    arraysOfClosures += [closure]
}

// 8) Написать что такое autoclosures. Привести пример.
/*
 Автозамыкание - это замыкание, которое автоматически создается в нутри метода, параметры которого передаются для вычисления в замыкание.
 Есть функция, входные параметры которой при ее вызове передаются как значения, но во внутренней реализации функции используются как самостоятельные замыкания
 */

var arrayOfNames = ["Helga", "Bazil", "Alex"]
func printName(name: @autoclosure () -> String ) {
    print("Hello, \(name())")
}
printName(name: names.remove(at: 0))
print("")

// 9) Создайте переменную типа ()->()
    // В теле кложуры создайте словарь (типы значений на ваш выбор) из 10 элементов и распечатайте пары (ключ: значение)
     // Вызовите ниже вашу кложуру
let dict: () -> () = {
  let dict = [1: "One", 2: "Two", 3: "Three", 4: "For", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine", 10: "Ten"]
    dict.forEach { print($0) }
}
dict()
print("")

// 10) Создать массив из 10 элементов с помощью map каждый элемент умножить на 10
print(arrayNumbers)
let sortedWithMap = arrayNumbers.map { $0 * 10 }
print(sortedWithMap)

// преобразовать в массив String с помощью compactMap,
let sortedWithCompatMap = arrayNumbers.compactMap { int in String(int) }
print(sortedWithCompatMap)

//отфильтровать c помощью .filter, оставить значения с количеством символов больше 2 Вывести результат в консоль.
let sortedWithFilter = sortedWithCompatMap.filter { $0.count > 2 }
print(sortedWithFilter)

// 11) Создать кложуру которая принимает коэффициенты квадратного уравнения и возвращает его корни. для примеры решаем это уравнение: x2 − 8x + 12 = 0
// Я не знаю как сделать это задание
print("")

// 12) Вызовите ниже кложуру и в ее теле вывести произвольный текст. Преобразовать функцию с кложурой к функции с автокложурой. Вызвать и в теле вывести произвольный текст. Описать разницу между двумя вариантами.
func closureExample(saySomsing: () -> ()) {
    saySomsing()
}
print("")

// 13) Написать функцию принимающую два параметра: первый параметр [Int] второй замыкание (_ result: [String] -> ()) переданный массив преобразовать к массиву String и вернуть в замыкании. Вызвать функцию и распечатать полученный результат в консоль. Функцию вызвать 3 раза:
func convertingArrayToString(array: [Int], closure: (_ result: [String]) -> ()) {
    let value = array.compactMap { String($0) }
    closure(value)
}

    // 1) В ПОЛНОМ синтаксисе, c указанием типа замыкания, замыкание внутри скобок функции)
convertingArrayToString(array: [30, 40, 50, 60], closure: {(result: [String]) -> () in print(result)})

    // 2) С неявным возвратом значения (без указания типа), выносом за скобки
convertingArrayToString(array: [30, 40, 50, 50]) { result in print(result) }

    // 3) С сокращенным имени параметра ($0), выносом за скобки
convertingArrayToString(array: [30, 40]) { print($0) }
print("")

// 14) Написать функцию которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами.
let numberDict = [1: "One", 2: "Two", 3: "Three"]

func getDictByKey(array: [Int], dictionary: [Int: String]) {
    for i in array {
        if let a = dictionary[i] {
            print("value key : \(i) value: \(a)")
        }

    }
}

getDictByKey(array: [1, 3], dictionary: numberDict)
print("")

// 15) Написать функцию, которая принимает пустые массивы(один строковый, второй - числовой) и проверяет их: если пустой - то добавить значения и вывести в консоль.
func getEmptyArrays(arrayString: inout [String], arrayInt: inout [Int]) {
    if arrayString.isEmpty {
        arrayString += ["One", "Twoo"]
    }
    if arrayInt.isEmpty {
        arrayInt += [1, 2]
    }
    print(arrayString)
    print(arrayInt)
}
var emptyArrayString: [String] = []
var emptyArrayInt: [Int] = []

getEmptyArrays(arrayString: &emptyArrayString, arrayInt: &emptyArrayInt)
