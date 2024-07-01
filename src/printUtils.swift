import Foundation

func showIntro() {
    print(Colors.green)
    print("___  ____ ____    ___  ____ ____    ___  ____ _  _    ___  ____ _  _")
    print("|  \\ |___ |__/    |  \\ |___ [__     |  \\ |___ |\\/|    |  \\ |___ |\\ |")
    print("|__/ |___ |  \\    |__/ |___ ___]    |__/ |___ |  |    |__/ |___ | \\|")
    print("")
    print(Colors.reset)
    print("                                                  Created by SJ Kang")
    print("")
}

func printRowSep(){
    print("+-----------+-----------+-----------+-----------+-----------+")
}

func printRowByLength(max: Int, content: [String?]){
    print("| ", terminator: "")
    if(!content.isEmpty){
        for ce in content {
        print(ce!.padding(toLength: max, withPad: " ", startingAt: 0) + " | ", terminator: "")
        }
    }
    print("")
}

func printSepRowByLength(max: Int, column: Int){
    print("+", terminator: "")
    for _ in 0...(column-1){
        for _ in 0...(max+1){
            print("-", terminator: "")
        }
        print("+", terminator: "")
    }
    print("")
}

func printDictionaryTable(data:[String:String?]){
    //key가져오기
    var newArr: [String?] = []
    newArr += Array(data.keys)
    newArr += Array(data.values)

    var b = newArr.map() { $0!.count}
    b.sort(by: { $0 > $1})

    let max = b[0]

    //가장 큰 값 뽑아내기 
    let sortedKeysData = data.keys.sorted(by: <)
    printSepRowByLength(max: max, column: data.keys.count)
    printRowByLength(max: max, content: Array(sortedKeysData))
    printSepRowByLength(max: max, column: data.keys.count)
    let val = sortedKeysData.map({ data[$0] ?? "" })
    printRowByLength(max: max, content: val)
    printSepRowByLength(max: max, column: data.keys.count)
}

func printRow(data: [String]) -> String {
    var rowString: String = "| "
    for idx in 0...(data.count-1) {
        rowString += "\(data[idx].padding(toLength: 9, withPad: " ", startingAt: 0)) | "
    }
    return rowString 
}
