private extension Character {
    func isLetter() -> Bool {
        switch(self) {
        case "a"..."z": return true
        case "A"..."Z": return true
        default: return false
        }
    }
}
class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var maxCountKey = ""
        var maxCount = 0
        var substr = ""
        var countMap: [String: Int] = [:]
        let charArr = Array(paragraph)
        for (index, ch) in charArr.enumerated() {
            if ch.isLetter() {
                substr += String(ch).lowercased()
            }
            if index == charArr.count - 1 || !ch.isLetter()
            {
                if substr.count > 0 && !banned.contains {$0.lowercased() == substr.lowercased()} {
                    if var x = countMap[substr] {
                        x += 1
                        countMap[substr] = x
                    } else {
                        countMap[substr] = 1
                    }
                    if let x = countMap[substr], x > maxCount{
                        maxCountKey = substr
                        maxCount = x
                    }
                }
                substr = ""
            }
        }
        return maxCountKey
    }
}