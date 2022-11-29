//
//  main.swift
//  CourseOne
//
//  Created by Денис Курлыков on 19.09.2022.
//

import Foundation

//2) Постарайтесь по больше по практиковаться, повторите то, что есть в видео.
class MediaOne {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class FilmOne: MediaOne {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Music: MediaOne {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let mediaArray: [MediaOne] = [
    FilmOne(name: "Casablanca", director: "Michael"),
    Music(name: "Blue Shoes", artist: "Elvis Presli"),
    FilmOne(name: "Kane", director: "Ivanov"),
    Music(name: "The Only", artist: "Petrov"),
    FilmOne(name: "Never Gonna", director: "Sidorov")
]

var count = (musicCount: 0, filmCount: 0)

for value in mediaArray {
    if value is FilmOne {
        count.filmCount += 1
    } else if value is Music {
        count.musicCount += 1
    }
}

print("В нашем плеере находится фильмов \(count.filmCount), музыки \(count.musicCount)")

for value in mediaArray {
    if let musics = value as? Music {
        print("Songs \(musics.name) by \(musics.artist)")
    } else if let films = value as? FilmOne {
        print("Movies \(films.name) by \(films.director)")
    }
}

//3) Я как заказчик даю вам разработчику задания сделать : Библиотеку книг и видео библиотеку фильмов Реализовать:
// **** 3.1 Возможность добавлять новые книги и фильмы и после добавления должна происходить автоматическая сортировка по алфавиту в пределах жанра.
// **** 3.2 Метод- "Sort by mood" - фильмы должны быть отсортировать по настроению.
// **** 3.3 Такой же метод придумать для книг.
// **** 3.4 Возможность удалять книги.
// **** 3.5 Выводить количество фильмов и книг в библиотеке
// ? 3.6 Выводить количество книг по жанрам
// ? 3.7 Выводить количество фильмов по жанрам
// **** 3.8 Выводить уведомление о местонахождении книги, фильма (на руках, в библиотеке)
//3.9 У каждой книги и фильма должны быть запись о людях, бравших ее ранее с указанием имени, даты выдачи и даты возврата.
//3.10 Метод, который выводит адрес библиотеки и контактные данные.
//3.11 Предусмотреть механизм, запрещающий выдачу отсутствующих и забранных книг.
//3.12 Одному человеку запрещается иметь на руках более 5 книг, и более 3 фильмов.



class Media {
    enum Available {
        case inLibrary
        case onHand
    }
    
    enum Rating: Int {
        case oneStar = 1
        case twoStars = 2
        case treeStars = 3
        case forStars = 4
        case fiveStars = 5
    }
    
    enum Category: String, CaseIterable{
        case action
        case comedy
        case drama
        case fantasy
        case horror
        case mystery
        case romance
        case thriller
        case western
    }
    
    // MARK: - Public properties
    let name: String
    let rating: Rating
    let category: Category
    var available: Available = .inLibrary
    
    // MARK: - Initializers
    init(name: String, category: Category, rating: Rating) {
        self.name = name
        self.category = category
        self.rating = rating
    }
}

class Book: Media { }

class Film: Media { }

class User {
    // MARK: - Public properties
    let name: String
    let surname: String
    var numberOfBooks = 0
    var numberOfFilms = 0

    var fullName: String {
        name + surname
    }

    // MARK: - Initializers
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

final class Library {
    // MARK: - Public properties
    var user: [User] = []
    var books: [Book] = []
    var films: [Film] = []
    var customerJournal = [String: (books: Int, films: Int)]()
    
    var history: [(name: String, date: String)] = []
    
    // MARK: - Initializers
    
    // MARK: - Public methods
    func addNewBook(book: Book) {
        books += [book]
        books.sort { $0.category.rawValue < $1.category.rawValue && $0.name < $1.name }
    }
    
    func addNewFilm(film: Film) {
        films.append(film)
        films.sort { $0.category.rawValue < $1.category.rawValue && $0.name < $1.name }
    }
    
    func totalCountFilmsBooks() {
        return print("В библиотеке фильмов - \(films.count), книг \(books.count)")
    }
    
    
    func removeFilm(name: String) {
        if let indexFilm = films.firstIndex(where: { $0.name == name }) {
            films.remove(at: indexFilm)
        } else {
            print("Фильм не найдена")
        }
    }
    
    func removeBook(name: String) {
        if let indexBook = books.firstIndex(where: { $0.name == name }) {
            books.remove(at: indexBook)
        } else {
            print("Книга не найдена")
        }
    }
    
    func sortByRatingFilms() {
        var array: [String] = []
        films.sort { $0.rating.rawValue > $1.rating.rawValue }
        for value in films {
            array.append(value.name)
        }
        return print(array)
    }
    
    func sortByRatingBooks() {
        var array: [String] = []
        books.sort { $0.rating.rawValue > $1.rating.rawValue }
        for value in books {
            array.append(value.name)
        }
        return print(array)
    }
    
    func countFilmsByCategory() {
        var count = 0
        var categoryCount: [Media.Category: Int] = [:]
        for category in Media.Category.allCases {
            for film in films {
                if film.category == category {
                    categoryCount[category] = count
                    count += 1
                    print(categoryCount)
                }
            }
        }
    }
    
    func availabilityFilm(for mediaName: String) {
        if (films.firstIndex(where: { $0.name == mediaName && $0.available == .inLibrary }) != nil) {
            print("Фильм <\(mediaName)> в библиотеке")
        } else if films.firstIndex(where: { $0.name == mediaName && $0.available == .onHand }) != nil{
            print("Фильм <\(mediaName)> на руках")
        } else {
            print("Фильм <\(mediaName)> не существует")
        }
    }
    
    func availabilityBook(for mediaName: String) -> Bool{
        if (books.firstIndex(where: { $0.name == mediaName && $0.available == .inLibrary }) != nil) {
            print("Книга <\(mediaName)> в библиотеке")
            return true
        } else if books.firstIndex(where: { $0.name == mediaName && $0.available == .onHand }) != nil {
            print("Книга <\(mediaName)> на руках")
            return false
        } else {
            print("Фильм <\(mediaName)> не существует")
            return false
        }
    }
    
    func takeBook(nameBook: String, client: User) {
        let value = availabilityBook(for: nameBook)
    }
    
    func takeFilm(nameFilm: String, client: User) {
        availabilityFilm(for: nameFilm)
    }
}

let library = Library()
library.addNewBook(book: Book(name: "Азазель", category: .action, rating: .fiveStars))

library.addNewFilm(film: Film(name: "Достучаться до небес", category: .drama, rating: .fiveStars))
library.addNewFilm(film: Film(name: "Час пик", category: .comedy, rating: .forStars))
library.addNewFilm(film: Film(name: "Американский пирог", category: .comedy, rating: .twoStars))

library.sortByRatingFilms()
library.sortByRatingBooks()

//library.availabilityFilm(for: "Достучаться до небес")

library.takeFilm(nameFilm: "Достучаться до небес", client: User(name: "Иван", surname: "Иванов"))

