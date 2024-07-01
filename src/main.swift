import Foundation

showIntro()

let mode = getEnumValue(ofType: Mode.self, prompt: "Do you prefer \(Colors.blue)(1)fixed tables\(Colors.reset) or \(Colors.blue)(2)shuffled tables\(Colors.reset) each time?")
let hint = getEnumValue(ofType: Hint.self, prompt: "Do you want to see the table contents as \(Colors.blue)(1)hints\(Colors.reset), or keep them \(Colors.blue)(2)hidden\(Colors.reset)?")
let quizType = getEnumValue(ofType: QuizType.self, prompt: "Which articles do you want to practice? \(Colors.blue)(1) Definite (2) Indefinite (3) Negative\(Colors.reset)")
let quizeNumber = getNumberRange(prompt: "\(Colors.blue)How many questions\(Colors.reset) do you want to practice? (up to 100)", range: 1...100)

print("\nOkay good, I created random \(quizeNumber) questions for you. Let's get started!\n")

var solvedQuizNumber: Int = 1
var wrongQuize: [WorngData] =  []
while(solvedQuizNumber <= quizeNumber){
    let randomCase = CASE_ORDER[(Int.random(in: 0...(CASE_ORDER.count-1)))]
    let randomGender = GENDER_ORDER[Int.random(in: 0...(GENDER_ORDER.count-1))]
    
    var pass = false
    while(pass == false){
        let correctAnswer = printQuize(case: randomCase, gender: randomGender, shuffle: mode == .shuffled ? true : false, remark: "\(solvedQuizNumber) of \(quizeNumber)", hint: hint == .show ? true : false, article: quizType)
        print("Your answer > ", terminator: "") 
        if let userAnswer = readLine() {
            clearConsole()
            if(userAnswer == correctAnswer){
                print(Colors.green + "Correct! Next.." + Colors.reset)
                pass = true
            }else{
                print("\(Colors.red)Wrong, Try Again!\(Colors.reset) The correct answer starts with an \(ARTICLE_ORDER[quizType.rawValue]![randomGender]![randomCase.rawValue - 1].prefix(1))")
                let worng = WorngData(wongGender: randomGender, worngCase: randomCase)
                wrongQuize.append(worng)
            }
        }
    }    

    solvedQuizNumber += 1
}
clearConsole()
print("\(Colors.yellow)You have completed all the quizzes.\(Colors.reset) Enter any key to end > ", terminator: "")
_ = readLine()
clearConsole()

var message = "";
if (wrongQuize.isEmpty){
    message = "Perfect! You have answered all the questions correctly."
} else {
    message = "Well done! I think you need to practice the following forms more."
}
print("══════════════════════════════════════════════════════════════════");
print(message)
print("══════════════════════════════════════════════════════════════════");
for q in wrongQuize{
    print(">\(Colors.red) \(q.wongGender.rawValue)-\(q.worngCase)(\(q.worngCase.rawValue))\(Colors.reset) which is \(Colors.yellow)\(DEFINITE_DATA[q.wongGender]![q.worngCase.rawValue - 1]) \(Colors.reset)")
}