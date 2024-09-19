class Solution {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var ans = [Int]()
        for (i, w) in words.enumerated() {
            for ch in w {
                if ch == x {
                    ans.append(i)
                    break
                }
            }
        }
        return ans
    }
}