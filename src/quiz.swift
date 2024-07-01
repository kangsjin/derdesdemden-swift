func printQuize(case targetCase: Cases, gender targetGender: Genders, shuffle: Bool? = false, remark: String? = "         ", hint: Bool? = true, article targetArticle: QuizType) -> String {
    var genderOrderCopy = GENDER_ORDER
    var caseOrderCopy = CASE_ORDER

    if(shuffle == true){
        genderOrderCopy.shuffle()
        caseOrderCopy.shuffle()
    }
    //header
    printRowSep()
    print("| " + Colors.yellow + remark!.padding(toLength: PADDING_LENGTH, withPad:" ", startingAt: 0) + Colors.reset + " | ", terminator: "")
    for gender: Genders in genderOrderCopy{
        if(hint == false && gender != targetGender){
            print("".padding(toLength: PADDING_LENGTH, withPad:" ", startingAt: 0) + " | ", terminator: "")
        }else{
            print(gender.rawValue.padding(toLength: PADDING_LENGTH, withPad:" ", startingAt: 0) + " | ", terminator: "")
        }
    }
    print("")
    printRowSep()

    //row by case
    for _case: Cases in caseOrderCopy {
        
        print("| ", terminator: "")
        if(hint == false && _case != targetCase){
            print("".padding(toLength: PADDING_LENGTH, withPad: " ", startingAt: 0) + " | ", terminator: "")
        }else{
            print("\(String(describing: _case).prefix(3))(\(_case.rawValue))".padding(toLength: PADDING_LENGTH, withPad: " ", startingAt: 0) + " | ", terminator: "")
        }
        for gender in genderOrderCopy{
            if(_case == targetCase && gender == targetGender){
                    print(Colors.red + "?" + Colors.reset + "         | ", terminator: "")
            }else{
                if(hint == false){
                    print("".padding(toLength: PADDING_LENGTH, withPad: " ", startingAt: 0) + " | ", terminator: "")
                }else{
                    print((ARTICLE_ORDER[targetArticle.rawValue]![gender]![_case.rawValue - 1]).padding(toLength: PADDING_LENGTH, withPad: " ", startingAt: 0) + " | ", terminator: "")
                }
            }
        }
        print("")
    }
    printRowSep()
    return ARTICLE_ORDER[targetArticle.rawValue]![targetGender]![targetCase.rawValue - 1]
}