private extension Character {
    func isVowel() -> Bool {
        return self == "a" || self == "A" || self == "e" || self == "E" || self == "i" || self == "I" || self == "o" || self == "O" || self == "u" || self == "U"
    }
}

class Solution {
    func reverseVowels(_ s: String) -> String {
        var result = Array(s)
        var vowelIndexes: [Int] = []
        var vowelStr: [Character] = []
        var i = 0
        for (index, ch) in s.enumerated() {
            if ch.isVowel() {
                vowelIndexes.append(index)
                vowelStr.insert(ch, at: 0)
            } 
        }
        for index in vowelIndexes {
            result[index] = vowelStr[i]
            i += 1
        }
        return String(result)
    }
}