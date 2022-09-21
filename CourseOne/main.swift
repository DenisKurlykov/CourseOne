//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

let a = """
Мечтая о могучем даре
Того, кто русской стал судьбой,
Стою я на Тверском бульваре,
Стою и говорю с собой.
"""


var name = "Denis"
let surname = "Kurlykov"
let age = 42


for char in name {
    //print(char)
    print(char, terminator: "") // Не могу разобраться как в данной строке сделать перенос строки? А то в консоли слова сливаются в одну строку.
    
    
}


var fullName = name + " " + surname
print(fullName)

fullName += "возраст \(age)"
print(fullName)

var str = "hello  there!"
str.remove(at: str.firstIndex(of: " ")!)

let reversStr = String(str.reversed())
print(reversStr)

if str.contains("o") {
    print("В слове \(str) есть буква \"О\"")
}

let time = "23:51:01"
let values = time.components(separatedBy: ":")
print(values)

var pi: Float = 3.14159
print(String(format: "%.2f", pi))

var upperString = "AaBbCc"
print(upperString.uppercased())

upperString.removeFirst()
upperString.removeLast()
print(upperString)

upperString.append("!x")
print(upperString)


