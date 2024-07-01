enum Colors {
    static let reset = "\u{001B}[0;0m"
    static let black = "\u{001B}[0;30m"
    static let red = "\u{001B}[0;31m"
    static let green = "\u{001B}[0;32m"
    static let yellow = "\u{001B}[0;33m"
    static let blue = "\u{001B}[0;34m"
    static let magenta = "\u{001B}[0;35m"
    static let cyan = "\u{001B}[0;36m"
    static let white = "\u{001B}[0;37m"
}

enum Genders: String {
    case Masculine = "Masculine"
    case Faminine = "Faminine"
    case Neuter = "Neuter"
    case Plural = "Plural"
}

enum Mode: Int, CaseIterable {
    case fixed = 1
    case shuffled = 2
}

enum Hint: Int, CaseIterable {
    case show = 1
    case hidden = 2
}

enum QuizType: Int, CaseIterable {
    case definite = 1
    case indefinite = 2
    case negative = 3
}

let GENDER_ORDER: [Genders] = [
    Genders.Masculine, Genders.Faminine, Genders.Neuter, Genders.Plural
]

enum Cases: Int {
    case Nominative = 1
    case Genitive = 2
    case Dative = 3
    case Akkusative = 4
}

let CASE_ORDER: [Cases] = [Cases.Nominative, Cases.Genitive, Cases.Dative, Cases.Akkusative]

let DEFINITE_DATA: [Genders:[String]] = [
    .Masculine: ["der", "des", "dem", "den"],
    .Plural: ["die", "der", "den", "die"],
    .Neuter: ["das", "des", "dem", "das"],
    .Faminine: ["die", "der", "der", "die"],
]

let INDEFINITE_DATA: [Genders:[String]] = [
    .Masculine: ["ein", "eines", "einem", "einen"],
    .Plural: ["viele", "vieler", "vielen", "viele"],
    .Neuter: ["ein", "eines", "einem", "ein"],
    .Faminine: ["eine", "einer", "einer", "eine"],
]

let NEGATIVE_DATA: [Genders:[String]] = [
    .Masculine: ["kein", "keines", "keinem", "keinen"],
    .Plural: ["keine", "keiner", "keinen", "keine"],
    .Neuter: ["kein", "keines", "keinem", "kein"],
    .Faminine: ["keine", "keiner", "keiner", "keine"],
]

let ARTICLE_ORDER = [nil, DEFINITE_DATA, INDEFINITE_DATA, NEGATIVE_DATA]

let PADDING_LENGTH: Int = 9

struct Quiz {
    var gender: Genders
    var _case: Cases
}
