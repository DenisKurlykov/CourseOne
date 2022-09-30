//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 3 - Создайте 1 пустой тюпл.
var tuple: (Int, String)
/*
Как таковой нельзя создать пустой кортеж. Кортеж не преднозначен для долгоого хранения данных.
 В виде котрежа мы получаем даннные которые обрабатываем и передаем дальше.
*/

// 4 - Создайте тюпл где первое значение 1, второе элемент массива “threee”. Распечатайте все значения.
let array = ["One", "Twoo", "Three"]
tuple.0 = 1
tuple.1 = array[2]
print(tuple)

// 5 - Создайте тюпл с Int, Bool, String значениями. Распечатайте все значения.
let tupleTwoo = (200, true, "Hello")

// 6 - Создайте тюпл где первое значение строка а второе предыдущий тюпл. Распечатайте все значения.
let tupleThree = ("Hello", tupleTwoo)
print(tupleThree)

// 7 - Создайте тюпл из значений “Apple”, «IBM»
var tupleFour = ("Apple", "IBM")

// 8 - Добавьте в предыдущий тюпл через = “Google”
//Кортеж не коллекция и не массив. Мы не можем не довалять данные не удалять данные

// 9 - Удалите “IBM”


// 10 - Если не получилось сделать 8 и 9 пункт ! создайте тюпл внутри которого словарь и повторите упражнение 7, 8, 9 но уже со словарем внутри тюпла.
var companies = (["companyOne": "Apple", "companyTwoo": "IBM"])
print(companies)
companies.updateValue("Google", forKey: "companyThree")
print(companies.values)
companies.removeValue(forKey: "companyThree")
print(companies.values)

// 11 - Создайте 3 константы имя, фамилия, отчество и объедените их в новом кортеже.
let name = "Ivan"
let surname = "Petrov"
let patronymic = "Ivanovich"

let fullName = (name, surname, patronymic)
print(fullName)

// 12 - Написать является ли тюпл коллекцией как массив и словарь.
//Кортеж это не коллекция и не массив это просто группа данных, составной тип данных.
