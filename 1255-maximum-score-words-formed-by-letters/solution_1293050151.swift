class Solution {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        let n = words.count
        var ans = 0
        var left = [Character: Int]()
        for ch in letters {
            left[ch, default: 0] += 1
        }
        dfs(n-1, 0)
        return ans

        func dfs(_ i: Int, _ total: Int) {
            if i < 0 {
                ans = max(ans, total)
                return
            }
            dfs(i-1, total)

            var leftBegin = left
            let word = words[i]
            var ok = true
            var sc = 0
            for ch in word {
                let cnt = left[ch, default: 0]
                if cnt == 0 {
                    ok = false
                    break
                }
                sc += score[getInt(ch)]
                left[ch, default: 0] -= 1
            }
            if ok {
                dfs(i-1, total + sc)
            }
            left = leftBegin
        }
    }

    func getInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}