//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 3 - Создайте пустой словарь responseMessages, для ключа тип числовой, для значения строка.
var responseMessages: [Int: String] = [:]

// 4 - Добавьте в пустой cловарь ключи 500, 404, 403, 200, а значения "OK", "Accsess forbiden", "File not found", "Internal server error"
responseMessages = [500: "OK"]
responseMessages.updateValue("Accsess forbiden", forKey: 404)
responseMessages[403] = "File not found"
responseMessages[200] = "Internal server error"

// 5 - Создайте массив httpResponseCodes c числами 200, 403, 301
let httpResponseCodes = [200, 403, 301]

// 6 - Переберите массив httpResponseCode в цикле чтоб при каждой итерации вы проверяли код массива в словаре responseMessage и если код такой есть то выводить в консоль ключ и значение, если нет писать неизвестный код и выводить код.
// Вариант 1
for code in httpResponseCodes {
    responseMessages[code] != nil ?
    print("Код \(code): \(responseMessages[code] ?? "")") :
    print("Неизвестный код: \(code)")
}


// Вариант 2
for code in httpResponseCodes {
    if let value = responseMessages[code] {
        print("Код \(code): \(value )")
    } else {
        print("Неизвестный код: \(code)")
    }
}

// 7 - Отсортируйте все ключи по порядку 200, 403 и тд.
let sorted = responseMessages.keys.sorted()
print(sorted)

// 8 - Распечатайте в цикле все ключи и значения.
for (key, value) in responseMessages {
    print("Ключ: \(key); Значение: \(value)")
}
print("")
for key in responseMessages.keys {
    print("Ключ: \(key); Значение: \(responseMessages[key] ?? "Описание кода отсутсвует")")
}

// 9 - Создайте словарь с ключами primes, triangular, hexagonal, у каждого ключа значение это массив [2, 13, 15, 7, 11, 3, 5], у второго значения массив [21, 6, 3, 10, 15, 1, 28], у третьего [1, 91, 15, 28, 45, 66, 6]
var shapes = [
    "primes" : [2, 13, 15, 7, 11, 3, 5],
    "triangular" : [21, 6, 3, 10, 15, 1, 28],
    "hexagonal" : [1, 91, 15, 28, 45, 66, 6]
]

// 10 - Отсортируйте содержимое каждого массива по возрастанию.
for value in shapes.keys {
    shapes[value]?.sort()
}
print(shapes)

// 11 - Создать 2 словаря в 1 ключ и значение «a»: «b», у второго «c»: «d» нужно объединить эти 2 словаря не используя +=.
var dictOne = ["a" : "b"]
let dictTwo = ["c" : "d"]

dictOne.merge(zip(dictTwo.keys, dictTwo.values)) { (curent, _) in
    curent
}

// Вариант 1
dictOne.merge(dictTwo) { curent, _ in
    curent
}
print(dictOne)

// Вариант 2
let dictThree = dictTwo.merging(dictOne) { curent, _ in
    curent
}
print(dictThree)

// 12 - Создать переменную а = 1 и вторую b = 2, поменяйте местами значения у 2х переменных 2 мя способами.
var a = 1
var b = 2
// Вариант 1
var c: Int
c = a
a = b
b = c
print(a)
print(b)

// Вариант 2
swap(&a, &b)
print(a)
print(b)

// 13 - Опишите что такое словарь, почему его иногда называют хеш мап, и это class или struct.
/*
 Словарь это неупорядоченная коллекция элементов, парами которой являются ключь и значение.
 Ключь должен быть Hashable значением. Значение, это любое значение типа Any. Все ключи должны
 быть одного значения, тоже относится и к значениям.
 
 Словарь могут называть хеш мап из за того, что это неупорядоченная коллекция и для поиска данных
 по ключу создается индивидуальное хеш значение для ключа и к нему привязывается значение словаря.
 Поиск происходит строго по хеш значению, или другими словами карте поиска. Как пример, оглавление
 в книге, где ключем является само оглавление, хеш значением страница, а значением является содержимое
 на этой странице.
 
 Словарь это структура
 */

// 14 - Напишите какие протоколы комформит словарь и для чего они (только кратко).
/*
DCVarArg -
Collection - используется для доступа к значению по индексу
CustomDebugStringConvertible
CustomReflectable -
CustomStringConvertible -
Decodable - используется для декодирования
Encodable - используется для кодирования
Equatable - используется для сравнения двух объектов ( ==, !=)
ExpressibleByDictionaryLiteral - словарный литерал. Способ отображения словаря [_:_ , _:_]
Hashable - присваеивает ключу хеш значение (необходим для поиска значения словаря)
MLDataValueConvertible -
Sendable -
Sequence - обеспечивает последовательный итерированный доступ к элементам
*/

