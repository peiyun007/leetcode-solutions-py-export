class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var counterMap = [Character: Int]()
        for ch in text {
            if ch == "b" || ch == "a" || ch == "l" || ch == "o" || ch == "n" {
                counterMap[ch] = (counterMap[ch] ?? 0) + 1
            }
        }
        var res = counterMap["b"] ?? 0
        res = min(res, counterMap["a"] ?? 0)
        res = min(res, (counterMap["l"] ?? 0) / 2)
        res = min(res, (counterMap["o"] ?? 0) / 2)
        res = min(res, counterMap["n"] ?? 0)
        return res
    }
}