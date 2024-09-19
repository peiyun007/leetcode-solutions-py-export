class Solution {
    func findWords(_ words: [String]) -> [String] {
        var result = [String]()
        let sample = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
        var map = [String: Int]()
        for (index, str) in sample.enumerated() {
            for char in str {
                map[String(char)] = index
            }
        }
        for word in words {
            if word == "" {
                continue
            }
            let index = map[String(word[word.startIndex]).uppercased()] ?? 0
            var same = true
            for w in word {
                let currentRow = map[String(w).uppercased()] ?? 0
                if currentRow != index {
                    same = false
                    break
                }
            }
            if same {
                result.append(word)
            }
        }
        return result
    }
}