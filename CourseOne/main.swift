//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

// 1) Повторите то, что было в видео.
for i in 0...200 {
    if i == 10 {
        break
    }
    print(i)
}

var day = 6
if day == 1 {
    print("Будний день")
} else if day == 2 {
    print("Будний день")
} else if day == 3 {
    print("Будний день")
} else if day == 4 {
    print("Будний день")
} else if day == 5 {
    print("Будний день Пятница")
} else if day == 6 {
    print("Выходной день")
} else if day == 7 {
    print("Выходной день")
}

switch day {
case 1...4:
    print("Будний день")
case 5:
    print("Будний день Пятница")
case 6...7:
    print("Выходной день")
default:
    break
}

let nameWork = "SwiftDev"
let age = 51
let peopleSex = "M"

switch (nameWork, age) {
case (_, 1...17):
    print("Ты маловат")
case ("SwiftDev", 18...50) where peopleSex == "W":
    print("Вы не подходите ")
case ("SwiftDev", 18...50) where peopleSex == "M":
    print("Вы подходите")
case let(name, age):
    print("\(name) в \(age) год?") // value banding
default:
    print("Введите корректные данные")
}
print(" ")

// 3) Создать цикл в цикле. В первом цикле интервал 200 раз во втором как дойдем до 15 выйти со всех циклов сразу.
for cycleOne in 1...200 {
  print("Cycle1: \(cycleOne)")
    for cycleTwo in 1...300 {
      print("Cycle2:  \(cycleTwo)")
        if cycleTwo == 15 {
            break
        }
   }
    break
}
print(" ")

// 4) Создать обработку возраста в switch, если человеку от 6 до 17 то выводить, что ему пора нужно в школу, если от 18 до 25, то в универ и так далее, аж до пенсии.
var yourAge = 46
let yourSaving = 1_000

switch yourAge {
case 6...17:
    print("Вам пора в школу")
case 18...25:
    print("Учиться и учиться как зпвещал великий Ленин")
case 26...40 where yourSaving >= 1_000_000:
    print("Вы заработали на заслуженный отпуск, Мальдивы ждут Вас")
case 41...64 where yourSaving >= 1_000_000:
    print("Вы заработали на заслуженный отпуск, Мальдивы ждут Вас")
case 65:
    print("Отправляйтесь в отпуск, если нет денег не переживайте государство позаботиться о Вас, но это не точно")
default:
    print("Вам необходимо работать. Отпуск уже рядом, а денег как небыло так и нет")
}
print(" ")

// 5) Сделать 4 е задание через if конструкцию.
if yourAge > 6 && yourAge <= 17 {
    print("Вам пора в школу")
} else if yourAge <= 25 {
    print("Учиться и учиться как зпвещал великий Ленин")
} else if yourAge <= 40 || yourSaving >= 1_000_000 {
    print("Вы заработали на заслуженный отпуск, Мальдивы ждут Вас")
} else if yourAge < 65 {
    print("Вы заработали на заслуженный отпуск, Мальдивы ждут Вас")
} else if yourAge > 65 {
    print("Отправляйтесь в отпуск, если нет денег не переживайте государство позаботиться о Вас, но это не точно")
} else {
    print("Вам необходимо работать. Отпуск уже рядом, а денег как небыло так и нет")
}
print(" ")

// 6) Создать switch, который принимает сразу точку по x и y например (1, 1) и написать условие если x,y по 0 то выводить x,y и написать, что это точка origin, если значение (1, 0), то выводим точку и говорим вы на оси x, (0, 1) вы на оси y, если x и y от -2 до 2 то писать вы внутри координат.
let point = (1, 0)

switch point {
case (0, 0):
    print("\(point) это точка origin")
case (1, 0):
    print("Точка Х\(point.0), вы на оси Х")
case (0, 1):
    print("Точка Y\(point.1), вы на оси Y")
case (-2...2, -2...2):
    print("Вы внутри координат")
default:
    break
}


// 7) Написать switch в котором 3 кейса 1,2,3 с принтами этих индексов. Когда мы передаем 1 индекс печатать принт 1 го кейса, а когда передаем 2 й индекс то печатать сразу принт 2- го и 3-го кейса.
let value = 2
switch value {
case 1:
    print("Привет")
case 2:
    print("Как тебя")
    fallthrough
case 3:
    print("Зовут?")
default:
    break
}

// 8) Придумать свой switch в котором будет 3 кейса и в одном из ник доп. условие с оператором where.
// Смотри задание 5.

// 9) Создайте переменную с значением 10 и через цикл while печатайте свое имя пока значение не станет 0.
var number = 10
let myName = "Denis"

while number != 0 {
    number -= 1
    print(myName)
}
