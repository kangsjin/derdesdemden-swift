func clearConsole(){
    print("\u{1B}[2J")
    print("\u{1B}[H")
}

func getEnumValue<T: RawRepresentable & CaseIterable>(ofType type: T.Type, prompt: String) -> T where T.RawValue == Int {    
    print("\(prompt) \(T.allCases.map { $0.rawValue }) > ", terminator: "")

    guard let input = readLine(), let intValue = Int(input), let value = T(rawValue: intValue) else {
        print("\(Colors.red)Invalid input. Valid options are: \(T.allCases.map { $0.rawValue })\(Colors.reset)")
        return getEnumValue(ofType: type, prompt: prompt)
    }
    return value
}

func getNumberRange(prompt: String, range: ClosedRange<Int>) -> Int {
    print("\(prompt) > ", terminator: "")

    guard let input = readLine(), let intValue = Int(input), range.contains(intValue) else {
        print("\(Colors.red)Invalid input. Valid options are: \(range.first!) ~ \(range.last!)\(Colors.reset)")
        return getNumberRange(prompt: prompt, range: range)
    }
    return intValue
}