extension String {
    subscript(idx: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: idx)]
    }
}

class Solution {
    private func isSubsequence(_ s: String, _ t: String) -> Bool {
        var j = 0
        for i in 0..<t.count where j < s.count {
            if t[i] == s[j] {
                j += 1
            }
        }
        if j == s.count {
            return true
        }
        return false
    }

    func longestStrChain(_ words: [String]) -> Int {
        let wordsSorted = words.sorted { $0.count < $1.count }
        var dp = Array(repeating: 1, count: wordsSorted.count)
        var ans = 1
        for i in 1..<wordsSorted.count {
            for j in 0..<i {
                if wordsSorted[j].count+1 == wordsSorted[i].count && isSubsequence(wordsSorted[j], wordsSorted[i]) {
                    dp[i] = max(dp[i], dp[j]+1)
                }
            }
            ans = max(ans, dp[i])
        }
        return ans
    }
}