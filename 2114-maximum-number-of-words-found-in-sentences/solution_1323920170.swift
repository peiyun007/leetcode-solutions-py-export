class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        var ans = 0
        for sentence in sentences {
            let words = sentence.split(separator: " ")
            ans = max(ans, words.count)
        }
        return ans
    }
}