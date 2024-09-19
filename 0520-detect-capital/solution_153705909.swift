extension Character {
  func isUpper() -> Bool {
    switch self {
        case "A"..."Z":
            return true
        default:
            return false
    }
  }
}

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        guard word.count > 1 else {
            return true
        }
        let oneIndex = word.index(word.startIndex, offsetBy: 1)
        return word[oneIndex...].lowercased() == word[oneIndex...] || word.uppercased() == word
    }
    // func detectCapitalUse(_ word: String) -> Bool {
    //     let chars = Array(word)
    //     guard chars.count > 1 else {
    //         return true
    //     }
    //     let firstChar = chars[0]
    //     let upperFirst = firstChar.isUpper()
    //     let lastChar = chars[chars.count - 1]
    //     let upperLast = lastChar.isUpper()
    //     switch(upperFirst, upperLast) {
    //         case (false, false):
    //             for i in 1..<chars.count - 1 {
    //                 if chars[i].isUpper() {
    //                     return false
    //                 }
    //             }
    //         case (false, true): return false
    //         case (true, false):
    //             for i in 1..<chars.count - 1 {
    //                 if chars[i].isUpper() {
    //                     return false
    //                 }
    //             }
    //         case (true, true):
    //             for i in 1..<chars.count - 1 {
    //                 if !chars[i].isUpper() {
    //                     return false
    //                 }
    //             }
    //     }
    //     return true
    // }
}