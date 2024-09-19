class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var charsMap = [Character: Int]()
        var res = 0
        for ch in chars {
            charsMap[ch] = (charsMap[ch] ?? 0) + 1
        }
        var flag = true
        var wordMap = [Character: Int]()
        for word in words {
            flag = true
            wordMap = [:]
            for w in word {
                wordMap[w] = (wordMap[w] ?? 0) + 1
                if (wordMap[w] ?? 0) > (charsMap[w] ?? 0) {
                    flag = false
                    break
                }
            }
            if flag {
                res += word.length
            }
        }
        return res
    }
}